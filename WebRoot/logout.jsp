<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<script type="text/javascript">
	function closeWin() {

		window.open("", "_self");
		top.opener = null;
		top.close();

	}
</script>
<title>My JSP 'logout.jsp' starting page</title>
<%
	session.setAttribute("email", null);
	session.setAttribute("nickName", null);
	session.setAttribute("userInfo", null);
	//request.getRequestDispatcher("homepage.jsp").forward(request,
	//		response);
%>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body onload="closeWin()">

</body>
</html>
