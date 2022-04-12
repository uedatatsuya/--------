<!DOCTYPE html>

<head>
    <script type="text/javascript" src="tools.js"></script>
    <title>Contact Board</title>
    __SHeader__

    <!-- BootstrapのCSS読み込み -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/hosyu_estimate.css" rel="stylesheet">
    <!--20170615-->

</head>

<body bgcolor="__SBackground__" text="__STextColor__" link="__SLinkColor__" alink="__SALinkColor__" vlink="__SVLinkColor__">
    <div class="contents">
        <hr size="__HRSize__" color="__HRColor__">
        <center>《Contact Board》</center>
        <hr size="__HRSize__" color="__HRColor__">
        <br>



        __IfError__
        更新できませんでした。
        __IfError__

        __IfOK__
        更新しました。<br>
        __IfOK__

        <br>

        <a href="g_monitor_list.php?rKey=__rKey__&editMonitorCD=__editMonitorCD__&GenbaCD=__GenbaCD__">＜モニター一覧</a><br>
        <br>

        <hr size="__HRSize__" color="__HRColor__">

        __SFooter__
    </div>
</body>

</html>