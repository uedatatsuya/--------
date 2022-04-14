<?php
/**
 * Monitorクラス
 *
 * メニューマスタを扱うクラスです。
 *
 * @package 
 * @access  public
 * @author  MasahitoSAMEKAWA <masahito@souppot.jp>
 * @create  2003/01/31
 * @version 0.1
 **/

// 依存
include_once _CLS_DIR . "SPFWLog.cls";

class Monitor {
	/**
	 * データベースクラスのインスタンス
	 */
	var $myDB;
	/**
	 * レコードカウント
	 */
	var $RecCnt;
	/**
	 * クエリ実行結果セット
	 */
	var $tmprtn;
	/**
	 * 対象テーブル名称
	 */
	var $TableName;
	/**
	 * メニューコード
	 * 
	 * 連番
	 */

	var $MonitorCD;
	var $MonitorName;
	var $Basyo;
	var $TempCD;
	var $GenbaCD;
	var $Telop;
	var $CameraURL1;
	var $CameraURL2;
	var $TenkiCD;
	var $KojiStart;
	var $KojiEnd;
	var $DefaultPic1;
	var $DefaultPic2;
	var $DefaultPic3;
	var $DefaultPic4;
	var $DefaultPic5;
	var $startdate;
	var $enddate;

	var $MukouFlg;
	/**
	 * 作成日時
	 */
	var $Created;
	/**
	 * 作成者
	 */
	var $Creator;
	/**
	 * 更新日時
	 */
	var $Updated;
	/**
	 * 更新者
	 */
	var $Updater;

	function Monitor($myDB = "",$MonitorCD = -1) {
		// ログ準備
		$myLog = new SPFWLog();

		$this->Err = "";
		
		if ($myDB == "") {
			$this->Err = "データベースへのコネクションがありません";
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}

		// 整数変換
		settype($MonitorCD,"integer");
		// 整数チェック
		if (!is_long($MonitorCD) or $MonitorCD == 0) {
			$this->Err = "ユーザーコード が不正です";
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}

		$this->myDB = $myDB;
		$this->TableName = "tMonitorM";
		$this->MonitorCD = $MonitorCD;

		return TRUE;
	}

	function initialize(){
		$this->Err = "";

		$this->MonitorCD = "";
		$this->MonitorName = "";
		$this->Basyo = "";
		$this->TempCD = "";
		$this->GenbaCD = "";
		$this->Telop = "";
		$this->CameraURL1 = "";
		$this->CameraURL2 = "";
		$this->TenkiCD = "";
		$this->KojiStart = "";
		$this->KojiEnd = "";
		$this->Telop = "";
		$this->DefaultPic1 = "";
		$this->DefaultPic2 = "";
		$this->DefaultPic3 = "";
		$this->DefaultPic4 = "";
		$this->DefaultPic5 = "";
		$this->startdate = "";
		$this->enddate = "";
		$this->MukouFlg = "";
		$this->Created = "";
		$this->Creator = "";
		$this->Updated = "";
		$this->Updater = "";
	}

	//抽出
	function executeSelect($WhereStr = "", $OrderByStr = ""){
		// ログ準備
		$myLog = new SPFWLog();

		$this->Err = "";

		//設定
		if ($this->myDB == "") {
			$this->Err = "データベースへのコネクションがありません";
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}
		
		// ページプロパティ取得
		$sqlMoji = "select ";
		$sqlMoji .= " MonitorCD ";
		$sqlMoji .= ", MonitorName ";
		$sqlMoji .= ", Basyo ";
		$sqlMoji .= ", TempCD ";
		$sqlMoji .= ", GenbaCD ";
		$sqlMoji .= ", Telop ";
		$sqlMoji .= ", CameraURL1 ";
		$sqlMoji .= ", CameraURL2 ";
		$sqlMoji .= ", TenkiCD ";
		$sqlMoji .= ", KojiStart ";
		$sqlMoji .= ", KojiEnd ";
		$sqlMoji .= ", length(DefaultPic1) ";
		$sqlMoji .= ", length(DefaultPic2) ";
		$sqlMoji .= ", length(DefaultPic3) ";
		$sqlMoji .= ", length(DefaultPic4) ";
		$sqlMoji .= ", length(DefaultPic5) ";
		$sqlMoji .= ", startdate ";
		$sqlMoji .= ", enddate ";
		$sqlMoji .= ", MukouFlg";
		$sqlMoji .= ", Created";
		$sqlMoji .= ", Creator";
		$sqlMoji .= ", Updated";
		$sqlMoji .= ", Updater";
		$sqlMoji .= " from $this->TableName";

		if($WhereStr != "")
			$sqlMoji = $sqlMoji . " where " . $WhereStr;

		if($OrderByStr != "")
			$sqlMoji = $sqlMoji . " order by " . $OrderByStr;

		$rtn = $this->myDB->executeQuery($sqlMoji);
		if (!$rtn){
			$this->Err = "レコード取得に失敗しました";
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}
		else{
			$this->RecCnt = $this->myDB->getNumberOfRows($rtn);
			if ($this->RecCnt == 1){
				$this->tmprtn = $rtn;
				$this->getDataSet(0);
			}
			else if($this->RecCnt > 1){
				$this->tmprtn = $rtn;
			}
		}

		return TRUE;
	}

