<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import=" java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.mvc.bean.Contribution"%>
<%@page import="com.mvc.bean.User"%>
<%@page import="com.mvc.biz.IContributionBiz"%>
<%@page import="com.mvc.biz.IContributionBizImp"%>
<%@page import="com.mvc.biz.IUserBiz"%>
<%@page import="com.mvc.biz.IUserBizImp"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	request.setCharacterEncoding("UTF-8");
	IContributionBiz icb = new IContributionBizImp();
	IUserBiz iub = new IUserBizImp();
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<File> fileList = new ArrayList();
	File file = new File("D://Tools/Tomcat 6.0/webapps/cs/file");
	File[] files = file.listFiles();
	if (files == null) {
		return;
	} else {
		for (int i = 0; i < files.length; i++) {
			// 判断是否是文件夹  

			fileList.add(files[i]);// 添加到文件集合中  
		}

	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'download.jsp' starting page</title>


</head>

<body>
	<table>
		<%
			request.setCharacterEncoding("UTF-8");
			for (File f : fileList) {
		%>
		<tr>
			<td><a
				href="link/downfile.jsp?filepath=D://Tools/Tomcat 6.0/webapps/cs/file/&filename=<%=f.getName()%>">
					<%=f.getName()%></a>
			</td>
			<td></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
