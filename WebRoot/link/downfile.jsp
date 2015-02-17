<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


</head>

<body>
	<%@ page contentType="text/html;charset=utf-8"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.net.*"%>
	<%
		//防止IE缓存   
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("Expires", 0);
		//设置编码   
		response.setCharacterEncoding("UTF-8");
		String fileName = new String(request.getParameter("filename")
				.getBytes("ISO-8859-1"), "UTF-8");

		String filepath = request.getParameter("filepath");
		System.out.println(filepath + fileName);
		//取到文件   
		File file = new File(filepath + fileName);
		response.reset();
		response.setContentType("application/octet-stream;charset=UTF-8");

		//	System.out.println(response.getCharacterEncoding());
		//一定要对fileName进行decode   
		response.addHeader("Content-Disposition", "attachment; filename="
				+ java.net.URLEncoder.encode(fileName, "UTF-8"));

		//response.setHeader("Content-Disposition", "attachment;filename="
		//	+ new String(fileName.getBytes("gb2312"), "ISO8859-1"));

		response.setContentLength((int) file.length());

		byte[] buffer = new byte[4096];
		BufferedOutputStream output = null;
		BufferedInputStream input = null;
		// 写缓冲区：   
		try {
			output = new BufferedOutputStream(response.getOutputStream());
			input = new BufferedInputStream(new FileInputStream(file));

			int n = (-1);
			while ((n = input.read(buffer, 0, 4096)) > -1) {
				output.write(buffer, 0, n);
			}
			response.flushBuffer();
		} catch (Exception e) {
		} // maybe user cancelled download   
		finally {
			if (input != null)
				input.close();
			if (output != null)
				output.close();
		}
	%>

</body>
</html>
