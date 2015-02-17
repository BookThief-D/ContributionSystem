<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="com.mvc.bean.User"%>
<%
	User user;

	if (session.getAttribute("userInfo") == null) {
		response.sendRedirect("../login.jsp");
		return;

	} else {
		user = (User) session.getAttribute("userInfo");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<script type="text/javascript">
	function closeWin() {
		if (confirm("您确认要退出？")) {
			window.close();//这个地方浏览器的关闭ie6和ie7有点区别，这要是在ie7中会弹出一个确定关闭的窗口。
		} else {
			return false;
		}
	}
</script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body bgcolor="#aaaaaa">

	<center>
		&nbsp;&nbsp;&nbsp;&nbsp; <font style="font-family: '方正水柱简体' "
			size="小三"> 欢迎你,<%=user.getNickName()%>!</font>
	</center>
	<hr>
	<a href="link/alteruserinfo.jsp" target="main"><img alt="个人信息"
		src="images/userinfo.jpg" border="0"> </a>
	<a href="link/inputinfor.jsp" target="main"><img alt="投稿"
		src="images/contribute.jpg" border="0"> </a>
	<a href="link/alterinfo.jsp" target="main"><img alt="参看稿件"
		src="images/ctbmanage.jpg" border="0"> </a>
	<hr>
	<a href="../cs/logout.jsp" onclick="closeWin()" target="_top"> <img
		alt="退出" src="images/logout.jpg" border="0"> </a>
</body>
</html>
