<%@page contentType="text/html; charset=UTF-8"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>稿件管理</title>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("userInfo") == null) {
		response.sendRedirect("../cs/login.jsp");
		return;

	}
	User user = (User) session.getAttribute("userInfo");

	if (user.getTypeID() != 4) {
		session.setAttribute("message", "您没有此权限！");
		response.sendRedirect("../cs/error.jsp");
		return;
	}
	IContributionBiz ictbb = new IContributionBizImp();
	List<Contribution> lc = ictbb.getAllCTB();
	IUserBiz iub = new IUserBizImp();
%>
<link type="text/css" rel="stylesheet" href="../css/style.css">
</head>

<body class="margin_left">

	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="100%" height="27" background="images/tab_05.gif"
				style="padding-left:38px;">当前位置 >> 稿件管理</td>
		</tr>
		<tr>
			<td>
				<div class="table_box2">

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th colspan="4"><font size="3px">稿件管理 
							</th>
						</tr>
						<tr>
							<td colspan="2"><div class="table">
									<table width="100%" border="1" align="center" cellpadding="0"
										cellspacing="1">
										<tr>
											<th align="center" width="80">稿件编号</th>
											<th align="center" width="270">稿件标题</th>
											<th align="center" width="100">作者</th>
											<th align="center" width="80">稿件类别</th>
											<th align="center" width="150">关键字</th>
											<th align="center" colspan="3">操作</th>
										</tr>
										<tr>
											<%
												for (Contribution ctb : lc) {
													if (user.getUserID() == ctb.getUserID()) {
														User u = iub.getByID(ctb.getUserID());
														ICTBCategoryBiz iccb = new ICTBCategoryBizImp();
											%>
											<tr>

												<td height="24" align="center"><%=ctb.getCtbID()%></td>
												<td align="center"><%=ctb.getTitle()%></td>
												<td align="center"><%=u.getRealName()%></td>
												<td align="center"><%=iccb.getCategoryByID(ctb.getCategoryID())%></td>
												<td align="center"><%=ctb.getKeywords()%></td>
												<td align="center" width="130"><img src="images/a1.gif"
													width="12" height="12" /> <a
													href="contributioninfo.jsp?ctbID=<%=ctb.getCtbID()%>">
														稿件信息</a></td>
												<td align="center" width="130"><a
													href="ctbmodify.jsp?ctbID=<%=ctb.getCtbID()%>">修改稿件</a></td>
												<td align="center" width="130"><img
													src="images/del.gif" width="16" height="16" /> <a
													href="deleteCtb.action?ctbID=<%=ctb.getCtbID()%>">删除稿件</a>
												</td>

											</tr>
											<%
												} else
														continue;
												}
											%>


										</tr>
									</table>
								</div>
							</td>
						</tr>

					</table>
				</div>
			</td>
		</tr>
	</table>

</body>
</html>
