<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.mvc.bean.User"%>
<%
	User user;
	if (session.getAttribute("userInfo") == null) {
		response.sendRedirect("../cs/login.jsp");
		return;
	} else {

		user = (User) session.getAttribute("userInfo");
		if (user.getTypeID() != 4) {
			session.setAttribute("message", "您没有此权限！");
			response.sendRedirect("../cs/error.jsp");
			return;
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>作者</title>

</head>
<frameset cols="200,*,200" frameborder="no">
	<frame noresize="noresize">
	<frameset rows="150,*" frameborder="no">
		<frame name="top" noresize="noresize" src="top.jsp">
		<frameset cols="200,*">
			<frame name="left" src="link/authorinfo.jsp" noresize="noresize"
				frameborder="no">
			<frame name="main" src="link/alteruserinfo.jsp" noresize="noresize"
				frameborder="no">
		</frameset>

	</frameset>
	<frame noresize="noresize">
</frameset>
<noframes></noframes>

</html>
