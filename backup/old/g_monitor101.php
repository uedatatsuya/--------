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
	include_once _CLS_DIR . "SPUSFolder.cls";


	// データベースコネクト
	$myDB = new SPFWDatabase(_MAIN_DB, _HOST_NAME, _USER_NAME, _PASSWD, FALSE);
	if (!$myDB->Connection)
		trigger_error("SPFWDatabase Failed.", E_USER_ERROR);


	$SuperReloadFlg  = $_GET['SuperReloadFlg'];
	if($SuperReloadFlg){
		// $param = rand();
		$length = 10;
		$param = substr(str_shuffle('1234567890abcdefghijklmnopqrstuvwxyz'), 0, $length);
		$_SESSION['randomparams'] = $param;
	}else{
		
		$param = $_SESSION['randomparams'];
	}
	

	########################################################
	# コンテンツ表示
	########################################################

	$Time = time();//画像をアップした際に昔のキャッシュを読み込まないようにするため。

	#とりあえず固定
	//	$MonitorCD = 1;

	// モニターCD取得
	$myListObject = new SPFWListObject($myDB);

	$sql = "SELECT ";
	$sql .= "MonitorCD, ";
	$sql .= "Telop ";
	$myListObject->SelectSQL = $sql;

	$sql = " FROM tMonitorM";
	$sql .= " WHERE MukouFlg = FALSE and GenbaCD = '".$GenbaCD."'";

	$myListObject->Condition = $sql;
	$myListObject->Order = "1";
	$myListObject->Limit = "allpage";

	if (!($myListObject->GetList(1)))
		trigger_error("Getting Menu List Failed.", E_USER_ERROR);

	$MonitorCD = $myListObject->GetValue(0, 0);
	$Telop = $myListObject->GetValue(0, 1);

#とりあえず固定
	#画像なしの場合
//	$NoPic = "<a href=./viewpic.php?MonitorCD=".$MonitorCD." TARGET=_blank >";
	$NoPic = "<img src=viewnopicthumb.php?MonitorCD=".$MonitorCD." width=300 ></a>";



