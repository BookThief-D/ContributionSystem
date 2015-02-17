<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Error</title>
<style type="text/css">
.box-error {
	width: 300px;
	height: 30px;
	padding-left: 32px;
	border-top: 1px solid #F8ACAC;
	border-bottom: 1px solid #F8ACAC;
	background: #FFD1D1 no-repeat 8px 50%;
	padding-left: 32px;
	height: 30px;
}

.box-error-msg {
	width: 300px;
	margin-top: -8px;
	background: #FFF1F1;
	border-top: 0 none;
	border-bottom: 1px solid #FDDCDC;
	color: #664B4B;
	padding: 12px;
}

.box-error-msg ol {
	margin-top: 0;
	margin-bottom: 0;
}
</style>
<meta http-equiv="pragma" content="no-cache">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<center>
		<div class="box box-error" align="left">提示</div>

		<div class="box box-error-msg">

			<li>${sessionScope.message}</li>

		</div>
	</center>

</body>
</html>