	//タプル取得
	function getDataSet($RowNo){
		if($RowNo >= $this->RecCnt){
			$this->Err = "行番号が不正です";
			return FALSE;
		}
		else{
			list(
				$this->MonitorCD,
				$this->MonitorName,
				$this->Basyo,
				$this->TempCD,
				$this->GenbaCD,
				$this->Telop,
				$this->CameraURL1,
				$this->CameraURL2,
				$this->TenkiCD,
				$this->KojiStart,
				$this->KojiEnd,
				$this->DefaultPic1,
				$this->DefaultPic2,
				$this->DefaultPic3,
				$this->DefaultPic4,
				$this->DefaultPic5,
				$this->startdate,
				$this->enddate,
				$this->MukouFlg,
				$this->Created,
				$this->Creator,
				$this->Updated,
				$this->Updater
			) = $this->myDB->fetchRow($this->tmprtn,$RowNo);

			$this->MonitorName = stripslashes($this->MonitorName);
			$this->Basyo = stripslashes($this->Basyo);
			$this->Telop = stripslashes($this->Telop);
			$this->CameraURL1 = stripslashes($this->CameraURL1);
			$this->CameraURL2 = stripslashes($this->CameraURL2);
			$this->TenkiCD = stripslashes($this->TenkiCD);
			$this->KojiStart = stripslashes($this->KojiStart);
			$this->KojiEnd = stripslashes($this->KojiEnd);
			$this->MukouFlg = $this->convertFlgToBoolean($this->MukouFlg);
		}
	}

