<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import=" java.util.List"%>
<%@page import="com.mvc.bean.User"%>
<%@page import="com.mvc.bean.Type"%>
<%@page import="com.mvc.biz.IUserBiz"%>
<%@page import="com.mvc.biz.IUserBizImp"%>
<%@page import="com.mvc.biz.IUserCategoryBiz"%>
<%@page import="com.mvc.biz.IUserCategoryBizImp"%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	IUserBiz iubiz = new IUserBizImp();
	List<User> luser = iubiz.getAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户管理</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
</head>

<body class="margin_left">



	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">

		<tr>
			<td>
				<div class="table_box2">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">


						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="table_box">
									<tr>
										<td colspan="2"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr>



												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="2"><div class="table">
												<form action="">
													<table width="100%" border="1" align="center"
														cellpadding="0" cellspacing="1">

														<tr>

															<th width="50">序号</th>
															<th width="50">用户编号</th>
															<th width="85">用户类别</th>

															<th width="100">用户姓名</th>
															<th width="195">联系电话</th>
															<th colspan="3" align="center">操作</th>
														</tr>
														<%
															int i = 1;
															for (User u : luser) {
																IUserCategoryBiz iucb = new IUserCategoryBizImp();
														%>
														<tr>

															<td height="24" align="center"><%=i++%></td>
															<td align="center"><span class="STYLE1"><%=u.getUserID()%></span>
															</td>
															<td align="center"><%=iucb.getNameByID(u.getTypeID())%></td>
															<td align="center"><%=u.getRealName()%></td>
															<td align="center"><%=u.getTellphone()%></td>
															<td align="center" width="100"><img
																src="images/a1.gif" width="12" height="12" /> <a
																href="authorinfo.jsp?email=<%=u.getEmail()%>"> 查看</a>
															</td>
															<td align="center" width="97"><img
																src="images/del.gif" width="16" height="16" /> <a
																href="deleteUser.action?userID=<%=u.getUserID()%>">删除</a>
															</td>
															<td align="center" width="97"><a
																href="resetPwd.action?userID=<%=u.getUserID()%>">重置密码</a>
															</td>
														</tr>
														<%
															}
														%>
														<!-- 	<c:forEach items="${luser}" var="uvar" varStatus="i">
											<tr>
												<td align="center"><input name="checkbox"
													type="checkbox" value="1" /></td>
												<td height="24" align="center">${i.index + 1}</td>
												<td align="center"><span class="STYLE1">${uvar.userID}</span>
												</td>
												<td align="center">${uvar.realName}</td>
												<td align="center">${uvar.tellphone}</td>
												<td align="center" width="100"><img src="images/a1.gif"
													width="12" height="12" /> 查看</td>
												<td align="center" width="97"><img src="images/del.gif"
													width="16" height="16" /> 删除</td>
											</tr>
										</c:forEach> -->
													</table>
												</form>
											</div>
										</td>
									</tr>

								</table></td>
						</tr>
					</table>
				</div></td>
		</tr>
	</table>
</body>
</html>
