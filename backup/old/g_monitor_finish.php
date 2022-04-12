<?php
	include_once "setting.properties";
	include_once _INC_DIR . "carrier.inc";
	include_once _INC_DIR . "global.inc";

	include_once _CLS_DIR . "SPFWLog.cls";
	include_once _CLS_DIR . "SPFWTemplate.cls";
	include_once _CLS_DIR . "SPFWDate.cls";
	include_once _CLS_DIR . "SPFWInputCheck.cls";
	include_once _CLS_DIR . "SPFWListObject.cls";
	include_once _CLS_DIR . "SPFWDatabase.cls";
	include_once _CLS_DIR . "SPUSUser.cls";
	include_once _CLS_DIR . "SPUSShop.cls";
	include_once _CLS_DIR . "SPUSMonitor.cls";
	include_once _CLS_DIR . "SPUSFolder.cls";

	// データベースコネクト
	$myDB = new SPFWDatabase(_MAIN_DB, _HOST_NAME, _USER_NAME, _PASSWD, FALSE);
	if (!$myDB->Connection)
		trigger_error("SPFWDatabase Failed.", E_USER_ERROR);

	########################################################
	# 入力チェック
	########################################################

	if ($rKey == NULL) {
		$URL = _MAIN_URL . 'login_form.php';
		header('Location: ' . $URL);
		exit;
	}

	########################################################
	# 認証動作
	########################################################

	$myUser = new User($myDB);

	if (!$myUser->doAuthenticationByRegistKey($rKey))
		trigger_error("doAuthentication Failed.", E_USER_ERROR);

	if ($myUser->UserCD == -1) {
		$URL = _MAIN_URL . 'login_form.php';
		header('Location: ' . $URL);
		exit;
	}

	$UserCD = $myUser->UserCD;




	########################################################
	# 登録処理
	########################################################


