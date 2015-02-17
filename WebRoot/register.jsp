<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />

<title></title>

<!-- Favicons -->

<link rel="shortcut icon" type="image/png"
	HREF="img/favicons/favicon.png" />

<link rel="icon" type="image/png" HREF="img/favicons/favicon.png" />

<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />

<!-- Main Stylesheet -->

<link rel="stylesheet" href="css/style.css" type="text/css" />

<!-- Colour Schemes

Default colour scheme is blue. Uncomment prefered stylesheet to use it.

<link rel="stylesheet" href="css/brown.css" type="text/css" media="screen" />  

<link rel="stylesheet" href="css/gray.css" type="text/css" media="screen" />  

<link rel="stylesheet" href="css/green.css" type="text/css" media="screen" />

<link rel="stylesheet" href="css/pink.css" type="text/css" media="screen" />  

<link rel="stylesheet" href="css/red.css" type="text/css" media="screen" />

-->

<!-- Your Custom Stylesheet -->

<link rel="stylesheet" href="css/custom.css" type="text/css" />

<!--swfobject - needed only if you require <video> tag support for older browsers -->

<script type="text/javascript" SRC="js/swfobject.js"></script>

<!-- jQuery with plugins -->

<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>

<!-- Could be loaded remotely from Google CDN : <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->

<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>

<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>

<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>

<!-- jQuery tooltips -->

<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>

<!-- Superfish navigation -->

<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>

<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>

<!-- jQuery popup box -->

<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>

<!-- jQuery form validation -->

<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>

<!-- Internet Explorer Fixes -->

<!--[if IE]>

<link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>

<script src="js/html5.js"></script>

<![endif]-->

<!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->

<!--[if lt IE 8]>

<script src="js/IE8.js"></script>

<![endif]-->

<script type="text/javascript">
	$(document).ready(function() {
		// validate form on keyup and submit
		var validator = $("#mainform").validate({
			rules : {
				nickName : {
					required : true,
					minlength : 2,
					maxlength : 16
				},
				password : {
					required : true,
					minlength : 6,
					maxlength : 18
				},
				password_confirm : {
					required : true,
					equalTo : "#password",
					minlength : 6,
					maxlength : 18
				},
				email : {
					required : true,
					email : true
				}
			},
			messages : {
				email : {
					required : "请输入邮箱",
					email : "请输入正确的邮箱"
				},
				nickName : {
					required : "请输入昵称",
					minlength : jQuery.format("至少{0}位字符"),
					maxlength : jQuery.format("最多{0}位字符")
				},
				password : {
					required : "请输入密码",
					minlength : jQuery.format("至少{0}位字符"),
					maxlength : jQuery.format("最多{0}位字符")
				},
				password_confirm : {
					required : "请确认密码",
					equalTo : "与密码不一致，请检查",
					minlength : jQuery.format("至少{0}位字符"),
					maxlength : jQuery.format("最多{0}位字符")
				}
			}
		});
	});
</script>
</head>

<body background="images/register1.jpg" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/login_bg1.jpg', sizingMethod='scale');">
	<div>
		<strong><center>
				<p>&nbsp;</p>
				<p>
					<font color="#000000"><font size="6">新用户注册</font> </font>
				</p>
			</center> </strong>
	</div>
	<div class="register">
		<center>
			<form id="mainform" name="mainform" action="register.action"
				method="post" enctype="multipart/form-data">
				<table width="950" height="268" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="399" height="44" align="right">Email：</td>
						<td width="551" align="left"><input type="text" size="20" name="email" />
							<font color="red">* </font></td>
					</tr>
					<tr>
						<td width="399" height="44" align="right">用户名：</td>
						<td width="551" align="left"><input type="text" size="20" name="nickName" />
							<font color="red">* </font></td>
					</tr>
					<tr>
						<td height="43" align="right">密 码：</td>
						<td align="left"><input type="password" size="20" name="password"
							id="password" /> <font color="red">* </font></td>
					</tr>
					<tr>
						<td height="46" align="right">确认密码：</td>
						<td align="left"><input type="password" size="20" name="password_confirm"
							id="password_confirm" /> <font color="red"> * </font></td>
					</tr>
					<tr>
						<td height="40" align="right"></td>
						<td align="left">&nbsp;&nbsp; <input type="submit"
							class="btn btn-red big " value="注册" id="register" /> <input
							type="reset" class="btn btn-red big " value="重置 " id="reset" />
						</td>
					</tr>
					<tr>
						<td colspan="2"><p align="center">
								&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;为了准确为您服务，请准确填写( <font color="red">*
								</font>为号必填)
							</p>
						</td>
					</tr>
				</table>
			</form>
		</center>
	</div>


</body>
</html>