/*

	//フォルダー表示


	$myListObject = new SPFWListObject($myDB);

	$sql = "SELECT ";
	$sql .= "s.ShopName, ";
	$sql .= "f.FolderName, ";
	$sql .= "s.FolderCD, ";
	$sql .= "s.ShopCD, ";
	$sql .= "s.FileExtension ";

	$myListObject->SelectSQL = $sql;

	$sql = " FROM tShopM s, tFolderM f";
	$sql .= " WHERE s.MukouFlg = FALSE and s.MonitorCD = ".$MonitorCD." and f.TegakiFlg = FALSE and s.FolderCD = f.FolderCD";

	$myListObject->Condition = $sql;
	$myListObject->Order = "FolderCD";
	$myListObject->Limit = "allpage";

	if (!($myListObject->GetList(1)))
		trigger_error("Getting Menu List Failed.", E_USER_ERROR);

	$FNameLoop = $myListObject->Rows;

	if($FNameLoop >= 1){
		for ($i = 0; $i < $FNameLoop; $i++) {

			$FolderNo[$i] = $i + 1;
			$fFileName[$i] = $myListObject->GetValue($i, 0);
	//		$fFolderName[$i] = $myListObject->GetValue($i, 1);
			$fFolderCD[$i] = $myListObject->GetValue($i, 2);

			$fShopCD[$i] = $myListObject->GetValue($i, 3);
			$fFileExtension[$i] = $myListObject->GetValue($i, 4);
			$fFolderPic[$i]= "kojifile/".$MonitorCD."/".$fFolderCD[$i]."/".$fShopCD[$i].".".$fFileExtension[$i]."#FitV";
		}
	}

	$myListObject = new SPFWListObject($myDB);

	$sql = "SELECT ";
	$sql .= "FolderName, ";
	$sql .= "FolderCD ";

	$myListObject->SelectSQL = $sql;

	$sql = " FROM tFolderM";
	$sql .= " WHERE MukouFlg = FALSE and MonitorCD = ".$MonitorCD." and TegakiFlg = FALSE ";

	$myListObject->Condition = $sql;
	$myListObject->Order = "FolderCD";
	$myListObject->Limit = "allpage";

	if (!($myListObject->GetList(1)))
		trigger_error("Getting Menu List Failed.", E_USER_ERROR);

	$wFolderLoop = $myListObject->Rows;
	for ($i = 0; $i < $wFolderLoop; $i++) {
		$fFolderName[$i] = $myListObject->GetValue($i, 0);
		$wFolderCD[$i] = $myListObject->GetValue($i, 1);
	}

	$cFolderCD = array_unique($wFolderCD);
	$cFolderCD = array_values($cFolderCD);

	//フォルダー名表示
	$fFolderName = array_unique($fFolderName);
	$fFolderName = array_values($fFolderName);
	$wFolderName1 = $fFolderName[0];
	$wFolderName2 = $fFolderName[1];
	$wFolderName3 = $fFolderName[2];
	$wFolderName4 = $fFolderName[3];
	$wFolderName5 = $fFolderName[4];
	$wFolderName6 = $fFolderName[5];
	$wFolderName7 = $fFolderName[6];
	$wFolderName8 = $fFolderName[7];
	$wFolderName9 = $fFolderName[8];
	$wFolderName10 = $fFolderName[9];
	$FirstPic = $fFolderPic[0];
	$FirstExtension = $fFileExtension[0];
	if($FirstExtension == "pdf"){
		$FirstNo = "2";
	}else{
		$FirstNo = "1";
	}
	if($FNameLoop >= 1){

		for ($i = 0; $i < $FNameLoop; $i++) {
			if($fFolderCD[$i] == $cFolderCD[0]){
				$fFileName1[$i] = $fFileName[$i];
				$fFolderCD1[$i] = $fFolderCD[$i];
				$fFolderPic1[$i] = $fFolderPic[$i];
				$fFileExtension1[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[1]){
				$fFileName2[$i] = $fFileName[$i];
				$fFolderCD2[$i] = $fFolderCD[$i];
				$fFolderPic2[$i] = $fFolderPic[$i];
				$fFileExtension2[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[2]){
				$fFileName3[$i] = $fFileName[$i];
				$fFolderCD3[$i] = $fFolderCD[$i];
				$fFolderPic3[$i] = $fFolderPic[$i];
				$fFileExtension3[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[3]){

				$fFileName4[$i] = $fFileName[$i];
				$fFolderCD4[$i] = $fFolderCD[$i];
				$fFolderPic4[$i] = $fFolderPic[$i];
				$fFileExtension4[$i] = $fFileExtension[$i];


			}else if($fFolderCD[$i] == $cFolderCD[4]){

				$fFileName5[$i] = $fFileName[$i];
				$fFolderCD5[$i] = $fFolderCD[$i];
				$fFolderPic5[$i] = $fFolderPic[$i];
				$fFileExtension5[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[5]){

				$fFileName6[$i] = $fFileName[$i];
				$fFolderCD6[$i] = $fFolderCD[$i];
				$fFolderPic6[$i] = $fFolderPic[$i];
				$fFileExtension6[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[6]){

				$fFileName7[$i] = $fFileName[$i];
				$fFolderCD7[$i] = $fFolderCD[$i];
				$fFolderPic7[$i] = $fFolderPic[$i];
				$fFileExtension7[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[7]){

				$fFileName8[$i] = $fFileName[$i];
				$fFolderCD8[$i] = $fFolderCD[$i];
				$fFolderPic8[$i] = $fFolderPic[$i];
				$fFileExtension8[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[8]){
				$fFileName9[$i] = $fFileName[$i];
				$fFolderCD9[$i] = $fFolderCD[$i];
				$fFolderPic9[$i] = $fFolderPic[$i];
				$fFileExtension9[$i] = $fFileExtension[$i];

			}else if($fFolderCD[$i] == $cFolderCD[9]){

				$fFileName10[$i] = $fFileName[$i];
				$fFolderCD10[$i] = $fFolderCD[$i];
				$fFolderPic10[$i] = $fFolderPic[$i];
				$fFileExtension10[$i] = $fFileExtension[$i];

			}



		}




		//重複削除
		//キーが飛び飛びになっているので、キーを振り直す

		if($fFileName1){
			$fFileName1 = array_unique($fFileName1);
			$fFolderCD1 = array_unique($fFolderCD1);
			$fFolderPic1 = array_unique($fFolderPic1);
			$fFileExtension1 = array_unique($fFileExtension1);
			$fFileName1 = array_values($fFileName1);
			$fFolderCD1 = array_values($fFolderCD1);
			$fFolderPic1 = array_values($fFolderPic1);
			$fFileExtension1 = array_values($fFileExtension1);
			$fFileName1Loop = count($fFileName1);
		}

		if($fFileName2){
			$fFileName2 = array_unique($fFileName2);
			$fFolderPic2 = array_unique($fFolderPic2);
			$fFileExtension2 = array_unique($fFileExtension2);
			$fFileExtension2 = array_values($fFileExtension2);
			$fFileName2 = array_values($fFileName2);
			$fFolderCD2 = array_values($fFolderCD2);
			$fFolderPic2 = array_values($fFolderPic2);
			$fFileName2Loop = count($fFileName2);
		}

		if($fFileName3){
			$fFileName3 = array_unique($fFileName3);
			$fFolderCD3 = array_unique($fFolderCD3);
			$fFolderPic3 = array_unique($fFolderPic3);
			$fFileExtension3 = array_unique($fFileExtension3);
			$fFileExtension3 = array_values($fFileExtension3);
			$fFileName3 = array_values($fFileName3);
			$fFolderCD3 = array_values($fFolderCD3);
			$fFolderPic3 = array_values($fFolderPic3);
			$fFileName3Loop = count($fFileName3);
		}
		if($fFileName4){
			$fFileName4 = array_unique($fFileName4);
			$fFolderCD4 = array_unique($fFolderCD4);
			$fFolderPic4 = array_unique($fFolderPic4);
			$fFileExtension4 = array_unique($fFileExtension4);
			$fFileExtension4 = array_values($fFileExtension4);
			$fFileName4 = array_values($fFileName4);
			$fFolderCD4 = array_values($fFolderCD4);
			$fFolderPic4 = array_values($fFolderPic4);
			$fFileName4Loop = count($fFileName4);
		}
		if($fFileName5){
			$fFileName5 = array_unique($fFileName5);
			$fFolderCD5 = array_unique($fFolderCD5);
			$fFolderPic5 = array_unique($fFolderPic5);
			$fFileExtension5 = array_unique($fFileExtension5);
			$fFileExtension5 = array_values($fFileExtension5);
			$fFileName5 = array_values($fFileName5);
			$fFolderCD5 = array_values($fFolderCD5);
			$fFolderPic5 = array_values($fFolderPic5);
			$fFileName5Loop = count($fFileName5);
		}
		if($fFileName6){
			$fFileName6 = array_unique($fFileName6);
			$fFolderCD6 = array_unique($fFolderCD6);
			$fFolderPic6 = array_unique($fFolderPic6);
			$fFileExtension6 = array_unique($fFileExtension6);
			$fFileExtension6 = array_values($fFileExtension6);
			$fFileName6 = array_values($fFileName6);
			$fFolderCD6 = array_values($fFolderCD6);
			$fFolderPic6 = array_values($fFolderPic6);
			$fFileName6Loop = count($fFileName6);
		}
		if($fFileName7){
			$fFileName7 = array_unique($fFileName7);
			$fFolderCD7 = array_unique($fFolderCD7);
			$fFolderPic7 = array_unique($fFolderPic7);
			$fFileExtension7 = array_unique($fFileExtension7);
			$fFileExtension7 = array_values($fFileExtension7);
			$fFileName7 = array_values($fFileName7);
			$fFolderCD7 = array_values($fFolderCD7);
			$fFolderPic7 = array_values($fFolderPic7);
			$fFileName7Loop = count($fFileName7);
		}
		if($fFileName8){
			$fFileName8 = array_unique($fFileName8);
			$fFolderCD8 = array_unique($fFolderCD8);
			$fFolderPic8 = array_unique($fFolderPic8);
			$fFileExtension8 = array_unique($fFileExtension8);
			$fFileExtension8 = array_values($fFileExtension8);
			$fFileName8 = array_values($fFileName8);
			$fFolderCD8 = array_values($fFolderCD8);
			$fFolderPic8 = array_values($fFolderPic8);
			$fFileName8Loop = count($fFileName8);
		}
		if($fFileName9){
			$fFileName9 = array_unique($fFileName9);
			$fFolderCD9= array_unique($fFolderCD9);
			$fFolderPic9 = array_unique($fFolderPic9);
			$fFileExtension9 = array_unique($fFileExtension9);
			$fFileExtension9 = array_values($fFileExtension9);
			$fFileName9 = array_values($fFileName9);
			$fFolderCD9 = array_values($fFolderCD9);
			$fFolderPic9 = array_values($fFolderPic9);
			$fFileName9Loop = count($fFileName9);
		}

		if($fFileName10){
			$fFileName10 = array_unique($fFileName10);
			$fFolderCD10 = array_unique($fFolderCD10);
			$fFolderPic10 = array_unique($fFolderPic10);
			$fFileExtension10 = array_unique($fFileExtension10);
			$fFileExtension10 = array_values($fFileExtension10);
			$fFileName10 = array_values($fFileName10);
			$fFolderCD10 = array_values($fFolderCD10);
			$fFolderPic10 = array_values($fFolderPic10);
			$fFileName10Loop = count($fFileName10);
		}
		$fFolderName = array_unique($fFolderName);
		$fFolderName = array_values($fFolderName);


		$fFolderLoop = count($fFolderName);

		$fFolderCD = array_unique($fFolderCD);
		$fFolderCD = array_values($fFolderCD);
	}




*/


	//フォルダー表示(共通資料)

	$myListObject = new SPFWListObject($myDB);

	$sql = "SELECT ";
	$sql .= "ShopName, ";
	$sql .= "ShopCD, ";
	$sql .= "FileExtension ";


	$myListObject->SelectSQL = $sql;

	$sql = " FROM tShopM ";
	$sql .= " WHERE MukouFlg = FALSE ";
	$sql .= " and MonitorCD = $MonitorCD ";

	$myListObject->Condition = $sql;
	$myListObject->Order = "Created DESC";
	$myListObject->Limit = "allpage";

	if (!($myListObject->GetList(1)))
		trigger_error("Getting Menu List Failed.", E_USER_ERROR);

	$ComLoop = $myListObject->Rows;
	$ComCnt = $myListObject->Rows;
	for ($i = 0; $i < $ComLoop; $i++) {
		$cNo[$i] = $i + 1;
		$mFileName[$i] = $myListObject->GetValue($i, 0);
		$mShopCD[$i] = $myListObject->GetValue($i, 1);
		$mFileExtension[$i] = $myListObject->GetValue($i, 2);
//
		$mFolderPic[$i] = "kojifile/".$mShopCD[$i].".".$mFileExtension[$i]."#zoom=177&toolbar=0&param=".$param;
		if($cNo[$i] % 2 == 0){
			$TrEnd[$i] = "</tr>";
		}else{
			$TrStart[$i] = "<tr>";
		}
	}
	$FirstPic = $mFolderPic[0];
	$SecondPic = $mFolderPic[1];

	$CNT_FILE = basename($_SERVER["SCRIPT_NAME"], ".php") .".tpl";
	$myTemplate = new SPFWTemplate($CNT_FILE, $MyCarrier);
	$HiddenValues = $myTemplate->getValuesToPass();

	$myTemplate->convertTags();
	$myTemplate->outputTemplate();


	unset($myTemplate);
	unset($myLog);

	unset($SuperReloadFlg);



?>
