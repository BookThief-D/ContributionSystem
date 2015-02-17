<%@page import="com.mvc.bean.User"%>
<%@page import="com.mvc.bean.Type"%>
<%@page import="com.mvc.biz.IUserBiz"%>
<%@page import="com.mvc.biz.IUserBizImp"%>
<%@page import="com.mvc.biz.IUserCategoryBiz"%>
<%@page import="com.mvc.biz.IUserCategoryBizImp"%>
<%@page import="com.utils.Base64Util"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	IUserBiz iub = new IUserBizImp();
	String email = request.getParameter("email");
	User user = iub.getByEmai(email);
	IUserCategoryBiz iucb = new IUserCategoryBizImp();
%>
<meta charset="utf-8" />
<link type="text/css" rel="stylesheet" href="../css/style.css">
	<title>用户信息</title>
</head>

<body class="margin_left">

	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td><div class="table_box2">

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th colspan="2" align="center"><font size="3px">用户信息查询








							
							</th>
						</tr>
						<tr>
							<td width="200" align="right" style="padding-top:20px;">用户编号：</td>
							<td style="padding-top:20px;"><%=user.getUserID()%></td>
						</tr>
						<tr>
							<td align="right">用户类别：</td>
							<td><%=iucb.getNameByID(user.getTypeID())%></td>
						</tr>
						<tr>
							<td align="right">电子邮箱：</td>
							<td><%=user.getEmail()%></td>
						</tr>
						<tr>
							<td align="right">昵称：</td>
							<td><%=user.getNickName()%></td>
						</tr>

						<tr>
							<td align="right">真实姓名：</td>
							<td><%=user.getRealName()%></td>
						</tr>

						<tr>
							<td align="right">身份证号：</td>
							<td><%=user.getCardID()%></td>
						</tr>
						<tr>
							<td align="right">银行卡号：</td>
							<td><%=user.getDebitCard()%></td>
						</tr>
						<tr>
							<td align="right">年龄：</td>
							<td><%=user.getAge()%></td>
						</tr>
						<tr>
							<td align="right">联系电话：</td>
							<td><%=user.getTellphone()%></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td><a href="resetPwd.action?userID=<%=user.getUserID()%>"
								class="btn big" style="font-size:12px;height:24px;">重置密码</a> <a
								href="deleteUser.action?userID=<%=user.getUserID()%>"
								class="btn big" style="font-size:12px;height:24px;">删除</a> <a
								href="userma.jsp" class="btn big"
								style="font-size:12px;height:24px;">返回</a>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