	/* アップデート */
	function executeUpdate() {
		// ログ準備
		$myLog = new SPFWLog();

		// エラークリア
		$this->Err = "";

		//設定
		if ($this->myDB == "") {
			$this->Err = "データベースへのコネクションがありません";
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}
		
		if ($this->MonitorCD < 0) {
			// 新規
			// step 1. 新規番号取得のためトランザクション開始
			if (!($this->myDB->executeQuery("BEGIN"))) {
				$this->Err = "追加処理に失敗しました(BEGIN)";
				$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
				unset($myLog);
				return FALSE;
			} else {
				// step 2. ロック
				if (!($this->myDB->lockTable($this->TableName))) {
					$this->Err = "追加処理に失敗しました(LOCK)";
					$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
					$this->myDB->executeQuery("ROLLBACK");
					unset($myLog);
					return FALSE;
				} else {
					// step 3. 取得
					$sqlMoji = "select MonitorCD from $this->TableName order by MonitorCD desc limit 1";
					$maxCD = $this->myDB->getOneValue($sqlMoji);
					$maxCD = ($maxCD == -1) ? 0 : $maxCD;
					$maxCD++;

					// step 4. インサート
					$sqlMoji = "Insert into $this->TableName (";
					$sqlMoji .= "MonitorCD";
					if ($this->MonitorName != "") $sqlMoji .= ", MonitorName";
					if ($this->Basyo != "") $sqlMoji .= ", Basyo";
					if ($this->TempCD != "") $sqlMoji .= ", TempCD";
					if ($this->GenbaCD != "") $sqlMoji .= ", GenbaCD";
					if ($this->Telop != "") $sqlMoji .= ", Telop";
					if ($this->CameraURL1 != "") $sqlMoji .= ", CameraURL1";
					if ($this->CameraURL2 != "") $sqlMoji .= ", CameraURL2";
					if ($this->TenkiCD != "") $sqlMoji .= ", TenkiCD";
					if ($this->KojiStart != "") $sqlMoji .= ", KojiStart";
					if ($this->KojiEnd != "") $sqlMoji .= ", KojiEnd";
					if ($this->DefaultPic1 != "") $sqlMoji .= ", DefaultPic1";
					if ($this->DefaultPic2 != "") $sqlMoji .= ", DefaultPic2";
					if ($this->DefaultPic3 != "") $sqlMoji .= ", DefaultPic3";
					if ($this->DefaultPic4 != "") $sqlMoji .= ", DefaultPic4";
					if ($this->DefaultPic5 != "") $sqlMoji .= ", DefaultPic5";
					if ($this->startdate != "") $sqlMoji .= ", startdate";
					if ($this->enddate != "") $sqlMoji .= ", enddate";
					if ($this->MukouFlg != "") $sqlMoji .= ", MukouFlg";
					$sqlMoji .= ", Created";
					if ($this->Creator != "") $sqlMoji .= ", Creator";
					$sqlMoji .= ", Updated";
					if ($this->Updater != "") $sqlMoji .= ", Updater";

					$sqlMoji .= ") values (";
					$sqlMoji .= "$maxCD";

					if ($this->MonitorName != "") $sqlMoji .= ", '" . addslashes($this->MonitorName) . "'";
					if ($this->Basyo != "") $sqlMoji .= ", '" . addslashes($this->Basyo) . "'";
					if ($this->TempCD != "") $sqlMoji .= ", '" . $this->TempCD . "'";
					if ($this->GenbaCD != "") $sqlMoji .= ", '" . addslashes($this->GenbaCD) . "'";
					if ($this->Telop != "") $sqlMoji .= ", '" . addslashes($this->Telop) . "'";
					if ($this->CameraURL1 != "") $sqlMoji .= ", '" . addslashes($this->CameraURL1) . "'";
					if ($this->CameraURL2 != "") $sqlMoji .= ", '" . addslashes($this->CameraURL2) . "'";
					if ($this->TenkiCD != "") $sqlMoji .= ", '" . addslashes($this->TenkiCD) . "'";
					if ($this->KojiStart != "") $sqlMoji .= ", '" . addslashes($this->KojiStart) . "'";
					if ($this->KojiEnd != "") $sqlMoji .= ", '" . addslashes($this->KojiEnd) . "'";
					if ($this->DefaultPic1 != "") $sqlMoji .= ", '" . addslashes($this->DefaultPic1) . "'";
					if ($this->DefaultPic2 != "") $sqlMoji .= ", '" . addslashes($this->DefaultPic2) . "'";
					if ($this->DefaultPic3 != "") $sqlMoji .= ", '" . addslashes($this->DefaultPic3) . "'";
					if ($this->DefaultPic4 != "") $sqlMoji .= ", '" . addslashes($this->DefaultPic4) . "'";
					if ($this->DefaultPic5 != "") $sqlMoji .= ", '" . addslashes($this->DefaultPic5) . "'";
					if ($this->startdate != "") $sqlMoji .= ", '" . addslashes($this->startdate) . "'";
					if ($this->enddate != "") $sqlMoji .= ", '" . addslashes($this->enddate) . "'";
/*
					if ($this->DefaultPic1 != "") $sqlMoji .= ", '" . $this->DefaultPic1 . "'";
					if ($this->DefaultPic2 != "") $sqlMoji .= ", '" . $this->DefaultPic2 . "'";
					if ($this->DefaultPic3 != "") $sqlMoji .= ", '" . $this->DefaultPic3 . "'";
					if ($this->DefaultPic4 != "") $sqlMoji .= ", '" . $this->DefaultPic4 . "'";
					if ($this->DefaultPic5 != "") $sqlMoji .= ", '" . $this->DefaultPic5 . "'";
*/
					if ($this->MukouFlg != "") $sqlMoji .= ", " . $this->convertFlgToString($this->MukouFlg);
					$sqlMoji .= ", NOW()";
					if ($this->Creator != "") $sqlMoji .= ", $this->Creator";
					$sqlMoji .= ", NOW()";
					if ($this->Updater != "") $sqlMoji .= ", $this->Updater";
					$sqlMoji .= ")";

					$rtn = $this->myDB->executeQuery($sqlMoji);
					if (!$rtn){
						$this->Err = "追加処理に失敗しました";
						$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
						unset($myLog);
						return FALSE;
					}
					else{
						// step 5. コミット
						if (!($this->myDB->executeQuery("COMMIT"))) {
							$this->Err = "追加処理に失敗しました(COMMIT)";
							$this->myDB->executeQuery("ROLLBACK");
							return FALSE;
						}
						else {
							$this->MonitorCD = $maxCD;
						}
					}
				}
			}
		} else {
			// アップデート
			$sqlMoji = "Update $this->TableName set ";
			$sqlMoji .= "MonitorCD = $this->MonitorCD";
			$sqlMoji .= ", MonitorName = " . $this->convertNullStringValue($this->MonitorName);
			$sqlMoji .= ", Basyo = " . $this->convertNullStringValue($this->Basyo);
			$sqlMoji .= ", TempCD = " . $this->convertNullIntValue($this->TempCD);
			$sqlMoji .= ", GenbaCD = " . $this->convertNullStringValue($this->GenbaCD);
			$sqlMoji .= ", Telop = " . $this->convertNullStringValue($this->Telop);
			$sqlMoji .= ", CameraURL1 = " . $this->convertNullStringValue($this->CameraURL1);
			$sqlMoji .= ", CameraURL2 = " . $this->convertNullStringValue($this->CameraURL2);
			$sqlMoji .= ", TenkiCD = " . $this->convertNullStringValue($this->TenkiCD);
			$sqlMoji .= ", KojiStart = " . $this->convertNullStringValue($this->KojiStart);
			$sqlMoji .= ", KojiEnd = " . $this->convertNullStringValue($this->KojiEnd);
			$sqlMoji .= ", DefaultPic1 = " . $this->convertNullStringValue($this->DefaultPic1);
			$sqlMoji .= ", DefaultPic2 = " . $this->convertNullStringValue($this->DefaultPic2);
			$sqlMoji .= ", DefaultPic3 = " . $this->convertNullStringValue($this->DefaultPic3);
			$sqlMoji .= ", DefaultPic4 = " . $this->convertNullStringValue($this->DefaultPic4);
			$sqlMoji .= ", DefaultPic5 = " . $this->convertNullStringValue($this->DefaultPic5);
			$sqlMoji .= ", startdate = " . $this->convertNullStringValue($this->startdate);
			$sqlMoji .= ", enddate = " . $this->convertNullStringValue($this->enddate);
			$sqlMoji .= ", MukouFlg = " . $this->convertFlgToString($this->MukouFlg);
			$sqlMoji .= ", Created = " . $this->convertNullStringValue($this->Created);
			$sqlMoji .= ", Creator = " . $this->convertNullIntValue($this->Creator);
			$sqlMoji .= ", Updated = NOW()";
			$sqlMoji .= ", Updater = " . $this->convertNullIntValue($this->Updater);
			$sqlMoji .= " where MonitorCD = $this->MonitorCD";

			$rtn = $this->myDB->executeQuery($sqlMoji);
			if (!$rtn){
				$this->Err = "更新処理に失敗しました";
				$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
				unset($myLog);
				return FALSE;
			}
		}

		return TRUE;
	}

