<!DOCTYPE html>

<head>
	<title>ContactBoard</title>
	__SHeader__


	<!-- Bootstrap��CSS�ɤ߹��� -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/hosyu_estimate.css" rel="stylesheet">
	<!--20170615-->



	<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.ui.datepicker-ja.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function () {
			$("#KojiEnd").datepicker({});
			$("#KojiStart").datepicker({});
		});
	</script>
</head>

<body bgcolor="__SBackground__" text="__STextColor__" link="__SLinkColor__" alink="__SALinkColor__" vlink="__SVLinkColor__">
	<div class="contents">
		<hr size="__HRSize__" color="__HRColor__">
		<center>��Contact Board��</center>
		<hr size="__HRSize__" color="__HRColor__">
		<br>




		<a href="javascript:history.back();">���˥������������</a><br>
		<br><br>

		<form action="g_monitor_confirm.php" method=POST name="mainform">

			<table border=1 class="table table-striped">

				<tr>
					<td>��˥���CD</td>
					<td>__editMonitorCD__</td>
				</tr>
				<tr>
					<td>����CD</td>
					<td>__GenbaCDtxt__</td>
				</tr>
				<tr>
					<td bgcolor="lightgoldenrodyellow">����̾</td>
					<td align="left"><input type=text name="Telop" value="__Telop__" size=70></td>
				</tr>
				<tr>
					<td bgcolor="lightgoldenrodyellow">���콻��(���־��)</td>
					<td align="left"><input type=text name="Basyo" value="__Basyo__" size=70></td>
				</tr>

				<!--<tr><td bgcolor="lightgoldenrodyellow">����������(��:20170606)</td><td align="left" ><input type=text id="KojiStart" name="KojiStart" value="__KojiStart__" ></td></tr>
<tr><td bgcolor="lightgoldenrodyellow">������λ��(��:20170915)</td><td align="left" ><input type=text id="KojiEnd"  name="KojiEnd" value="__KojiEnd__"></td></tr>
-->

				<!--__IfHensyu__-->
				<tr>
					<td bgcolor="lightgoldenrodyellow">��˥���̾</td>
					<td align="left"><input type=text name="MonitorName" value="__MonitorName__"></td>
				</tr>


				<!--<tr><td bgcolor="lightgoldenrodyellow">�����1URL</td><td align="left" ><input type=text name="CameraURL1" value="__CameraURL1__"  size=70 ></td></tr>
<tr><td bgcolor="lightgoldenrodyellow">�����2URL</td><td align="left" ><input type=text name="CameraURL2" value="__CameraURL2__"  size=70 ></td></tr>
__IfHensyu__
-->

				<!-- <tr><td bgcolor="lightgoldenrodyellow">ŷ����ꥳ����</td><td align="left" ><input type=text name="TenkiCD" value="__TenkiCD__"  size=70 ></td></tr> -->

			</table>
			<br>
			<input type="hidden" name="GenbaCD" value="__GenbaCD__">
			<input type="hidden" name="editMonitorCD" value="__editMonitorCD__">
			<input type=hidden name="rKey" value="__rKey__">

			<input type=submit value="�Ρ�ǧ">

		</form>


		<hr size="__HRSize__" color="__HRColor__">

		__SFooter__
	</div>
</body>

</html>