<html>

<head>
	<title>Contact Board</title>
	__SHeader__


	<!-- BootstrapのCSS読み込み -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/hosyu_estimate.css" rel="stylesheet">
	<!--20170615-->



	<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.ui.datepicker-ja.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function () {
			$("#StartDate").datepicker({});
		});
	</script>
</head>

<body bgcolor="__SBackground__" text="__STextColor__" link="__SLinkColor__" alink="__SALinkColor__" vlink="__SVLinkColor__">
	<div class="contents">
		<hr size="__HRSize__" color="__HRColor__">
		<center>《Contact Board》</center>
		<hr size="__HRSize__" color="__HRColor__">
		<br>






		<form action="g_monitor_finish.php" method=POST name="mainform">

			<table border=1 class="table table-striped">
				<tr>
					<td>モニターCD</td>
					<td>__editMonitorCD__</td>
				</tr>
				<tr>
					<td>現場CD</td>
					<td>__GenbaCD__</td>
				</tr>
				<tr>
					<td>現場名</td>
					<td>__Telop__</td>
				</tr>
				<tr>
					<td>現場住所(設置場所)</td>
					<td>__Basyo__</td>
				</tr>
				<!--<tr><td>工事開始日</td><td>__KojiStart__</td></tr>
<tr><td>工事終了日</td><td>__KojiEnd__</td></tr>

__IfHensyu__
<tr><td>モニター名</td><td>__MonitorName__</td></tr>
<tr><td>カメラ１</td><td>__CameraURL1__</td></tr>
<tr><td>カメラ２</td><td>__CameraURL2__</td></tr>
__IfHensyu__
-->


				<!-- <tr><td>天気場所コード</td><td width="400">__wTenkiCD__....</td></tr> -->

			</table>
			<br>

			<input type="hidden" name="editMonitorCD" value="__editMonitorCD__">
			<input type="hidden" name="MonitorName" value="__MonitorName__">
			<input type="hidden" name="Basyo" value="__Basyo__">
			<input type="hidden" name="TempCD" value="__TempCD__">
			<input type="hidden" name="Telop" value="__Telop__">
			<input type="hidden" name="GenbaCD" value="__GenbaCD__">
			<input type="hidden" name="CameraURL1" value="__CameraURL1__">
			<input type="hidden" name="CameraURL2" value="__CameraURL2__">
			<input type="hidden" name="KojiStart" value="__KojiStart__">
			<input type="hidden" name="KojiEnd" value="__KojiEnd__">
			<input type="hidden" name="TenkiCD" value="__TenkiCD__">

			<input type="hidden" name="work" value="1">
			<input type=hidden name="rKey" value="__rKey__">

			<input type=submit value="登　録">

			<br><br>
			<input type=button value="修　正" onClick="history.back();">

		</form>


		<hr size="__HRSize__" color="__HRColor__">

		__SFooter__
	</div>
</body>

</html>