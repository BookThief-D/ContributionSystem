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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%
	request.setCharacterEncoding("UTF-8");
	String ctbID = request.getParameter("ctbID");

	ICTBCategoryBiz iccb = new ICTBCategoryBizImp();
	IContributionBiz ictbb = new IContributionBizImp();
	Contribution ctb = ictbb.getByID(Integer.parseInt(ctbID));
	IUserBiz iub = new IUserBizImp();
	User u = iub.getByID(ctb.getUserID());
	String judge;
	if (ctb.getIsJudge() != null) {
		judge = ctb.getIsJudge().equals("t") ? "是" : "否";
	} else {
		judge = "否";
	}
%>
<title>稿件信息</title>
<script type="text/javascript">
	function closeWin() {
		window.close();//这个地方浏览器的关闭ie6和ie7有点区别，这要是在ie7中会弹出一个确定关闭的窗口。
	}
</script>
<link type="text/css" rel="stylesheet" href="../css/style.css">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th colspan="4"><font size="3px">稿件信息 
							</th>
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
											<td align="left"><%=ctb.getCtbID()%></td>

											<td align="right">作者昵称:</td>
											<td align="left"><%=u.getNickName()%></td>
										</tr>

										<tr>
											<td align="right">标题:</td>
											<td align="left"><a
												href="link/downfile.jsp?filepath=<%=ctb.getContainer()%>/&filename=<%=ctb.getTitle()%>"><%=ctb.getTitle()%></a>
											</td>

											<td align="right">真实姓名:</td>
											<td align="left"><%=u.getRealName()%></td>

										</tr>

										<tr>
											<td align="right">关键字:</td>
											<td align="left"><%=ctb.getKeywords()%></td>

											<td align="right">性别：</td>
											<td align="left"><%=u.getGender()%></td>
										</tr>

										<tr>
											<td align="right">稿件类别:</td>
											<td align="left"><%=iccb.getCategoryByID(ctb.getCategoryID())%></td>

											<td align="right">Email:</td>
											<td align="left"><%=u.getEmail()%></td>
										</tr>

										<tr>
											<td align="right">最后修改时间:</td>
											<td align="left"><%=ctb.getUpLoadTime()%></td>

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
							<td align="center" colspan="2"><input class="btn big"
								onclick="closeWin()" style="font-size:12px;height:24px;"
								type="button" value="返回" /></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>

</body>
</html>
