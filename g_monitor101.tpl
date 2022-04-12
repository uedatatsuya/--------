<!DOCTYPE html>
<html lang="ja">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- <meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="0"> -->

	<title>Contact Board</title>
	<link rel="stylesheet" href="css/style12.css" type="text/css" />
	<link type="text/css" href="./css/text_layer_builder.css" rel="stylesheet">
	<script src="./js/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="./js/text_layer_builder.js"></script>
	<script type="text/javascript" src="./js/printThis.js"></script>


	<style type="text/css">
		#imgsrc {
			display: none;

		}

		#image2 {
			display: none;

		}

		.kaigyo {
			display: inline-block;
			_display: inline;
		}


		#kaigyo {
			display: inline-block;
			_display: inline;
		}

		#pastjpg {
			display: none;
			-moz-transform-origin: 0 0;
			-ms-transform-origin: 0 0;
			-webkit-transform-origin: 0 0;
			transform-origin: 0 0;
		}

		#container {
			display: none;
			-moz-transform-origin: 0 0;
			-ms-transform-origin: 0 0;
			-webkit-transform-origin: 0 0;
			transform-origin: 0 0;

		}

		#waku {
			overflow: hidden;
			background-color: #808080
		}

		#waku2 {
			overflow: hidden;
			background-color: #808080
		}


		#jpg {
			display: none;
			-moz-transform-origin: 0 0;
			-ms-transform-origin: 0 0;
			-webkit-transform-origin: 0 0;
			transform-origin: 0 0;

		}

		#shopcd {
			display: none;
		}

		#fileextension {
			display: none;
		}

		#file1 {
			display: none;
		}

		#file2 {
			display: none;
		}

		#file3 {
			display: none;
		}

		#file4 {
			display: none;
		}

		#file5 {
			display: none;
		}

		#file6 {
			display: none;
		}

		#file7 {
			display: none;
		}

		#file8 {
			display: none;
		}

		#file9 {
			display: none;
		}

		#file10 {
			display: none;
		}

		#syusei {
			display: none;
		}

		#eturanbtn {
			display: none;
		}


		.box-2 {
			display: flex;
			flex-wrap: wrap;

		}

		.box-2 .inner {
			flex: 0 0 50%;
			position: relative;
			display: inline-block;
			text-align: top;
		}

		.box-2 .inner::before {
			content: '';
			display: block;
		}

		.box-2 .inner div {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
		}

		.box-2 .inner:nth-child(even) div {
			background: #eee;
		}



		/* �Ƥ��� */
		.toolbar li {
			width: 45px;
			height: 45px;
			margin: auto;
			list-style-type: none;
			margin: 10px 10px 0px 0px;
			display: block;
			float: left;
		}

		#black {
			background-color: black;
		}

		#red {
			background-color: red;
		}

		#green {
			background-color: green;
		}

		#blue {
			background-color: blue;
		}

		#pink {
			background-color: pink;
		}

		#small {
			text-align: center;
			line-height: 44px;
			font-size: 150%;
			font-color: #FFFFFF;
			background-color: #FFF;
		}

		#middle {
			text-align: center;
			line-height: 44px;
			font-size: 150%;
			font-color: #FFFFFF;
			background-color: #FFF;
		}

		#large {
			text-align: center;
			line-height: 44px;
			font-size: 150%;
			font-color: #FFFFFF;
			background-color: #FFF;
		}

		#eraser {
			text-align: center;
			line-height: 44px;
			font-size: 150%;
			font-color: #FFFFFF;
			background-color: #FFF;
		}

		#zoom {
			text-align: center;
			line-height: 44px;
			font-size: 150%;
			font-color: #FFFFFF;
			background-color: #FFF;
		}

		#tegaki {
			text-align: center;
			line-height: 44px;
			font-size: 150%;
			font-color: #FFFFFF;
			background-color: #FFF;
		}

		/* ��������������ʬ��CSS */
		.canvas {
			width: 450px;
			height: 400px;
			border: 1px solid #ccc;
		}

		.canvas canvas {
			width: 450px;
			height: 400px;
		}

		/* ����ܥ����CSS */
		#delete_button {
			width: 450px;
			height: 44px;
			margin-top: 10px;
		}
	</style>
	<script>
		/*
		 $(function(){
		 $(document).on('contextmenu',function(e){//������å��ػ�
		return false;
		});
		 });

		 $(function(){
		 $('iframe').on('contextmenu',function(e){//������å��ػ�
		return false;
		});
		 });
		 */
	</script>
	<script type="text/javascript" src="./js/pdf.js"></script>
	<script type="text/javascript">
		var ChoseiIframeHeight = 0;//iframe�ι⤵

		window.onload = function () {

			var GenbaCD = "__GenbaCD__";


			/*
				var $iframe = $('#startframe1');
				var startframe1 = document.getElementById("startframe1");//�ǽ��ɽ�������iframe�κ�¦
				var startframe2 = document.getElementById("startframe2");//�ǽ��ɽ�������iframe�α�¦
				var ifrmDoc = $iframe[0].contentWindow.document;
				var iframeHeight = ifrmDoc.documentElement.scrollHeight;//iframe�ι⤵
	
				var element = document.getElementById( "headerimg" ) ;
	
				var intervalId = setInterval( function () {
					if ( element.complete) {
						var width = element.naturalWidth ;
						var height = element.naturalHeight ;//�إå����ι⤵
						clearInterval( intervalId ) ;
	
	
						ChoseiIframeHeight = iframeHeight - height;
						console.log(ChoseiIframeHeight -100);
						startframe1.style.height = ChoseiIframeHeight -100;
						startframe2.style.height = ChoseiIframeHeight -100;
					}
				}, 500 ) ;
			*/

		};

		function set2fig(num) {

			// �����1����ä�����Ƭ��0��ä���2���Ĵ������
			var ret;
			if (num < 10) { ret = "0" + num; }
			else { ret = num; }
			return ret;

		}

		function showClock1() {

			var nowTime = new Date();


			var nowHour = set2fig(nowTime.getHours());
			var nowMin = set2fig(nowTime.getMinutes());
			var nowSec = set2fig(nowTime.getSeconds());
			var msg = "<font size=6 color=black>" + nowHour + ":" + nowMin + ":" + nowSec + "</font>";

			document.getElementById("RealtimeClockArea").innerHTML = msg;

			console.log(nowHour + ":" + nowMin + ":" + nowSec);

			if (nowHour + ":" + nowMin + ":" + nowSec == "00:00:00") {
				reload();
			}

		}
		setInterval('showClock1()', 1000);

		var timer;//�����ޡ���
		var RelodeTimer;//�����ޡ���

		var first = "__FirstPic__";//�ɤ߹�����ǽ��url
		var FirstNo = "__FirstNo__";//�ɤ߹��߻���pdf��jpg��Ƚ��
		//        var PeintBtn = "__PeintBtn__";//�����ɤ߹���ǥڥ���Ȳ����Ƥʤ�
		var PastNo = "__PastNo__";
		var ExNo;
		var ZoomFlg;
		var zoom = 1;
		var pinching = false;
		var d0 = 1;
		var d1 = 1;
		var nowWidth; // ���ߤβ�������
		var nowHeight; // ���ߤβ����ι⤵
		var startX, startY, x, y;
		var thisX, thisY;
		var borderWidth = 0;
		var startPosX = 0; // ���å����Ϥޤä�X��ɸ
		var startPosY = 0; // ���å����Ϥޤä�Y��ɸ
		var zahyo1 = 1;//zoomΨ
		var zahyo2 = 1;//zoomΨ
		var nowTransY = 0;//����ư��Υ
		var nowTransX = 0;//�İ�ư��Υ
		var dx = 0;
		var dy = 0;
		var CameraFlg = false;

		function jpg(URL, FileNo) {//jpg�λ��Υڥ���Ȳ��̺���

			$("#jpg").css({ 'transform': 'scale(1)', '-webkit-transform': 'scale(1)', '-moz-transform': 'scale(1)', '-ms-transform': 'scale(1)' });

			var url = URL;
			var imageMemory = new Array(7);
			var flagMemory = 0;
			var ImageData;
			var paintFlag = "pen";
			var isDrawing = false;
			ZoomFlg = true;


			$("#zoom").click(function () {//������ܥ���򲡤�����
				ZoomFlg = true;
				document.getElementById("zoom").style.display = "none";
				document.getElementById("tegaki").style.display = "block";
			});

			$("#tegaki").click(function () {//��񤭥ܥ���򲡤�����
				ZoomFlg = false;
				document.getElementById("zoom").style.display = "block";
				document.getElementById("tegaki").style.display = "none";
			});




			var canvas = document.getElementById('jpg');
			if (!canvas || !canvas.getContext) { return false; }
			var ctx = canvas.getContext('2d');


			ctx.fillStyle = '#ffffff';
			ctx.setTransform(1, 0, 0, 1, 0, 0);

			ctx.clearRect(0, 0, canvas.width, canvas.height);

			/* Image���֥������Ȥ����� */
			/* Image���֥������Ȥ����� */
			var img = new Image();

			/* �������ɤ߹��ޤ��Τ��ԤäƤ��������³�� */
			img.onload = function () {
				var img_w_max = canvas.width;
				var img_w = img.width;
				var img_w_per = img_w / img_w_max;

				var img_h_max = canvas.height;
				var img_h = img.height;
				var img_h_per = img_h / img_h_max;



				img_w = img_w_max;
				img_h /= img_w_per;


				// �Ĥ��Ϥ߽Ф��Ƥ�����
				if (img_h_max < img_h) {
					img_h = img_h_max;
					img_w = img.width / img_h_per;
				}

				ctx.drawImage(img, 0, 0, img_w, img_h);
			}

			img.src = url;




			var bZoom = true;
			var w = 450;
			var h = 400;
			var drawing = false;
			var oldPos;




			// Canvas��Context����������
			ctx.strokeStyle = "#000000";
			ctx.lineWidth = 1;
			ctx.lineJoin = "round";
			ctx.lineCap = "round";

			$('#undo, #forwardBtn').attr('disabled', true);

			saveImageData();

			// ���å׳��ϻ��ˡ��������������򤹤�
			$('#jpg').on('touchstart', function (e) {

				if (flagMemory == "1" && ZoomFlg == false) {
					saveImageData();
				}
				if (bZoom) {
					// ������ξ��Τ�
					startPosX = e.originalEvent.touches[0].screenX;
					startPosY = e.originalEvent.touches[0].screenY;


				}
				e.preventDefault();

				thisX = e.pageX || e.originalEvent.changedTouches[0].pageX;
				thisY = e.pageY || e.originalEvent.changedTouches[0].pageY;

				startX = thisX - $(this).offset().left - borderWidth;
				startY = thisY - $(this).offset().top - borderWidth;
				startX = startX / zoom;
				startY = startY / zoom;
				//           console.log(startX,startY);


				if (paintFlag === "pen") {
					isDrawing = true;
					ctx.beginPath();
					ctx.moveTo(startX, startY);
				}

				if (paintFlag === "fill") {

					ImageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
					var colorCode = $('.color')[0].value;
					var rgbCode = new Array(3);
					rgbCode[0] = parseInt(colorCode.substr(0, 2), 16)
					rgbCode[1] = parseInt(colorCode.substr(2, 2), 16)
					rgbCode[2] = parseInt(colorCode.substr(4, 2), 16)
					//console.log('colorValue-10�ʿ�:' + rgbCode);
					regionFill(ImageData, startX, startY, rgbCode);
					/*
					 �֤������Ǥ�
					 ImageData.data[(startY*ImageData.width+startX)*4] = 255;
					 ImageData.data[(startY*ImageData.width+startX)*4+3] = 255;
					 */

					ctx.putImageData(ImageData, 0, 0);
				}
			})



			$('#jpg').on('touchmove', function (e) {

				if (ZoomFlg) {
					if (e.touches.length == 1) {

						isDrawing = false;
						pinching = false;

						if (bZoom) {

							// ������ξ��Τ�
							// ���å��κ�ɸ����
							var dx = e.originalEvent.touches[0].screenX - startPosX;
							var dy = e.originalEvent.touches[0].screenY - startPosY;





							// ���ߤ�transform�ͤ����
							var matrix = $('#jpg').css('transform');


							// �ͤ�matrix(0,0,0,0,0,0)�Υե����ޥåȤǤ����äƤ��롣
							// ̤����ξ���none
							if (matrix != 'none') {
								// �ͤβ���
								matrix = matrix.substring(7, matrix.length - 1);
								var matList = matrix.split(',');
								var nowTransX = matList[4]; // �İ���(��ư������Υ)
								var nowTransY = matList[5]; // ������(��ư������Υ)
								var zahyo1 = matList[0]; // ����Ψ
								var zahyo2 = matList[3]; // ����Ψ



								// ��ʬ��ä���
								dx = parseInt(nowTransX) + parseInt(dx);
								dy = parseInt(nowTransY) + parseInt(dy);


								// ��ư�ΰ�������
								// ���⤷�ʤ��Ȳ��̤�Ϥ߽Ф��Ƥ��ޤ��Τ�
								var minWidth = $('#org-width').val();
								var minHeight = $('#org-height').val();
								var maxDx = nowWidth - minWidth;
								var maxDy = nowHeight - minHeight;


								// ��ü�ޤ�
								if (dx > 0) {
									dx = 0;
								}
								// ��ü�ޤ�
								if (Math.abs(dx) > Math.abs(maxDx)) {
									dx = -(maxDx);
								}
								// ��ü�ޤ�
								if (Math.abs(dy) > Math.abs(maxDy)) {
									dy = -(maxDy);
								}
								// ��ü�ޤ�
								if (dy > 0) {
									dy = 0;
								}



								//�����ǰ�ư�Ȥ����Ƥ�

								$('#jpg').css({
									'transform': 'matrix(' + zahyo1 + ', 0, 0, ' + zahyo2 + ',' + dx + ',' + dy + ')',
									'-webkit-transform': 'matrix(' + zahyo1 + ', 0, 0, ' + zahyo2 + ',' + dx + ',' + dy + ')',
									'-moz-transform': 'matrix(' + zahyo1 + ', 0, 0, ' + zahyo2 + ',' + dx + ',' + dy + ')',
									'-ms-transform': 'matrix(' + zahyo1 + ', 0, 0, ' + zahyo2 + ',' + dx + ',' + dy + ')'
								});
								var matrix2 = $('#jpg').css('transform');




								// ���å����֤�����
								// touchmove�ξ�硢���å���Υ��ʤ��Τ�touchstart���¹Ԥ���ʤ��ΤǤ�����ǹ�������ɬ�פ���
								startPosX = e.originalEvent.touches[0].screenX;
								startPosY = e.originalEvent.touches[0].screenY;



							}
						}

					}//length

					if (e.touches.length == 2) {

						isDrawing = false;

						if (!pinching) {
							pinching = true;
							d0 = Math.sqrt(
								Math.pow(e.touches[1].screenX - e.touches[0].screenX, 2) +
								Math.pow(e.touches[1].screenY - e.touches[0].screenY, 2)
							);
						} else {
							d1 = Math.sqrt(
								Math.pow(e.touches[1].screenX - e.touches[0].screenX, 2) +
								Math.pow(e.touches[1].screenY - e.touches[0].screenY, 2)
							);
							// ���󤫤鲿�ܤε�Υ���ư��������׻�
							zoom = d1 / d0;




							//�����򥺡���
							$("#jpg").css({ 'transform': 'scale(' + zoom + ')', '-webkit-transform': 'scale(' + zoom + ')', '-moz-transform': 'scale(' + zoom + ')', '-ms-transform': 'scale(' + zoom + ')' });




							// �Ǿ����������Ψ������
							// ����Ϻ���3�ܤޤǤγ���Ψ
							var maxWidth = $('#org-width').val() * 3;
							var maxHeight = $('#org-height').val() * 3;
							var minWidth = $('#org-width').val();
							var minHeight = $('#org-height').val();

							// ����ε�Υ�Ȥ���Ψ�����
							var newWidth = $('#jpg').width() * zoom;
							var newHeight = $('#jpg').height() * zoom;


							if (newWidth > minWidth) {
								// ������
								bZoom = true;
							}
							else {
								// ���礷�Ƥ��ʤ�
								//                           bZoom = false;
							}




						}//pinching

					}//length

				} else {//��������
					if (e.touches.length == 1) {
						// ����Ψ�����å������ʣ������󤸤�ʤ��Ȥ��Ͻ�����λ�����
						if (!checkZoom()) return;

						if (!isDrawing) return;
						e.preventDefault();
						thisX = e.pageX || e.originalEvent.changedTouches[0].pageX;
						thisY = e.pageY || e.originalEvent.changedTouches[0].pageY;
						x = thisX - $(this).offset().left - borderWidth;
						y = thisY - $(this).offset().top - borderWidth;
						x = x / zoom;
						y = y / zoom;
						//                   console.log(x,y);

						ctx.lineTo(x, y);
						ctx.stroke();
					}
					e.preventDefault();
				}

			})


			$('#jpg').on('touchend', function () {
				saveImageData();
				//console.log("touchend mouseup");
				isDrawing = false;
				pinching = false;

			})

			$('#jpg').on('touchleave', function (e) {
				//console.log("touchleave mouseleave");
				if (!isDrawing) return;
				saveImageData();
				e.preventDefault();

				thisX = e.pageX || e.originalEvent.changedTouches[0].pageX;
				thisY = e.pageY || e.originalEvent.changedTouches[0].pageY;
				x = thisX - $(this).offset().left - borderWidth;
				y = thisY - $(this).offset().top - borderWidth;

				x = x / zoom;
				y = y / zoom;

				ctx.lineTo(x, y);
				ctx.stroke();

				isDrawing = false;
			});







		}//function jpg �����ޤ�


		//�Ȥ��Ƥʤ�����
		function Onclick(idLink, URL, FileNo, ShopCD, FileExtension) {//�ƹ��ܤΥܥ��󲡤�������ư��

			$('#container').empty();//id=container�λҾä�(���ꥢ)
			$('#jpg').empty();//id=jpg�λҾä�(���ꥢ)
			zoom = 1;

			//  $('#iframe').empty();//id=jpg�λҾä�(���ꥢ)

			PastNo = "1";
			document.getElementById(idLink).src = URL;
			var url = URL;
			document.getElementById("shopcd").innerHTML = ShopCD;
			document.getElementById("fileextension").innerHTML = FileExtension;
			document.getElementById("container").style.display = "none";
			document.getElementById("btn_print").style.display = "block";
			document.getElementById("file1").style.display = "none";
			document.getElementById("file2").style.display = "none";
			document.getElementById("file3").style.display = "none";
			document.getElementById("file4").style.display = "none";
			document.getElementById("file5").style.display = "none";
			document.getElementById("file6").style.display = "none";
			document.getElementById("file7").style.display = "none";
			document.getElementById("file8").style.display = "none";
			document.getElementById("file9").style.display = "none";
			document.getElementById("file10").style.display = "none";

			if (FileNo == "2") {

				FirstNo = "2-0";
				document.getElementById("btn_print").style.display = "none";
				document.getElementById("iframe").style.display = "block";
				document.getElementById("container").style.display = "none";
				document.getElementById("jpg").style.display = "none";

				pdf(url, "2");

			} else {

				FirstNo = "1-0";
				document.getElementById("btn_print").style.display = "block";
				document.getElementById("iframe").style.display = "none";
				document.getElementById("jpg").style.display = "block";

				jpg(url, "1");

			}
		}

		function Print() {

			if (PastNo == "2") {//�����������ơ�����1�祯��å�������
				var cvs = document.getElementById("pastjpg");
				var img_png_src = cvs.toDataURL("image/png");

				document.getElementById("imgsrc").src = img_png_src;

				$("#image2").printThis();

			} else if (FirstNo == "2") {//�����ɤ߹����iframe(pdf)�ʤ�
				//����pdf���ͤΰ��������Ƥۤ�������¸�ܥ���ä�


			} else if (FirstNo == "1") {//�����ɤ߹����iframe(jpg)�ʤ�
				//id=FramePrint�����(toDataURL���ʤ�)
				$("#image2").printThis();


			} else if (FirstNo == "2-0") {//���Υܥ��󲡤�����(iframe��pdf)

				//����pdf���ͤΰ��������Ƥۤ�������¸�ܥ���ä�
				var cvs = document.getElementById("container");
				var img_png_src = cvs.toDataURL("image/png");
				document.getElementById("imgsrc").src = img_png_src;

				$("#image2").printThis();

			} else if (FirstNo == "1-0") {//���Υܥ��󲡤�����(canvas��jpg)
				//id=FramePrint�����(toDataURL���ʤ�)id=jpg

				var cvs = document.getElementById("jpg");
				var img_png_src = cvs.toDataURL("image/png");
				document.getElementById("imgsrc").src = img_png_src;

				$("#image2").printThis();


			} else if (ExNo == "2") {//���Υܥ��󲡤�����(canvas��jpg)
				//id=FramePrint�����(toDataURL���ʤ�)id=jpg

				$("#image2").printThis();

			}
		}

		//�Ȥ��Ƥʤ�����
		function Camera(id, URL) {

			CameraFlg = true;
			document.getElementById("iframe").src = URL;
			document.getElementById("iframe").style.display = "block";
			document.getElementById("container").style.display = "none";
			document.getElementById("jpg").style.display = "none";
			document.getElementById("pastjpg").style.display = "none";
			document.getElementById("file1").style.display = "none";
			document.getElementById("file2").style.display = "none";
			document.getElementById("file3").style.display = "none";
			document.getElementById("file4").style.display = "none";
			document.getElementById("file5").style.display = "none";
			document.getElementById("file6").style.display = "none";
			document.getElementById("file7").style.display = "none";
			document.getElementById("file8").style.display = "none";
			document.getElementById("file9").style.display = "none";
			document.getElementById("file10").style.display = "none";

		}

		//�����ܥ��󲡲�����ư
		function reload() {
			window.location.href = 'g_monitor101.php?GenbaCD=__GenbaCD__&rKey=__rKey__&SuperReloadFlg=true?__param__';
		}


		//�ե�������ܥ���򥯥�å�������
		function Folderclick(fno) {//�ƹ��ܤΥܥ��󲡤�������ư��

			CameraFlg = false;
			for (var i = 1; i < 11; i++) {
				if (i != fno) {
					document.getElementById("file" + i).style.display = "none";
					document.getElementById("folder" + i).style.color = "white";

				} else {
					document.getElementById("file" + i).style.display = "block";
					document.getElementById("folder" + i).style.color = "black";
				}
			}
			document.getElementById("iframe").style.display = "none";
			document.getElementById("container").style.display = "none";
			document.getElementById("jpg").style.display = "none";
			document.getElementById("pastjpg").style.display = "none";


		}


		//����Υե�����̾�򥯥�å������Ȥ�
		function FileClick(idLink, no, Extension) {

			iframeClose();

			PastNo = "1";
			FirstNo = "3";

			if (Extension == "pdf") {
				ExNo = "1";
				//document.getElementById("btn_print").style.display="none";
			} else {
				ExNo = "2";
				//document.getElementById("btn_print").style.display="block";
				//document.getElementById("imgsrc").src = URL;
			}


			// document.getElementById("StartFrame").style.display = "none";//���ɽ����2iframe�ä�
			document.getElementById("StartFrame2").style.display = "none";//���ɽ���α�¦iframe�ä�
			//ueda edit


			document.getElementById("FramePrint" + no).style.display = "block";
			document.getElementById("close").style.display = "block";

			//document.getElementById(idLink).src = URL;
			// document.getElementById("file" + fno).style.display="none";

			//�Ĥ�Ĺ����·����
			document.getElementById(idLink).style.height = (ChoseiIframeHeight - 32);//�إå���ʬ���Ĥ���ܥ���ʬ

			//������ȥ����󳫻ϡ�2ʬ����Ĥ���
			clearTimeout(timer);
			timer = setTimeout(Close, 120000);

		}

		var Close = function () {
			iframeClose();
		};

		function Change(num) {

			if (num == "1") {
				document.getElementById("syusei").style.display = "block";
				document.getElementById("eturan").style.display = "none";
				document.getElementById("eturanbtn").style.display = "block";
				document.getElementById("syuseibtn").style.display = "none";

			} else {
				document.getElementById("syusei").style.display = "none";
				document.getElementById("eturan").style.display = "block";
				document.getElementById("eturanbtn").style.display = "none";
				document.getElementById("syuseibtn").style.display = "block";

			}
		}

		// ���饤�ɥ��硼ɽ��

		var Sample = {
			// wait: 300, //���饤�ɥ��硼�ɤ߹��ߤϤ����Ե����֡���)
			wait: 600, //���饤�ɥ��硼�ɤ߹��ߤϤ����Ե����֡���)
			// wait2: 30, //���饤�ɥ��硼ɽ���Ե����֡���)
			wait2: 60, //���饤�ɥ��硼ɽ���Ե����֡���)//���饤�ɥ��硼�Ϥޤ�ޤǤ��Ե�����
		};
		var slide = 0;
		var IntervarID;
		var slideflg = 0;
		var id;
		var slidestart = 0;

		// ���饤�ɥ��硼�����������// ���̤򥿥å������Ȥ��ν���
		Sample.record = function () {

			document.getElementById('fslide').contentWindow.koFunc1();
			// ����Υ����ߥ󥰤ǡܣ����ä�Ͽ���Ƥ���
			this.timeout = +new Date() + this.wait * 1000;

			this.Timeout = +new Date() + this.wait2 * 1000;

			// ���饤�ɥ��硼����ɽ�����ۤ���ɽ��

			document.getElementById("fslide").style.display = "none";
			document.getElementById("all").style.display = "block";
			document.getElementById("head").style.display = "block";

			slide = 0;

			// �����ޡ����٥�Ȥ�λ����
			clearInterval(IntervarID);
			clearInterval(id);

			document.getElementById("fslide").src = "g_slide.php?GenbaCD=__GenbaCD__";

			IntervarID = null;
			id = null;

		};

		// ���饤�ɥ��硼���Ͻ���
		Sample.check = function () {

			// �ǽ��undefined������Ȥꤢ�������������¹Ԥ��Ƥ���
			if (this.timeout == undefined) this.record();

			// ���߻��֤�����������ä��줿���֤�Ķ�������ʤĤޤ���������÷вᤷ�����

			if (this.timeout - new Date() < 0 && slidestart == 0) {

				//window.location.reload(true);
				//document.getElementById("slideword").innerHTML = "���饤�ɥ��硼�ɤ߹����档<br>���������������Ϻ��ɹ��򲡤��Ƥ���������";

				document.getElementById('fslide').contentWindow.PicDisplay();

				$(function () {

					setTimeout(function () {
						//document.getElementById("slideword").innerHTML = "";
						slidestart = 1;

					}, 90000);
				});

			}


			if (this.Timeout - new Date() < 0) {

				if (CameraFlg == false) {

					document.getElementById('fslide').contentWindow.koFunc2();

					// ���饤�ɥ��硼��ɽ�����ۤ�����ɽ��
					document.getElementById("fslide").style.display = "block";
					document.getElementById("all").style.display = "none";
					document.getElementById("head").style.display = "none";

				}

			}

		}


		document.addEventListener('DOMContentLoaded', function () {
			// �ƥե졼��Υ��٥��
			document.addEventListener('touchstart', function () { Sample.record() }, false);
			document.addEventListener('mousedown', function () { Sample.record() }, false);

			// �ҥե졼��Υ��٥��
			var iframeElements = document.getElementsByTagName('iframe');
			for (var i = 0; i < iframeElements.length; i++) {
				iframeElements[i].addEventListener('load', (function (element) {
					return function () {
						element.contentWindow.document.addEventListener('touchstart', function () { Sample.record() }, false);
						element.contentWindow.document.addEventListener('mousedown', function () { Sample.record() }, false);
					};
				})(iframeElements[i]), false);
			}
		}, false);

		// ���饤�ɥ��硼���ϥ����ޡ��������ȡ�500ms��˼¹Ԥ����
		// setInterval(function () { Sample.check() }, 500);

		// ���饤�ɥ��硼���������



		function iframeClose() {//����ե�����򳫤��Ƥ�����֤��Ĥ���ܥ���򲡲����ε�ư

			//2��ɽ���ξ��֤��᤹
			document.getElementById("StartFrame").style.display = "flex";
			//document.getElementById("FramePrint").style.display = "none";


			var ComLoop = "__ComCnt__";

			for (var i = 0; i < ComLoop; i++) {
				var no = i + 1;
				document.getElementById("FramePrint" + no).style.display = "none";
			}

			document.getElementById("close").style.display = "none";

		}


	</script>

