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

//	$UserCD = $myUser->UserCD;
//	$ID = $myUser->ID;
//	$Extra1 = $myUser->Extra1; //MemberType
//	$Extra2 = $myUser->Extra2; //MonitorCD
//	$Extra3 = $myUser->Extra3; //ShopCD
	unset($myUser);


	########################################################
	# 情報取得
	########################################################

if ($editMonitorCD) { #編集の場合
	// モニター取得
	$myListObject = new SPFWListObject($myDB);

	$sql = "SELECT ";
	$sql .= "MonitorName, ";
	$sql .= "Basyo, ";
	$sql .= "TempCD, ";
	$sql .= "GenbaCD, ";
	$sql .= "Telop, ";
	$sql .= "CameraURL1, ";
	$sql .= "CameraURL2, ";
	$sql .= "KojiStart, ";
	$sql .= "KojiEnd, ";
	$sql .= "TenkiCD, ";
	$sql .= "startdate, ";
	$sql .= "enddate ";

	$myListObject->SelectSQL = $sql;

	$sql = " FROM tMonitorM";
	$sql .= " WHERE MukouFlg = FALSE and MonitorCD = ".$editMonitorCD;

	$myListObject->Condition = $sql;
	$myListObject->Order = "1";
	$myListObject->Limit = "allpage";

	if (!($myListObject->GetList(1)))
		trigger_error("Getting Menu List Failed.", E_USER_ERROR);

	$MonitorName = $myListObject->GetValue(0, 0);
	$Basyo = $myListObject->GetValue(0, 1);
	$TempCD = $myListObject->GetValue(0, 2);
	$GenbaCD = $myListObject->GetValue(0, 3);
	$Telop = $myListObject->GetValue(0, 4);
	$CameraURL1 = $myListObject->GetValue(0, 5);
	$CameraURL2 = $myListObject->GetValue(0, 6);
	$KojiStart = $myListObject->GetValue(0, 7);
	$KojiEnd = $myListObject->GetValue(0, 8);
	$TenkiCD = $myListObject->GetValue(0, 9);
	$TenkiCD = htmlspecialchars($TenkiCD, ENT_QUOTES, 'UTF-8');
	$startdate = $myListObject->GetValue(0, 10);
	$enddate = $myListObject->GetValue(0, 11);

	$IfHensyu = true;
	$IfSinki = false;

	$GenbaCDtxt = $GenbaCD;
}else{
	$GenbaCDtxt = "";
	$IfSinki = true;
	$IfHensyu = false;
}

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
