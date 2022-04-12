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

	// �ǡ����١������ͥ���
	$myDB = new SPFWDatabase(_MAIN_DB, _HOST_NAME, _USER_NAME, _PASSWD, FALSE);
	if (!$myDB->Connection)
		trigger_error("SPFWDatabase Failed.", E_USER_ERROR);


	$GenbaCD = $_GET['GenbaCD'];


	########################################################
	# ���ϥ����å�
	########################################################

	if ($rKey == NULL) {
		$URL = _MAIN_URL . 'login_form.php';
		header('Location: ' . $URL);
		exit;
	}

	########################################################
	# ǧ��ư��
	########################################################

	$myUser = new User($myDB);

	if (!$myUser->doAuthenticationByRegistKey($rKey))
		trigger_error("doAuthentication Failed.", E_USER_ERROR);

	if ($myUser->UserCD == -1) {
		$URL = _MAIN_URL . 'login_form.php';
		header('Location: ' . $URL);
		exit;
	}
	$UserCD = $myUser->UserCD;#tMonitorM���ȿ����������ѤǤ���UserCD���Ϥ��äƤ��롣
	$ID = $myUser->ID;
	$Extra1 = $myUser->Extra1; //MemberType
	$Extra2 = $myUser->Extra2; //�������̥桼��������������
	$Extra3 = $myUser->Extra3; //ʪ��CD

if ($Extra2 == 2){
	$Kanri = "<a href='g_monitor_form.php?rKey=__rKey__'>����������Ͽ</a>";
	$IfKanri = true;
}else{
	$Kanri = "";
}
	########################################################
	# �������
	########################################################

	// ��˥�������
	$myListObject = new SPFWListObject($myDB);

	$sql = "SELECT ";
	$sql .= "MonitorCD, ";
	$sql .= "MonitorName, ";
	$sql .= "Basyo, ";
	$sql .= "TempCD, ";
	$sql .= "GenbaCD, ";
	$sql .= "Telop, ";
	$sql .= "KojiStart, ";
	$sql .= "KojiEnd ";

	$myListObject->SelectSQL = $sql;

	$sql = " FROM tMonitorM";
	$sql .= " WHERE MukouFlg = FALSE";
if ($Extra2 == 2){
#	$sql .= " AND MonitorCD =".$Extra2;
}else{
	$sql .= " AND GenbaCD ='".$GenbaCD."'";

}


	$myListObject->Condition = $sql;
	$myListObject->Order = "1";
	$myListObject->Limit = "allpage";

	if (!($myListObject->GetList(1)))
		trigger_error("Getting Menu List Failed.", E_USER_ERROR);

	$MonitorLoop = $myListObject->Rows;
	for ($i = 0; $i < $MonitorLoop; $i++) {
		$MonitorCD[$i] = $myListObject->GetValue($i, 0);
		$MonitorName[$i] = $myListObject->GetValue($i, 1);
		$Basyo[$i] = $myListObject->GetValue($i, 2);
		$TempCD[$i] = $myListObject->GetValue($i, 3);
		$wGenbaCD[$i] = $myListObject->GetValue($i, 4);
		$Telop[$i] = $myListObject->GetValue($i, 5);
		$KojiStart[$i] = $myListObject->GetValue($i, 6);
		$KojiEnd[$i] = $myListObject->GetValue($i, 7);

	}


	########################################################
	# ����ƥ��ɽ��
	########################################################

	$CNT_FILE = basename($_SERVER["SCRIPT_NAME"], ".php") .".tpl";

	$myTemplate = new SPFWTemplate($CNT_FILE, $MyCarrier);
	$HiddenValues = $myTemplate->getValuesToPass();

	$myTemplate->convertTags();
	$myTemplate->outputTemplate();

	unset($myTemplate);
	unset($myLog);
?>