if($work == 1){#��

	$myMonitor = new Monitor($myDB);

	if ($editMonitorCD > 0) { #編集の場合

		if (!$myMonitor->executeSelect("MonitorCD = '" .$editMonitorCD."'", "") || $myMonitor->RecCnt != 1){
			$ErrorString = array();
			$ErrorString[] = "設定ファイル情報の抽出に失敗しました。";
			showAdminSorryPage($ErrorString);
		}

		$myMonitor->MonitorCD = $editMonitorCD;
		$myMonitor->GenbaCD = $GenbaCD;

	} else {

		//現場CDのランダムな文字列作る
		$myListObject = new SPFWListObject($myDB);

		$sql = "SELECT ";
		$sql .= "MonitorCD ";

		$myListObject->SelectSQL = $sql;

		$sql = " FROM tMonitorM";

		$myListObject->Condition = $sql;
		$myListObject->Order = "1";
		$myListObject->Limit = "allpage";

		if (!($myListObject->GetList(1)))
			trigger_error("Getting Menu List Failed.", E_USER_ERROR);

		$MonitorLoop = $myListObject->Rows;
		$MonitorLoop = "$MonitorLoop" + "1";

		$GenbaNo = "1000" + "$MonitorLoop";

		//生成する文字数
		$length = 4;
		 
		//使用する文字
		$char = 'abcdefghijklmnopqrstuvwxyz';
		 
		$charlen = mb_strlen($char);
		$result = "";
		 
		for($i=1;$i<=$length;$i++){
		  $index = mt_rand(0, $charlen - 1);
		  $result .= mb_substr($char, $index, 1);
		}

		$GenbaCD = $GenbaNo.$result;//ランダムで生成した文字列
		$myMonitor->GenbaCD = $GenbaCD;


		$myMonitor->MonitorCD = -1;

		$myMonitor->Creator = $UserCD;
	}

	$myMonitor->MonitorName = $MonitorName;
	$myMonitor->Basyo = $Basyo;
	$myMonitor->TempCD = $TempCD;
	$myMonitor->Telop = $Telop;
	$myMonitor->CameraURL1 = $CameraURL1;
	$myMonitor->CameraURL2 = $CameraURL2;
	$myMonitor->KojiStart = $KojiStart;
	$myMonitor->KojiEnd = $KojiEnd;
	$myMonitor->TenkiCD = $TenkiCD;
	$myMonitor->Updater = $UserCD;

	if ( !$myMonitor->executeUpdate() ){
		$ErrorString = array();
		$ErrorString[] = "情報の更新に失敗しました。";
		showAdminSorryPage($ErrorString);
		$IfError = true;
	} else {
		$IfOK = true;
	}
	unset($myMonitor);


	if (!$editMonitorCD > 0) { #新規の場合



		//フォルダーを作るために、今新規で作ったモニターCDを取得
		$myListObject = new SPFWListObject($myDB);

		$sql = "SELECT ";
		$sql .= "Max(MonitorCD) ";

		$myListObject->SelectSQL = $sql;

		$sql = " FROM tMonitorM";
		$sql .= " WHERE MukouFlg = FALSE";

		$myListObject->Condition = $sql;
		$myListObject->Order = "1";
		$myListObject->Limit = "allpage";

		if (!($myListObject->GetList(1)))
			trigger_error("Getting Menu List Failed.", E_USER_ERROR);

			$wMonitorCD = $myListObject->GetValue(0, 0);



		//フォルダーをDBに作成

		$myFolder = new Folder($myDB);


	    for( $i = 1; $i < 11; $i++ ){
			$myFolder->FolderCD = -1;
			$myFolder->Creator = $UserCD;
			$myFolder->Updater = $UserCD;
			$myFolder->FolderName = "閲覧".$i;
			$myFolder->MonitorCD = $wMonitorCD;
			$myFolder->TegakiFlg = "0";

			if ( !$myFolder->executeUpdate() ){
				$ErrorString = array();
				$ErrorString[] = "情報の更新に失敗しました。";
				showAdminSorryPage($ErrorString);
				$IfError = true;
			}
			$FolderCD1[$i] = $myFolder->FolderCD;

		}

/*	    for( $i = 1; $i < 3; $i++ ){
			$myFolder->FolderCD = -1;
			$myFolder->Creator = $UserCD;
			$myFolder->Updater = $UserCD;
			$myFolder->FolderName = "手書き".$i;
			$myFolder->MonitorCD = $wMonitorCD;
			$myFolder->TegakiFlg = "1";

			if ( !$myFolder->executeUpdate() ){
				$ErrorString = array();
				$ErrorString[] = "情報の更新に失敗しました。";
				showAdminSorryPage($ErrorString);
				$IfError = true;
			}
			$FolderCD2[$i] = $myFolder->FolderCD;

		}
*/
		unset($myFolder);


	


		$monitor_path = "./kojifile/".$wMonitorCD;
//		$past_path = "./kojifile/".$wMonitorCD."/past".$wMonitorCD;
		$tpm_path = "./kojifile/".$wMonitorCD."/tmp";

		for( $i = 1; $i < 11; $i++ ){
			$file_path1[$i] = "./kojifile/".$wMonitorCD."/".$FolderCD1[$i];
		}

//		for( $j = 1; $j < 3; $j++ ){

//			$monitor_path = "./kojifile/".$wMonitorCD;
//			$file_path2[$j] = "./kojifile/".$wMonitorCD."/".$FolderCD2[$j];
//		}


		$mask = umask();
		//モニターのフォルダー作る
		umask(000);

#		if(mkdir($monitor_path, 0777)){
		    //作成に成功した時の処理
#		}else{
		    //作成に失敗した時の処理

#		}
		//過去資料のフォルダー作る
//		if(mkdir($past_path, 0777)){
		    //作成に成功した時の処理
//		}else{
		    //作成に失敗した時の処理

//		}
		//tmpのフォルダー作る
#		if(mkdir($tpm_path, 0777)){
		    //作成に成功した時の処理
#		}else{
		    //作成に失敗した時の処理

#		}




		//モニター下のフォルダー作る(閲覧)
		for( $i = 1; $i < 11; $i++ ){

#			if(mkdir($file_path1[$i], 0777)){
			    //作成に成功した時の処理
#			}else{
			    //作成に失敗した時の処理

#			}
		}


		//モニター下のフォルダー作る(手書き)
//		for( $j = 1; $j < 3; $j++ ){

//			if(mkdir($file_path2[$j], 0777)){
			    //作成に成功した時の処理
//			}else{
			    //作成に失敗した時の処理
//			}
//		}
		umask($mask); 
	}
}//word=1 end













	SPFWTemplate::dropValue( 'work' );



	########################################################
	# コンテンツ表示
	########################################################

	$CNT_FILE = basename($_SERVER["SCRIPT_NAME"], ".php") .".tpl";

	$myTemplate = new SPFWTemplate($CNT_FILE, $MyCarrier);
	$HiddenValues = $myTemplate->getValuesToPass();

	$myTemplate->convertTags();
	$myTemplate->outputTemplate();

	unset($myTemplate);
	unset($myLog);
?>
