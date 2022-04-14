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

	// �ǡ����١������ͥ���
	$myDB = new SPFWDatabase(_MAIN_DB, _HOST_NAME, _USER_NAME, _PASSWD, FALSE);
	if (!$myDB->Connection)
		trigger_error("SPFWDatabase Failed.", E_USER_ERROR);


	########################################################
	# ���ϥ����å�
	########################################################

	if ($rKey == NULL) {
		$URL = _MAIN_URL . 'login_form.php';
		header('Location: ' . $URL);
		exit;
	}

	########################################################
	# �������
	########################################################

	$TenkiCD = htmlspecialchars($TenkiCD, ENT_QUOTES, 'UTF-8');

	$wTenkiCD = strstr($TenkiCD, "&gt;", TRUE);
	if (!$editMonitorCD > 0) {
		$NewStr = "������Ͽ";
		$IfHensyu = false;
	}else{
		$IfHensyu = true;
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
