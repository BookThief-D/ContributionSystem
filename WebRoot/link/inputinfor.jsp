<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.mvc.bean.User"%>
<%@page import=" java.util.List"%>
<%@page import="com.mvc.bean.Category"%>
<%@page import="com.mvc.biz.ICTBCategoryBiz"%>
<%@page import="com.mvc.biz.ICTBCategoryBizImp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加稿件信息</title>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("userInfo") == null) {
		response.sendRedirect("../login.jsp");
		return;

	}
	User user = (User) session.getAttribute("userInfo");

	if (user.getTypeID() != 4) {
		session.setAttribute("message", "您没有此权限！");
		response.sendRedirect("../error.jsp");
		return;
	}
	ICTBCategoryBiz ictbb = new ICTBCategoryBizImp();
	List<Category> lc = ictbb.getAllCategoryByParentId(1);
%><meta name="description"
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
				title : {
					required : true
				},
				keywords : {
					required : true
				},
				file : {
					required : true,
					accept : "doc|pdf"

				},
			},
			messages : {
				title : {
					required : "请输入标题",
				},
				keywords : {
					required : "请输入关键字",
				},
				file : {
					required : "请选择文件",
					accept : "格式不正确，仅允许上传‘.pdf’、‘.doc’格式文件"

				}
			}
		});
	});
</script>
<link type="text/css" rel="stylesheet" href="../css/style.css">
</head>

<body class="margin_left">

	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="100%" height="27" background="images/tab_05.gif"
				style="padding-left:38px;">当前位置 >> 稿件管理 >> 稿件列表 >> 添加稿件</td>
		</tr>
		<tr>
			<td>
				<div class="table_box2">
					<form action="addFile.action" target=main id='mainform'
						name='mainform' onsubmit="javascript:window.close()" method="post"
						enctype="multipart/form-data">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th colspan="2"><font size="3px">添加稿件 
								</th>
							</tr>
							<tr>
								<td width="399" height="44" align="right">用户名:</td>
								<td width="551"><input type="hidden" name="userID"
									value="<%=user.getUserID()%>" /> <%=user.getNickName()%></td>
							</tr>
							<tr>
								<td width="399" height="44" align="right">标题:</td>
								<td width="551"><input type="text" size="20" name="title" />
									<font color="red">* </font></td>
							</tr>
							<tr>
								<td width="399" height="44" align="right">关键字:</td>
								<td width="551"><input type="text" size="20"
									name="keywords" /> <font color="red">* </font></td>
							</tr>
							<tr>
								<td height="43" align="right">稿件类型:</td>
								<td><select id="categoryID" name="categoryID">
										<%
											for (Category c : lc) {
										%>
										<option value="<%=c.getCategoryID()%>"><%=c.getCategoryName().toString()%></option>
										<%
											}
										%>
								</select><font color="red">* </font></td>
							</tr>
							<tr>
								<td height="46" align="right">文件路径：</td>
								<td><input type="file" name="file" id="file" title="上传文件" />
									<font color="red"> * </font></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit"
									class="btn" value="保存" style="height:24px;" id="save" />
									&nbsp;&nbsp;&nbsp;<input type="reset" class="btn" value="重置"
									style="font-size:12px;height:24px;" id="return" /></td>
							</tr>
						</table>
					</form>
				</div></td>
		</tr>
	</table>

</body>
</html>
