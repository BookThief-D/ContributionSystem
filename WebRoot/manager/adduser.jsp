<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import=" java.util.List"%>
<%@page import="com.mvc.bean.Type"%>
<%@page import="com.mvc.biz.IUserCategoryBiz"%>
<%@page import="com.mvc.biz.IUserCategoryBizImp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	request.setCharacterEncoding("UTF-8");
	IUserCategoryBiz ictbb = new IUserCategoryBizImp();
	List<Type> lt = ictbb.getAll();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加用户</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
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
					email : {
						required : true,
						email : true
					},
					nickName : {
						required : true,
						minlength : 2,
						maxlength : 16
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
					email : {
						required : "请输入邮箱",
						email : "请输入正确的邮箱"
					},
					nickName : {
						required : "请输入昵称",
						minlength : jQuery.format("至少{0}位字符"),
						maxlength : jQuery.format("最多{0}位字符")
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



	<div class="table_box2">
		<form id='mainform' name='mainform' action="addUser.action"
			method='post' enctype="multipart/form-data">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th colspan="2" align="center"><font size="3px">修改用户基本信息</font>
					</th>
				</tr>
				<tr>
					<td width="200" align="right" style="padding-top:20px;">用户类型：</td>
					<td style="padding-top:20px;"><select id="typeID"
						name="typeID">
							<%
								for (Type t : lt) {
							%>
							<option value="<%=t.getTypeID()%>"><%=t.getTypeName()%></option>
							<%
								}
							%>
					</select></td>
				</tr>

				<tr>
					<td align="right">电子邮箱：</td>
					<td><input id="email" name="email" type="text" /></td>
				</tr>
				<tr>
					<td align="right">昵称：</td>
					<td><input id="nickName" name="nickName" type="text" /></td>
				</tr>


				<tr>
					<td align="right">真实姓名：</td>
					<td><input id="realName" name="realName" type="text" /></td>
				</tr>

				<tr>
					<td align="right">性别：</td>
					<td><select id="gender" name="gender">
							<option value="男">男</option>
							<option value="女">女</option>
					</select></td>
				</tr>
				<tr>
					<td align="right">身份证号：</td>
					<td><input id="cardID" name="cardID" type="text" /></td>
				</tr>
				<tr>
					<td align="right">银行卡号：</td>
					<td><input id="debitCard" name="debitCard" type="text" /></td>
				</tr>
				<tr>
					<td align="right">年龄：</td>
					<td><input id="age" type="text" name="age" /></td>
				</tr>
				<tr>
					<td align="right">联系电话：</td>
					<td><input name="tellphone" type="text" id="tellphone" /></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" class="btn big" value="添加用户"
						style="font-size:12px;height:24px;" />&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" class="btn big" value="重置"
						style="font-size:12px;height:24px;" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
