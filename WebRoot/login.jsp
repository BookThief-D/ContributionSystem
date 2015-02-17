<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.mvc.bean.User"%>
<%
	User user;
	if (session.getAttribute("userInfo") != null) {
		user = (User) session.getAttribute("userInfo");
		switch (user.getTypeID()) {
			case 1 :
				response.sendRedirect("../cs/manager.jsp");
				return;
			case 2 :
				response.sendRedirect("../cs/editor.jsp");
				return;
			case 3 :
				response.sendRedirect("../cs/expert.jsp");
				return;
			case 4 :
				response.sendRedirect("../cs/display.jsp");
				return;

		}
	}
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css">

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
<style>
td {
	padding-left: 15px
}
</style>
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
				password : {
					required : true,
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
					required : "请输入一个有效地址",
					email : "请输入一个有效地址"
				},
				password : {
					required : "请输入密码",
					minlength : jQuery.format("至少{0}个字符")
				}
			}
		});
	});
</script>
</head>


<body background="images/login_bg1.jpg">
	<div class="login">
		<form name="mainform" action="login.action" id="mainform"
			method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="53%" align="right" height="50" class="login_1">Email：</td>
					<td width="47%" align="left"><input type="text" name="email"
						id="email" class="login_2" /></td>
				</tr>
				<tr>
					<td align="right" height="50" class="login_1">密&nbsp; 码：</td>
					<td><input type="password" name="password" id="password"
						class="login_2" /></td>
				</tr>
				<tr>
				<tr>
					<td height="65">&nbsp;</td>
					<td><input type="submit" class="btn btn-blue big" value="登录" />&nbsp;&nbsp;&nbsp;
						<a class="btn btn-blue big" href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-blue big" value="重置" /></td>
				</tr>
				</tr>
				<tr>
					<td colspan="2" align="center"><br /> <br /> <br />&copy;Copyright
						2012 仁爱学院_计算机学术期刊_投稿系统</td>
				</tr>

			</table>
			<form />
	</div>
</body>
</html>