	function convertFlgToString($flg){
		if ($flg == "true" || $flg == "t")
			return "true";
		else if ($flg == "false" || $flg == "f")
			return "false";

		if ($flg == true || $flg == 1)
			return "true";
		else if ($flg == false || $flg == 0)
			return "false";

		return "false";
	}

	function convertFlgToBoolean($flg){
		if ($flg == "t")
			return TRUE;
		else if ($flg == "f")
			return FALSE;
	}

	function convertNullIntValue($value){
		if ($value == "")
			return "NULL";
		else
			return $value;
	}

	function convertNullStringValue($value){
		if ($value == "")
			return "NULL";
		else
			return "'" . addslashes($value) . "'";
	}

	function setTransaction($lockLevel = "EXCLUSIVE"){
		// ログ準備
		$myLog = new SPFWLog();

		$lockString = "LOCK TABLE " . $this->TableName . " IN SHARE ROW " . $lockLevel . " MODE";
		$rtn = $this->myDB->setTransaction($lockString);
		if (!$rtn){
			$this->Err = $this->myDB->Err;
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}
		return TRUE;
	}

	function rollbackTransaction(){
		// ログ準備
		$myLog = new SPFWLog();

		$rtn = $this->myDB->rollbackTransaction();
		if (!$rtn){
			$this->Err = $this->myDB->Err;
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}
		return TRUE;
	}

	function commitTransaction(){
		// ログ準備
		$myLog = new SPFWLog();

		$rtn = $this->myDB->commitTransaction();
		if (!$rtn){
			$this->Err = $this->myDB->Err;
			$myLog->error("ClassName : " . get_class($this) . " : " . $this->Err);
			unset($myLog);
			return FALSE;
		}
		return TRUE;
	}
}
?>
