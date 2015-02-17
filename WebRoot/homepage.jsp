<%@page import="java.util.*"%><%@page import="com.mvc.bean.User"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.bean.Category"%>
<%@page import="com.mvc.bean.Contribution"%>
<%@page import="com.mvc.biz.IUserBiz"%>
<%@page import="com.mvc.biz.IContributionBiz"%>
<%@page import="com.mvc.biz.ICTBCategoryBiz"%>
<%@page import="com.mvc.biz.ICTBCategoryBizImp"%>
<%@page import="com.mvc.biz.IUserBizImp"%>
<%@page import="com.mvc.biz.IContributionBizImp"%>
<%
	String name ;
	User user;
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
java.util.Date currentTime = new java.util.Date();//得到当前系统时间 

String str_date1 = formatter.format(currentTime); //将日期时间格式化 
String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式

	if (session.getAttribute("userInfo") == null) {
		
	name = "游客";
	}else{
	 user= (User) session.getAttribute("userInfo");
	name = user.getNickName();
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>homepage.html</title>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
<script language="javascript" src="images/OPENWIN.JS"></script>
<script language="javascript">
	function Maximize() {
		self.moveTo(0, 0);
		self.resizeTo(screen.availWidth, screen.availHeight);
	}

	function clearall() {
		var the_box = window.document.all('pid');
		for ( var i = 0; i < the_box.length; i++) {
			the_box[i].checked = false;
		}
	}

	function isready1(form) {
		var blnAlert = 0;
		var str_article = "";
		if (typeof (AbstractList.pid.length) == "undefined") {
			if (AbstractList.pid.checked == true) {
				blnAlert = blnAlert + 1;
				str_article = str_article + AbstractList.pid.value + ",";
			}
		} else {
			for (i = 0; i < AbstractList.pid.length; i++) {
				if (AbstractList.item("pid", i).checked == true) {
					blnAlert = blnAlert + 1;
					str_article = str_article
							+ AbstractList.item("pid", i).value + ",";
				}
			}
		}
		if (blnAlert == 0) {
			alert("请您先选中文章！");
			return false;
		}
		//alert(str_article);
		form.action = "../article/uniteZhaiYao.do?uniteId=" + str_article;
		form.submit;
	}

	function set_abs() {
		abst.style.display = "block";
	}

	function showArticleFile(attachType, articleId) {
		var viewAttach = "";
		viewAttach = "../article/showArticleFile.do?attachType=" + attachType
				+ "&id=" + articleId;
		window
				.open(
						viewAttach,
						"下载文件",
						"toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizeable=no,copyhistory=no,width=520,height=200,left=88,top=88");
		//var viewAttach = "";
		//viewAttach = "../article/downloadArticleFile.do?attachType="+attachType+"&id="+articleId;
		//window.open(viewAttach,"下载文件","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizeable=no,copyhistory=no,width=520,height=200,left=88,top=88");
	}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="824" border="0" cellpadding="0" cellspacing="0"
		align="center" class="td_zy">
		<!--头部-->
		<tbody>
			<tr>
				<td>


					<title>Computer Engineering</title>

					<link href="images/css.css" type="text/css" rel="stylesheet">
					<meta content="MSHTML 6.00.2900.3157" name="GENERATOR">
					<style type="text/css">
<!--
body {
	background-image: url();
}
-->
</style>


					<table border="0" cellspacing="0" cellpadding="0" width="1004">
						<tbody>

							<tr>
								<td height="178" background="images/banner1.gif">
									<table border="0" cellspacing="0" cellpadding="0" width="100%">
										<tbody>
											<tr>
												<td height="144" align="right"><object
														codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
														classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
														width="890" align="middle" height="145">
														<param name="movie" value="images/10.swf">
														<param name="quality" value="High">
														<param name="wmode" value="transparent">
														<embed src="images/10.swf" width="900" height="150"
															hspace="0" vspace="0" align="middle" quality="High"
															wmode="transparent" type="application/x-shockwave-flash"
															pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=Shockw
				  aveFlash">
													</object></td>
											</tr>
											<tr>
												<td height="8" align="right"></td>
											</tr>
											<tr>
												<td height="20" align="right">
													<table border="0" cellspacing="0" cellpadding="0"
														width="100%">
														<tbody>
															<tr>
																<td width="200" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=name%>
																	<a href="out.jsp"> 退出</a>
																</td>
																<td valign="center" align="left" width="769">&nbsp;&nbsp;&nbsp;&nbsp;

																	<a target="_top" href="#"><font color="black">首
																			页</font> </a>&nbsp; <font color="black">|</font>&nbsp; <a
																	target="_blank" href="login.jsp"> <font
																		color="black">用户登录</font> </a> &nbsp; <font color="black">|</font>&nbsp;&nbsp;
																	<a target="_blank" href="register.jsp"><font
																		color="black">用户注册</font> </a> &nbsp;&nbsp; <font
																	color="black">|</font>&nbsp;&nbsp; <a target="_blank"
																	href="link/inputinfor.jsp"><font color="black">添加稿件</font>
																</a> &nbsp;&nbsp; <font color="black">|</font>&nbsp;&nbsp; <a
																	target="_blank" href="alterinfor.jsp"><font
																		color="black">稿件信息</font> </a> &nbsp;&nbsp; <font
																	color="black">|</font>&nbsp;&nbsp; <font color="black">联系我们</font>&nbsp;&nbsp;
																	<font color="black">|</font>&nbsp;&nbsp; &nbsp;&nbsp;
																	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="black"
																	style="font-size:9pt;font-family: 宋体"> <%=str_date1%></font>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td height="1" align="right"></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
							<tr>
								<td height="8"></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0" align="center">
						<tbody>
							<tr>
								<!--左侧-->
								<td width="210" valign="top" align="center"
									background="images/j_2.jpg">
									<title></title>

									<link href="images/css.css" type="text/css" rel="stylesheet">
									<meta content="MSHTML 6.00.2900.3157" name="GENERATOR">

									<style type="text/css">
<!--
.lm {
	color: #000000;
	font-weight: bold;
}
-->
</style>

									<table width="210" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td align="center">
													<table width="200" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td width="200"><img src="images/cell_top_left.jpg"
																	width="200" height="12"></td>
															</tr>
															<tr>
																<td height="187" valign="top"
																	background="images/cell_middle_left.jpg" class="style4"><table
																		width="186" border="0" align="center" cellpadding="0"
																		cellspacing="0">
																		<tbody>
																			<tr>
																				<td width="40" height="30" valign="top"><div
																						align="center">
																						<strong><img src="images/zxqk.jpg"
																							width="40" height="24"> </strong>
																					</div></td>
																				<td width="146" height="30" valign="top"><span
																					class="lm">在线办公</span></td>
																			</tr>
																			<tr>
																				<td height="1" valign="top"></td>
																				<td height="1" valign="top" bgcolor="#efefef"></td>
																			</tr>
																			<tr>
																				<td height="30" valign="top"><div
																						align="center">
																						<strong><span
																							style="mso-ascii-font-family: &#39;Times New Roman&#39;"><span
																								style="mso-fareast-font-family: 华文中宋"
																								lang="EN-US">. </span> </span> </strong>
																					</div></td>
																				<td height="30" valign="middle"><span
																					class="txt_lm"><a href="link/inputinfor.jsp"
																						target="_blank" class="txt_lm">在线投稿</a> </span></td>
																			</tr>
																			<tr>
																				<td height="30" valign="top"><div
																						align="center">
																						<strong><span
																							style="mso-ascii-font-family: &#39;Times New Roman&#39;"><span
																								style="mso-fareast-font-family: 华文中宋"
																								lang="EN-US">. </span> </span> </strong>
																					</div></td>
																				<td height="30" valign="middle"><span
																					class="txt_lm"><a href="expert.jsp"
																						target="_blank" class="txt_lm">在线查稿</a> </span></td>
																			</tr>
																			<tr>
																				<td height="30" valign="top"><div
																						align="center">
																						<strong><span
																							style="mso-ascii-font-family: &#39;Times New Roman&#39;"><span
																								style="mso-fareast-font-family: 华文中宋"
																								lang="EN-US">. </span> </span> </strong>
																					</div></td>
																				<td height="30" valign="middle"><span
																					class="txt_lm"
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;"><a
																						href="manager.jsp" target="_blank" class="txt_lm">管理员入口</a>
																				</span></td>
																			</tr>
																			<tr>
																				<td height="30" valign="top"><div
																						align="center">
																						<strong><span
																							style="mso-ascii-font-family: &#39;Times New Roman&#39;"><span
																								style="mso-fareast-font-family: 华文中宋"
																								lang="EN-US">. </span> </span> </strong>
																					</div></td>
																				<td height="30" valign="middle"><span
																					class="txt_lm"
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;"><a
																						href="editor.jsp" target="_blank" class="txt_lm">编辑办公</a>
																				</span></td>
																			</tr>
																		</tbody>
																	</table></td>
															</tr>
															<tr>
																<td height="12"><img
																	src="images/cell_bottom_left.jpg" width="200"
																	height="12"></td>
															</tr>
														</tbody>
													</table>
													<table width="200" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td height="10"></td>
															</tr>
														</tbody>
													</table>
													<table width="200" border="0" cellspacing="0"
														cellpadding="0">

													</table>
													<table width="200" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td height="10"></td>
															</tr>
														</tbody>
													</table>
													<table width="200" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td><img src="images/cell_top_left.jpg" width="200"
																	height="12"></td>
															</tr>
															<tr>
																<td height="264" valign="top"
																	background="images/cell_middle_left.jpg" class="style4">
																	<table width="186" border="0" align="center"
																		cellpadding="0" cellspacing="0">
																		<tbody>
																			<tr>
																				<td width="39" height="26" valign="middle"><div
																						align="center">
																						<strong><img src="images/tou.jpg"
																							width="14" height="11"><br> </strong>
																					</div></td>
																				<td width="147" valign="top"><strong class="lm">友情链接</strong>
																				</td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2">&nbsp;&nbsp;· <a
																					href="http://www.ccf.org.cn/sites/ccf/"
																					target="_blank">中国计算机学会</a>
																				</td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2">&nbsp;&nbsp;· <a
																					href="http://c79.cnki.net/oldcnki/index4.htm"
																					target="_blank">CNKI 数据库中国学术期刊网</a>
																				</td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a href="http://www.wanfangdata.com.cn/"
																						target="_blank">万方数据-数字化期刊群</a> </span>
																				</td>
																			</tr>

																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a href="http://sdb.csdl.ac.cn/" target="_blank">中国科学引文数据库</a>
																				</span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a href="http://www.nseac.com/" target="_blank">中国科教评价网</a>
																				</span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a href="http://www.ecict.com.cn/" target="_blank">华东计算技术研究所</a>
																				</span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a href="http://www.shecc.com/" target="_blank">上海华东电脑股份有限公司</a>
																				</span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a href="http://www.eccom.com.cn/CN"
																						target="_blank">华讯网络系统有限公司</a> </span><span
																					style="mso-fareast-font-family: 华文中宋" lang="EN-US"><o:p></o:p>
																						<o:p></o:p> </span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a href="http://www.cs2c.com.cn/" target="_blank">上海中标软件有限公司</a>
																				</span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;; mso-bidi-font-weight: bold">&nbsp;&nbsp;·
																						<a href="http://isiknowledge.com/inspec"
																						target="_blank">英国《科学文摘》</a> </span></td>
																			</tr>

																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;">&nbsp;&nbsp;·
																						<a
																						href="http://www.ecice06.com/publishers.indexcopernicus.com/index.php"
																						target="_blank">波兰《哥白尼索引》</a> </span><span
																					style="mso-fareast-font-family: 华文中宋" lang="EN-US"><o:p></o:p>
																						<o:p></o:p> </span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;; mso-bidi-font-weight: bold">&nbsp;&nbsp;·
																						<a href="http://www.csa.com/" target="_blank">美国《剑桥科学文摘》</a>
																				</span></td>
																			</tr>
																			<tr valign="middle">
																				<td height="30" colspan="2"><span
																					style="mso-ascii-font-family: &#39;Times New Roman&#39;; mso-bidi-font-weight: bold">&nbsp;&nbsp;·
																						<a href="http://www.ulrichsweb.com.cn/ulrichsweb"
																						target="_blank">美国《乌利希期刊指南》</a> </span></td>
																			</tr>
																		</tbody>
																	</table></td>
															</tr>
															<tr>
																<td height="12"><img
																	src="images/cell_bottom_left.jpg" width="200"
																	height="12"></td>
															</tr>
														</tbody>
													</table> <br>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<!--中间-->
								<td valign="top" align="left">
									<table width="100%" height="493" border="0" align="right"
										cellpadding="0" cellspacing="0">
										<tbody>
											<tr valign="top">
												<td align="middle" bgcolor="#ffffff"><table width="96%"
														border="0" cellpadding="0" cellspacing="0"
														bgcolor="#f1f1f1" class="td41">
														<tbody>
															<tr valign="center">
																<td width="54" align="right" valign="middle"><img
																	src="images/z_js.gif" width="34" height="28"></td>
																<td width="87" height="25" align="right" valign="middle">文章快速检索</td>
																<td width="9" class="style7">&nbsp;</td>
																<form name="frm_ks" method="post"
																	action="http://www.ecice06.com/CN/article/searchArticle.do"></form>
																<td width="195" height="25" align="center"><input
																	maxlength="30" size="25" name="ks_keyword"></td>
																<td width="8">&nbsp;</td>
																<td width="54"><input type="submit" value=" GO "
																	name="Submit22"></td>

																<td width="164" height="25" align="left"><a
																	href="http://www.ecice06.com/CN/article/advSearchArticle.do">高级检索</a>
																</td>
															</tr>
														</tbody>
													</table>
													<table width="100%" border="0" align="center"
														cellpadding="0" cellspacing="0">



														<tbody>
															<tr>
																<td align="center">

																	<table width="100%" border="0" cellspacing="0"
																		cellpadding="0">
																		<tbody>
																			<tr>
																				<td width="100%" height="15"></td>
																			</tr>
																			<tr>
																				<td><table border="0" cellspacing="0"
																						cellpadding="0" width="96%" align="center">
																						<tbody>
																							<tr>
																								<td height="100%" align="middle" valign="top"
																									class="td400"><table class="tdz"
																										border="0" cellspacing="0" cellpadding="0"
																										width="100%">
																										<tbody>
																											<tr>
																												<td height="27" background="images/z_t.jpg"><table
																														border="0" cellspacing="0" cellpadding="0"
																														width="99%">
																														<tbody>
																															<tr>
																																<td width="4" height="29" align="middle">&nbsp;</td>
																																<td width="185"><strong>&nbsp;&nbsp;</strong>
																																</td>
																																<td style="PADDING-RIGHT: 15px"
																																	width="362" align="right"><div
																																		align="left"></div></td>
																															</tr>
																														</tbody>
																													</table></td>
																											</tr>
																											<tr>
																												<td height="600" align="center" valign="top"><table
																														width="100%" height="175" border="0"
																														align="center" cellpadding="0"
																														cellspacing="0">
																														<tbody>
																															<tr>
																																<td height="1"></td>
																															</tr>



																															<tr>
																																<td colspan="3" height="30"></td>
																															</tr>

																															<tr>
																																<td colspan="3" height="10"></td>
																															</tr>
																															<tr>
																																<td width="5%" height="28"></td>
																																<td width="90%" align="left"
																																	valign="top" class="J_WenZhang"><%@ page
																																		language="java" import="java.util.*"
																																		pageEncoding="UTF-8"%>
																																	<%@page import=" java.util.List"%>
																																	<%@page import="java.io.File;"%>
																																	<%@taglib uri="/struts-tags" prefix="s"%>
																																	<%
																																		request.setCharacterEncoding("UTF-8");
																																		IContributionBiz ictbb = new IContributionBizImp();
																																		List<Contribution> lc = ictbb.getAllCTB();
																																		IUserBiz iub = new IUserBizImp();
																																	%> <%
 	for (Contribution ctb : lc) {
 		if (ctb.getIsJudge() != null) {
 			if (ctb.getIsJudge().equals("t")) {
 %> <a target="_blank"
																																	href="contributioninfo.jsp?ctbID=<%=ctb.getCtbID()%>">
																																		<%=ctb.getTitle()%></a>
																																	<hr> <%
 	}
 		}
 	}
 %>
																																</td>
																																<td width="5%"></td>
																															</tr>
																															<tr>
																																<td colspan="3" height="20"></td>
																															</tr>
																															<tr>
																																<td width="5%" height="28"></td>
																																<td width="90%" align="left"
																																	valign="top" class="J_WenZhang"><span
																																	class="J_WenZhang">( <%=str_date1%>
																																		)</span></td>
																																<td width="5%"></td>
																															</tr>
																														</tbody>
																													</table></td>
																											</tr>
																										</tbody>
																									</table></td>
																							</tr>
																						</tbody>
																					</table>
																				</td>
																			</tr>
																		</tbody>
																	</table></td>
															</tr>
														</tbody>
													</table>
												</td>

											</tr>
										</tbody>
									</table>
								</td>
								<td width="210" valign="top" align="center">


									<title></title>

									<link href="images/css.css" type="text/css" rel="stylesheet">
									<meta content="MSHTML 6.00.2900.3157" name="GENERATOR">

									<style type="text/css">
<!--
.txt11 {
	color: #000000;
	font-weight: bold;
}

.txt22 {
	color: #000000
}
-->
</style>


									<table width="243" height="487" border="0" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr>
												<td width="243" height="461" align="right" valign="top"><table
														border="0" cellspacing="0" cellpadding="0" width="100%">
														<tbody>
															<tr>
																<td align="right"><table width="240" border="0"
																		cellspacing="0" cellpadding="0">
																		<tbody>
																			<tr>
																				<td width="240"><img
																					src="images/cell_top_right.jpg" width="240"
																					height="12"></td>
																			</tr>
																			<tr>
																				<td height="264" valign="top"
																					background="images/cell_middle_right.jpg"
																					class="style4">
																					<table width="98%" border="0" align="center"
																						cellpadding="0" cellspacing="0">
																						<tbody>
																							<tr>
																								<td height="30" valign="middle"><div
																										align="center">
																										<img src="images/cover.jpg">
																									</div></td>
																							</tr>

																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22">&nbsp;&nbsp;主管：天津大学仁爱学院</span></td>
																							</tr>
																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22"
																									style="mso-fareast-font-family: 华文中宋"
																									lang="EN-US"> <o:p></o:p> </span><span
																									class="txt22">&nbsp;&nbsp;主办：天津大学仁爱学院</span></td>
																							</tr>
																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22">&nbsp;&nbsp; 09级计算机系</span></td>
																							</tr>
																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22">&nbsp;&nbsp;主编：JH</span></td>
																							</tr>

																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22">&nbsp;&nbsp;电话：021-1234567</span>
																								</td>
																							</tr>
																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22">&nbsp;&nbsp;传真：021-1234567
																										<o:p></o:p> </span></td>
																							</tr>

																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22">&nbsp;&nbsp;国内刊号：CN
																										31-1289/TP</span></td>
																							</tr>

																							<tr>
																								<td height="30" valign="middle"><span
																									class="txt22">&nbsp;&nbsp;国际刊号：ISSN
																										1000-3428</span></td>
																							</tr>
																						</tbody>
																					</table></td>
																			</tr>
																			<tr>
																				<td height="12"><img
																					src="images/cell_bottom_right.jpg" height="12">
																				</td>
																			</tr>
																		</tbody>
																	</table></td>
																<td width="4">&nbsp;</td>
															</tr>
														</tbody>
													</table>
													<table width="208" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td height="10"></td>
															</tr>
														</tbody>
													</table></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<!--底部-->
			<tr>
				<td valign="top">


					<title>Computer Engineering</title>

					<link href="images/css.css" type="text/css" rel="stylesheet">
					<meta content="MSHTML 6.00.2900.3157" name="GENERATOR">
					<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>


					<table border="0" cellspacing="0" cellpadding="0" width="100%"
						align="center">
						<tbody>
							<tr>
								<td height="3"></td>
							</tr>
							<tr>
								<td height="18" background="./计算机工程_files/bg.gif"></td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellspacing="0" cellpadding="0" width="100%"
						align="center" height="70">
						<tbody>
							<tr>
								<td style="COLOR: #404040; FONT-SIZE: 12px" height="70"
									valign="center" background="images/d_bg.jpg" align="middle">
									<div align="center">
										2012 © 计算机技术杂志编辑部 &nbsp;&nbsp;&nbsp;[<a
											href="#">津ICP备88888888号</a>]<br>
										地址：天津市静海县 400号(301636)&nbsp;&nbsp; Tel: 021-1234567
										传真：021-1234567 E-mail：hdsce@sohu265359.sohuvip.net<br> <a
											href="http://www.magtech.com.cn/">本系统由天津仁爱学院设计开发</a>
									</div></td>
							</tr>
						</tbody>
					</table>
					<style type="text/css">
.a {
	font-size: 12px;
	font-weight: bold;
	position: absolute;
	left: 33px;
	top: 32px;
	width: 140px;
	height: 130px;
	z-index: 1;
	visibility: hidden;
}
</style>
					<div id="layer1" class="a">
						<strong><a href="http://www.weideyazhou.org/"
							title="伟德亚洲">伟德亚洲</a> </strong> <strong><a
							href="http://www.sun990.com/" title="太阳城">太阳城</a> </strong> <strong><a
							href="http://www.442zq.com/bocai.htm" title="博彩通">博彩通</a> </strong> <a
							href="http://www.kopfhorervononline.org/" title="Kopfhörer Beats"><strong>Kopfhörer
								Beats</strong> </a>
					</div>
				</td>
			</tr>

		</tbody>
	</table>



</body>
</html>
