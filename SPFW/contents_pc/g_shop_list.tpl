<!DOCTYPE html>

<head>
    <title>Contact Board</title>

    <!-- Bootstrap��CSS�ɤ߹��� -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/hosyu_estimate.css" rel="stylesheet">
    <!--20170615-->


    <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.ui.datepicker-ja.js" type="text/javascript"></script>
    <script type="text/javascript" src="tools.js"></script>
</head>

__SHeader__

<body text="__STextColor__" link="__SLinkColor__" alink="__SALinkColor__" vlink="__SVLinkColor__">
    <div class="contents">
        <hr size="__HRSize__" color="__HRColor__">
        <center>��Contact Board��</center>
        <hr size="__HRSize__" color="__HRColor__">

        <table>
            <tr>
                <td align="left" colspan=2>

                    <form action="g_shop_form.php" method="POST" name="mainform">
                        <input type="hidden" name="editShopCD" value="">
                        <input type="hidden" name="editMonitorCD" value="__editMonitorCD__">
                        <input type="hidden" name="work" value="__work__">
                        <input type="hidden" name="rKey" value="__rKey__">
                        ����CD:__GenbaCD__ &nbsp ��˥���No.__editMonitorCD__&nbsp
                        <!-- <span id="qr" colspan="2"><img src="http://chart.googleapis.com/chart?chs=100x100&cht=qr&chl=http://www3.489501.jp/g04/g_monitor3.php?GenbaCD=__GenbaCD__" / style="margin-left:7px"></span> -->

                        <br>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <form action="g_shop_form.php?rKey=__rKey__&editMonitorCD=__editMonitorCD__" method="POST">
                        <input type="submit" value="�Ǽ����� �����ɲ�" class="btn btn-primary">
                    </form>
                </td>

                <!--<td>
<form action="g_shop_folder_form.php?rKey=__rKey__&editMonitorCD=__editMonitorCD__" method="POST">
<input type="submit" value="�ե������̾�Խ�">
</form>

</td>
<form action="g_shop_slide.php?rKey=__rKey__" method="POST">
<input type="hidden" name="editMonitorCD" value="__editMonitorCD__">

<td><input type="submit" value="���饤�ɥ��硼��Ͽ"></td>
-->
            </tr>
        </table>
        <br>
        <table border=1 class="table table-striped">
            <tr bgcolor="lightblue">
                <td>��No��</td>
                <td>�Խ�</td>
                <!--
<td>�ե������̾</td>-->
                <td>ɽ��̾</td>
                <!--<td>�ե�����̾</td>-->
                <td>��ĥ��</td>
                <!--<td>���饤�ɥ��硼����<br><font color=blue>����__CntShow__��</font></td>-->
                <td>ô����̾</td>
                <td>���</td>
            </tr>

            __ShopLoop__
            <tr bgcolor="white">
                <td>
                    <center>__ShopCD__</center>
                </td>
                <td><input type="button" value="�Խ�" class="btn btn-primary btn-xs" onclick="javascript:moveWithKey2('g_shop_form.php', __ShopCD__ )"></td>
                <!--<td>__FolderName__</td>-->
                <td>__ShopName__</td>
                <!--<td>__FileName__</td>-->
                <td>__FileExtension__</td>
                <!--<td><center>__ShowFlg__  <input type="checkbox" value="__ShopCD__" name="slide[]" __SlideChecked__></center></td>-->
                <input type="hidden" name="ShopCD[]" value="__ShopCD__">

                <td>__TantoName__</td>
                <td><input type="button" value="���" class="btn btn-primary btn-xs" onclick="javascript:moveWithKeyAndWork2('g_shop_del.php', __ShopCD__, 2, 'No.__ShopCD__' )"></td>
            </tr>
            __ShopLoop__
            </form>

        </table>

        </form>

        <br><br>

        <a href="g_monitor_list.php?rKey=__rKey__&GenbaCD=__GenbaCD__">��˥������������</a><br>
        <hr size="__HRSize__" color="__HRColor__">
        <a href="logout.php__QUERY__">��������</a><br>
        <hr size="__HRSize__" color="__HRColor__">

        __SFooter__
    </div>
</body>

</html>