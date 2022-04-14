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


	$myDB = new SPFWDatabase(_MAIN_DB, _HOST_NAME, _USER_NAME, _PASSWD, FALSE);
	if (!$myDB->Connection)
		trigger_error("SPFWDatabase Failed.", E_USER_ERROR);


	session_start();

	$SuperReloadFlg  = $_GET['SuperReloadFlg'];

	if($SuperReloadFlg){
		$length = 10;
		$param = substr(str_shuffle('1234567890abcdefghijklmnopqrstuvwxyz'), 0, $length);
		$_SESSION['randomparams'] = $param;
	}else{

		$param = $_SESSION['randomparams'];
	}

	########################################################
	# ����ƥ��ɽ��
	########################################################

	$Time = time();

	$myListObject = new SPFWListObject($myDB);

	$sql = "SELECT ";
	$sql .= "MonitorCD, ";
	$sql .= "Telop, ";
	$sql .= "startdate, ";
	$sql .= "enddate ";
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
	$startdate = $myListObject->GetValue(0, 2);
	$enddate = $myListObject->GetValue(0, 3);
	
	$NoPic = "<img src=viewnopicthumb.php?MonitorCD=".$MonitorCD." width=300 ></a>";


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

		// $mFolderPic[$i] = "kojifile/".$mShopCD[$i].".".$mFileExtension[$i]."#zoom=165&toolbar=0&param=".$param;
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
