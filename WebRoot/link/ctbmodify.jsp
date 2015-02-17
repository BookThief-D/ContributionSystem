<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mvc.bean.User"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.bean.Category"%>
<%@page import="com.mvc.bean.Contribution"%>
<%@page import="com.mvc.biz.IUserBiz"%>
<%@page import="com.mvc.biz.IContributionBiz"%>
<%@page import="com.mvc.biz.ICTBCategoryBiz"%>
<%@page import="com.mvc.biz.ICTBCategoryBizImp"%>
<%@page import="com.mvc.biz.IUserBizImp"%>
<%@page import="com.mvc.biz.IContributionBizImp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%
	request.setCharacterEncoding("UTF-8");
	String ctbID = request.getParameter("ctbID");

	ICTBCategoryBiz iccb = new ICTBCategoryBizImp();
	List<Category> lc = iccb.getAllCategoryByParentId(1);
	IContributionBiz ictbb = new IContributionBizImp();
	Contribution ctb = ictbb.getByID(Integer.parseInt(ctbID));
	IUserBiz iub = new IUserBizImp();
	User u = iub.getByID(ctb.getUserID());String judge;
	if (ctb.getIsJudge() != null) {
		judge = ctb.getIsJudge().equals("t") ? "是" : "否";
	} else {
		judge = "否";
	}
	String ctbName = ctb.getTitle().substring(0,ctb.getTitle().length()-4);
%>
<title>稿件信息</title>
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

<link rel="stylesheet" href="../css/custom.css" type="text/css" />

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
</head>

<body class="margin_left">

	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="100%" height="27" background="images/tab_05.gif"
				style="padding-left:38px;">当前位置 >>稿件信息</td>
		</tr>
		<tr>
			<td>
				<div class="table_box2">
					<form action="modifyCTB.action" target=main id='mainform'
						name='mainform' onsubmit="javascript:window.close()" method="post"
						enctype="multipart/form-data">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th colspan="4"><font size="3px">稿件信息 </font></th>
							</tr>
							<tr>
								<td colspan="2"><div class="table">

										<table width="100%" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<th colspan="2" align="center" width="400">稿件信息</th>
												<th colspan="2" align="center" width="400">作者信息</th>
											</tr>
											<tr>
												<td align="right">稿件编号:</td>
												<td align="left"><input id="ctbID" name="ctbID"
													type="hidden" value="<%=ctb.getCtbID()%>" /><%=ctb.getCtbID()%>
												</td>

												<td align="right">作者昵称:</td>
												<td align="left"><input type="hidden"
													value="<%=u.getUserID()%>" id="userID" name="userID">
													<%=u.getNickName()%></td>
											</tr>

											<tr>
												<td align="right">标题:</td>
												<td align="left"><input id="title" name="title"
													type="text" value="<%=ctbName%>" /><font color="red">*
												</font><a
													href="downfile.jsp?filepath=<%=ctb.getContainer()%>/&filename=<%=ctb.getTitle()%>"><%=ctb.getTitle()%>
												</a>(原件)</td>

												<td align="right">真实姓名:</td>
												<td align="left"><%=u.getRealName()%></td>

											</tr>

											<tr>
												<td align="right">文件路径:</td>
												<td align="left"><input type="file" name="file"
													id="file" title="上传文件" /><font color="red">* </font>
												</td>

												<td align="right">性别:</td>
												<td align="left"><%=u.getGender()%></td>
											</tr>

											<tr>
												<td align="right">关键字:</td>
												<td align="left"><input id="keywords" name="keywords"
													type="text" value="<%=ctb.getKeywords()%>" /><font
													color="red">* </font>
												</td>

												<td align="right">Email:</td>
												<td align="left"><%=u.getEmail()%></td>
											</tr>

											<tr>
												<td align="right">稿件类别:</td>
												<td align="left"><select id="categoryID"
													name="categoryID">
														<%
															for (Category c : lc) {
																if (c.getCategoryID().equals(ctb.getCategoryID())) {
														%>
														<option value="<%=c.getCategoryID()%>" selected='selected'><%=c.getCategoryName().toString()%></option>
														<%
															} else {
														%>
														<option value="<%=c.getCategoryID()%>"><%=c.getCategoryName().toString()%></option>

														<%
															}
															}
														%>
												</select><font color="red">* </font></td>

												<td align="right">联系方式:</td>
												<td align="left"><%=u.getTellphone()%></td>
											</tr>

											<tr>
												<td align="right">是否通过审核：</td>
												<td align="left"><%=judge%></td>

												<td align="right"></td>
												<td align="left"></td>
											</tr>

										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit"
									class="btn big" value="确认修改"
									style="font-size:12px;height:24px;" id="save" /> <a
									class="btn big" href="alterinfo.jsp" target="main"
									style="font-size:12px;height:24px;">返回</a>
								</td>

							</tr>
						</table>
					</form>
				</div>
			</td>
		</tr>
	</table>

</body>
</html>
