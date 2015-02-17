<%@page import="com.mvc.bean.User"%>
<%@page import="com.utils.Base64Util"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	User user = (User) session.getAttribute("userInfo");
%>
<meta charset="utf-8" />

<title></title>

<meta name="description"
	content="Administry - Admin Template by www.865171.cn" />

<meta name="keywords" content="Admin,Template" />

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
				},
				password_confirm : {
					required : true,
					minlength : 6,
					equalTo : "#password"
				},
				age : {
					required : true,
					range : [ 0, 999 ],
					digits : true
				},
				realName : {
					required : true,
					minlength : 2,
					maxlength : 16
				},
				cardID : {
					required : true,
					digits : true
				},
				debitCard : {
					required : true,
					digits : true
				},
				tellphone : {
					required : true,
					digits : true,
					minlength : 8,
					maxlength : 16
				},
			},
			messages : {
				nickName : {
					required : "请输入昵称",
					minlength : jQuery.format("至少{0}位字符"),
					maxlength : jQuery.format("最多{0}位字符")
				},
				password : {
					required : "请输入密码",
					minlength : jQuery.format("至少{0}位字符")
				},
				password_confirm : {
					required : "请确认密码",
					minlength : jQuery.format("至少{0}位字符"),
					equalTo : "与密码不一致，请检查"
				},
				age : {
					required : "请输入年龄",
					range : "年龄最多三位数",
					digits : "只能输入数字"
				},
				realName : {
					required : "请输入真实姓名",
					minlength : jQuery.format("至少{0}位字符"),
					maxlength : jQuery.format("最多{0}位字符")
				},
				cardID : {
					required : "请输入身份证号",
					digits : "只能输入数字"
				},
				debitCard : {
					required : "请输入银行卡号",
					digits : "只能输入数字"
				},
				tellphone : {
					required : "请输入手机号码",
					minlength : jQuery.format("至少{0}位字符"),
					maxlength : jQuery.format("最多{0}位字符"),
					digits : "只能输入数字"
				}
			}
		});
	});
</script>
</head>

<body class="margin_left">

	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="100%" height="27" background="images/tab_05.gif"
				style="padding-left:38px;">当前位置 >> 用户管理 >> 用户列表 >> 修改用户信息</td>
		</tr>
		<tr>
			<td><div class="table_box2">
					<form id='mainform' name='mainform' action="modify.action"
						method='post' enctype="multipart/form-data">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th colspan="2" align="center"><font size="3px">修改用户基本信息

								
								</th>
							</tr>
							<tr>
								<td width="200" align="right" style="padding-top:20px;">用户编号：</td>
								<td style="padding-top:20px;"><input type="text"
									id="userID" name="userID" readonly="readonly"
									value="<%=user.getUserID()%>" />
								</td>
							</tr>

							<tr>
								<td align="right">电子邮箱：</td>
								<td><input id="email" name="email" type="text"
									readonly="readonly" value="<%=user.getEmail()%>" /></td>
							</tr>
							<tr>
								<td align="right">昵称：</td>
								<td><input id="nickName" name="nickName" type="text"
									value="<%=user.getNickName()%>" /></td>
							</tr>
							<tr>
								<td align="right">密码：</td>
								<td><input id="password" name="password" type="password"
									value="<%=user.getPassword()%>" /></td>
							</tr>

							<tr>
								<td align="right">密码确认：</td>
								<td><input id="password_confirm" name="password_confirm"
									type="password" value="<%=user.getPassword()%>" /></td>
							</tr>

							<tr>
								<td align="right">真实姓名：</td>
								<td><input id="realName" name="realName" type="text"
									value="<%=user.getRealName()%>" /></td>
							</tr>

							<tr>
								<td align="right">身份证号：</td>
								<td><input id="cardID" name="cardID" type="text"
									value="<%=user.getCardID()%>" /></td>
							</tr>
							<tr>
								<td align="right">银行卡号：</td>
								<td><input id="debitCard" name="debitCard" type="text"
									value="<%=user.getDebitCard()%>" /></td>
							</tr>
							<tr>
								<td align="right">年龄：</td>
								<td><input id="age" type="text" name="age"
									value="<%=user.getAge()%>" /></td>
							</tr>
							<tr>
								<td align="right">联系电话：</td>
								<td><input name="tellphone" type="text" id="tellphone"
									value="<%=user.getTellphone()%>" /></td>
							</tr>

							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" class="btn big" value="确认修改"
									style="font-size:12px;height:24px;" />&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</form>
				</div></td>
		</tr>
	</table>
</body>
</html>