</head>



<body text="__STextColor__" link="__SLinkColor__" alink="__SALinkColor__" vlink="__SVLinkColor__" style="position:fixed;">
	<div class="content">
		<!--TOP-->

		<div class="relative" id="head">
			<!-- <a href="javascript:location.reload(true);"><img src="./images/header.png" id="headerimg"></a> -->
			<!-- <a href="javascript:reload();"><img src="./images/header.png" id="headerimg"></a> -->
			<a href="javascript:reload();"><img src="./images/header3.png" id="headerimg"></a>
			<!--<p class="absolute infohaba ">__Telop__</p>-->
			<p id="slideword" class="absolute infohaba3"></p>
		</div>

		<!--	<span id="header"><a href="javascript:location.reload(true);"><img src="./images/yomikomi.png" width="100px" height="100px"></a></span>-->


		<!--
		<table style="margin: 40px auto;" border="0">
		<tbody>
			<tr>
			<td>
				<img src="./images/g3_rogo2.png">
			</td>

			</tr>
		</tbody>
		</table>-->

		<!--   <table style="margin-left:auto; margin-right:auto;" border="0">
		<tbody>
			<tr>
				<td>
				<img src="./images/giza.png">
				</td>
			</tr>
			</tbody>
		</table>
		<br>-->


		<span id="all">
			<div class="kakoi" style="text-align:left;" border="0">
				<div class="side-corner-tag">
					<!--    <div class="side-corner-tag" style="height: 100vh;">�����⤵����-->
					<div class="box">


						<table class="marukakoi" style="width: 100%; ">
							<tr>
								<td colspan="4" rowspan="2" class="maru" valign="top" id="maru" align="right"><input id="close" type="button" class="button" value="�Ĥ���" style="display:none; " onclick="iframeClose();">

									<!--		<div id="waku"><canvas id="container" name="dFrame"  height="1500" width="1200"></canvas></div><br>-->

									<input type="hidden" name="org-width" id="org-width" value="" />
									<input type="hidden" name="org-height" id="org-height" value="" />

									<!--		<div id="waku2"><canvas id="jpg" width="1200" height="1250"></canvas></div>
									<div id="waku2"><canvas id="pastjpg" width="1200" height="1250"></canvas></div>-->

									<span id="StartFrame" class="box-2">
										<span id="StartFrame1" class="inner"><iframe src='http://www3.489501.jp/g04/__FirstPic__' id="startframe1" viewrect=10,10,800,0 scrolling="auto" messages=0 marginwidth="0" marginheight="0" frameborder="0" style="border:none; width:100%; height:2000px;"></iframe></span>
										<span id="StartFrame2" class="inner"><iframe src='http://www3.489501.jp/g04/__SecondPic__' id="startframe2" scrolling="auto" messages=0 marginwidth="0" marginheight="0" frameborder="0" style="border:none;  height:2000px; width:100%; "></iframe></span>
										__ComLoop__
										<span id="FramePrint__cNo__" class="inner"><iframe src='http://www3.489501.jp/g04/__mFolderPic__' class="iframes" name="cFrame" id="iframe" scrolling="auto" messages=0 marginwidth="0" marginheight="0" frameborder="0" style="border:none; height:2000px; width:100%;"></iframe></span>
										__ComLoop__
									</span>
									<!-- __ComLoop__
									<div id="FramePrint__cNo__" style="display:none"><iframe src='http://www3.489501.jp/g04/__mFolderPic__' class="iframes" name="cFrame" id="iframe" viewrect=10,10,800,0 scrolling="auto" messages=0 marginwidth="0" marginheight="0" frameborder="0" style="border:none; height:2000px; width:100%;"></iframe></div>
									__ComLoop__ -->


									<div id=shopcd>__ShopCD__</div>
									<div id=fileextension>__FileExtension__</div>
									<div id="image2"><img src="http://www3.489501.jp/g04/__FirstPic__" id="imgsrc"></div>

									<!--
											<div id="file1">
									__ComLoop1__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic1__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic1__?__Time__','__mFileExtension1__','1');" target="cFrame">
											<div>__mFileName1__</div>
											</a></span>
									__ComLoop1__


									__fFileName1Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic1__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic1__?__Time__','__fFileExtension1__','1');" target="cFrame">
											<div>__fFileName1__</div>
											</a></span>
									__fFileName1Loop__
											</div>
									AA
											<div id="file2">
									__ComLoop2__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic2__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic2__?__Time__','__mFileExtension2__','2');" target="cFrame">
											<div>__mFileName2__</div>
											</a></span>
									__ComLoop2__

									__fFileName2Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic2__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic2__?__Time__','__fFileExtension2__','2');" target="cFrame">
											<div>__fFileName2__</div>
											</a></span>
									__fFileName2Loop__
											</div>


											<div id="file3">
									__ComLoop3__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic3__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic3__?__Time__','__mFileExtension3__','3');" target="cFrame">
											<div>__mFileName3__</div>
											</a></span>
									__ComLoop3__

									__fFileName3Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic3__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic3__?__Time__','__fFileExtension3__','3');" target="cFrame">
											<div>__fFileName3__</div>
											</a></span>
									__fFileName3Loop__
											</div>

											<div id="file4">
									__ComLoop4__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic4__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic4__?__Time__','__mFileExtension4__','4');" target="cFrame">
											<div>__mFileName4__</div>
											</a></span>
									__ComLoop4__

									__fFileName4Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic4__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic4__?__Time__','__fFileExtension4__','4');" target="cFrame">
											<div>__fFileName4__</div>
											</a></span>
									__fFileName4Loop__
											</div>

											<div id="file5">
									__ComLoop5__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic5__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic5__?__Time__','__mFileExtension5__','5');" target="cFrame">
											<div>__mFileName5__</div>
											</a></span>
									__ComLoop5__

									__fFileName5Loop__

											<span id="kaigyo"><a class="filebutton" href=__fFolderPic5__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic5__?__Time__','__fFileExtension5__','5');" target="cFrame">
											<div>__fFileName5__</div>
											</a></span>
									__fFileName5Loop__
											</div>

											<div id="file6">
									__ComLoop6__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic6__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic6__?__Time__','__mFileExtension6__','6');" target="cFrame">
											<div>__mFileName6__</div>
											</a></span>
									__ComLoop6__
									__fFileName6Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic6__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic6__?__Time__','__fFileExtension6__','6');" target="cFrame">
											<div>__fFileName6__</div>
											</a></span>
									__fFileName6Loop__
											</div>

											<div id="file7">
									__ComLoop7__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic7__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic7__?__Time__','__mFileExtension7__','7');" target="cFrame">
											<div>__mFileName7__</div>
											</a></span>
									__ComLoop7__
									__fFileName7Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic7__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic7__?__Time__','__fFileExtension7__','7');" target="cFrame">
											<div>__fFileName7__</div>
											</a></span>
									__fFileName7Loop__
											</div>

											<div id="file8">
									__ComLoop8__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic8__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic8__?__Time__','__mFileExtension8__','8');" target="cFrame">
											<div>__mFileName8__</div>
											</a></span>
									__ComLoop8__
									__fFileName8Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic8__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic8__?__Time__','__fFileExtension8__','8');" target="cFrame">
											<div>__fFileName8__</div>
											</a></span>
									__fFileName8Loop__
											</div>

											<div id="file9">
									__ComLoop9__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic9__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic9__?__Time__','__mFileExtension9__','9');" target="cFrame">
											<div>__mFileName9__</div>
											</a></span>
									__ComLoop9__
									__fFileName9Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic9__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic9__?__Time__','__fFileExtension9__','9');" target="cFrame">
											<div>__fFileName9__</div>
											</a></span>
									__fFileName9Loop__
											</div>

											<div id="file10">
									__ComLoop10__
											<span id="kaigyo"><a class="filebutton" href=__mFolderPic10__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__mFolderPic10__?__Time__','__mFileExtension10__','10');" target="cFrame">
											<div>__mFileName10__</div>
											</a></span>
									__ComLoop10__
									__fFileName10Loop__
											<span id="kaigyo"><a class="filebutton" href=__fFolderPic10__  onclick="FileClick('iframe','http://www3.489501.jp/g04/__fFolderPic10__?__Time__','__fFileExtension10__','10');" target="cFrame">
											<div>__fFileName10__</div>
											</a></span>
									__fFileName10Loop__
											</div>
									-->

					</div>



					</td>

					<!-- ���פȱ�ü�Υ���å���ǽ�ե�������� �쥤������ɽ�� -->
					<td valign="top" align="left" width="315px">

						<span id="eturan">
							<table>
								<!--����-->
								<tr>
									<td align="center">
										<p id="RealtimeClockArea">
											<font size=6></font>
										</p>
									</td>
								</tr>
								__ComLoop__
								<tr>
									<td><a class="filebutton" onclick="FileClick('iframe','__cNo__','__mFileExtension__');" target="cFrame">__mFileName__</a></td>
								</tr>
								__ComLoop__
						</span>

						<table>

							<!--<tr><td><a class="button camera1" id="camera1" href="javascript:Camera('camera1','./g04_camera1.php?GenbaCD=__GenbaCD__')" target="cFrame"></a></td>
					            <td><a class="button camera2" id="camera2" href="javascript:Camera('camera2','./g04_camera2.php?GenbaCD=__GenbaCD__')" target="cFrame"></a></td></tr>-->


							<!--				<tr>
						    <td><a class="button print" id="btn_print" href="javascript:Print()"></a></td>
							</tr>-->

							<!-- QR������ɽ�� -->
							<!--						    <td colspan="2"><a class="button1 qr" id="qr" ></a></td>-->
							<!-- <tr>
								<td id="qr" colspan="2"><img src="http://chart.googleapis.com/chart?chs=130x130&cht=qr&chl=http://www3.489501.jp/g04/g_monitor3.php?GenbaCD=__GenbaCD__" / style="margin-left:7px"></td>
							</tr> -->

							<!-- ŷ��ɽ�� -->
							<!-- <tr>
								<td colspan="2"><iframe src="http://www3.489501.jp/g04/g_weather.php?GenbaCD=__GenbaCD__" height="150px" scrolling=no frameborder="0"></iframe></td>
							</tr> -->

							<!--<tr><td><img src="./images/banner2.gif"></td></tr>-->

						</table>

					</td>


					</tr>
					</table>

					</td>
					</tr>
					</table>

				</div>
			</div>
	</div>
	</span>

	<!--
	<div id="slide">
	<ul>

	<!--<li>__sPic__</li>-->

	<div style="width:100%; display: flex; background-color: #808080;">

		<div style="width:1000px; height:2300px; background-color: #808080;"></div>

		<div>
			<iframe id="fslide" src="g_slide.php?GenbaCD=__GenbaCD__" alt='' style="border:none;  height:2300px; width:4000px; display:none;" frameborder="1" scrolling="no"></iframe>
		</div>

	</div>

	<!--</ul></div>-->

	<!--<div>http://api.openweathermap.org/data/2.5/group?id=1850147,1853908&appid=0d798907285583afc84a71a272c053e4</div>-->

	</div>
</body>

</html>