<%@page contentType="text/html; charset=UTF-8"%>
<style type="text/css">
<!--
body {
	margin: 0px;
	font-size: 15px;
	background-color: #f1f1f1;
}

.STYLE1 {
	color: #000;
	font-size: 14px;
	font-weight: bold;
}

.STYLE1 a {
	color: #000;
}

.STYLE3 {
	color: #225b6e;
	font-size: 13px;
}

a {
	text-decoration: none;
}

a:hover {
	color: #FF0000;
}

.menu_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #ffffff;
	POSITION: relative;
	TOP: 2px
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #FFCC00;
	POSITION: relative;
	TOP: 2px
}
-->
</style>
<script>
	var he = document.body.clientHeight - 105
	document.write("<div id=tt style=height:"+he+";overflow:hidden>")
</script>

${sessionScope.nickName }，您好！
<br />
${sessionScope.email }

<table width="172" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td valign="top">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td><table width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td height="32" background="images/main_47.gif" id="imgmenu0"
									class="menu_title" onMouseOver="this.className='menu_title2';"
									onClick="showsubmenu(0)"
									onMouseOut="this.className='menu_title';" style="cursor:hand"><table
										width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="22%">&nbsp;</td>
											<td width="78%" class="STYLE1"><a
												href="link/userlist.jsp" target=main>用户管理</a></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td bgcolor="#f0f0f0" id="submenu0">
									<div class="sec_menu">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><table width="90%" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td width="19%" height="28"><div align="center">
																	<img src="images/left.gif" />
																</div></td>
															<td width="81%"><table width="95%" border="0"
																	cellspacing="0" cellpadding="0">
																	<tr>
																		<td><a href="link/adduser.jsp" target=main
																			class="STYLE3">添加用户</a></td>
																	</tr>
																</table></td>
														</tr>
														<tr>
															<td height="28"><div align="center">
																	<img src="images/left.gif" />
																</div></td>
															<td height="28"><table width="95%" border="0"
																	cellspacing="0" cellpadding="0">
																	<tr>
																		<td><a href="link/userlist.jsp" target=main
																			class="STYLE3">用户列表</a></td>
																	</tr>
																</table></td>
														</tr>
														<tr>
															<td height="28"><div align="center">
																	<img src="images/left.gif" />
																</div></td>
															<td height="28"><table width="95%" border="0"
																	cellspacing="0" cellpadding="0">
																	<tr>
																		<td><a href="link/alteruserinfo.jsp" target=main
																			class="STYLE3">修改用户基本信息</a></td>
																	</tr>
																</table></td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td height="32" background="images/main_47.gif"
																id="imgmenu1" class="menu_title"
																onMouseOver="this.className='menu_title2';"
																onClick="showsubmenu(1)"
																onMouseOut="this.className='menu_title';"
																style="cursor:hand"><table width="100%" border="0"
																	cellspacing="0" cellpadding="0">
																	<tr>
																		<td width="22%">&nbsp;</td>
																		<td width="78%" class="STYLE1"><a
																			href="link/information.jsp" target=main>添加稿件信息</a></td>
																	</tr>
																</table></td>
														</tr>
														<tr>
															<td bgcolor="#f0f0f0" id="submenu1" style="display:none">
																<div class="sec_menu">
																	<table width="100%" border="0" cellspacing="0"
																		cellpadding="0">
																		<tr>
																			<td><table width="90%" border="0" align="center"
																					cellpadding="0" cellspacing="0">
																					<tr>
																						<td width="19%" height="28"><div
																								align="center">
																								<img src="images/left.gif" />
																							</div></td>
																						<td width="81%"><table width="95%" border="0"
																								cellspacing="0" cellpadding="0">
																								<tr>
																									<td><a href="link/information.jsp"
																										target=main class="STYLE3">稿件详细信息</a></td>
																								</tr>
																							</table></td>
																					</tr>
																					<tr>
																						<td height="28"><div align="center">
																								<img src="images/left.gif" />
																							</div></td>
																						<td height="28"><table width="95%" border="0"
																								cellspacing="0" cellpadding="0">
																								<tr>
																									<td><a href="link/inputinfor.jsp"
																										target=main class="STYLE3">添加稿件信息</a></td>
																								</tr>
																							</table></td>
																					</tr>
																					<tr>
																						<td height="28"><div align="center">
																								<img src="images/left.gif" />
																							</div></td>
																						<td height="28"><table width="95%" border="0"
																								cellspacing="0" cellpadding="0">
																								<tr>
																									<td><a href="link/alterinfor.jsp"
																										target=main class="STYLE3">修改稿件信息</a></td>
																								</tr>
																							</table></td>
																					</tr>


																				</table></td>
																		</tr>
																	</table>
																</div></td>
														</tr>

													</table></td>
											</tr>
											<tr>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td height="32" background="images/main_47.gif"
																id="imgmenu2" class="menu_title"
																onmouseover="this.className='menu_title2';"
																onclick="showsubmenu(2)"
																onmouseout="this.className='menu_title';"
																style="cursor:hand"><table width="100%" border="0"
																	cellspacing="0" cellpadding="0">
																	<tr>
																		<td width="22%">&nbsp;</td>
																		<td width="78%" class="STYLE1"><a
																			href="link/feedback.jsp" target=main>意见反馈</a></td>
																	</tr>
																</table></td>
														</tr>
														<tr>
															<td bgcolor="#f0f0f0" id="submenu2" style="display:none"><div
																	class="sec_menu">
																	<table width="100%" border="0" cellspacing="0"
																		cellpadding="0">
																		<tr>
																			<td><table width="90%" border="0" align="center"
																					cellpadding="0" cellspacing="0">
																					<tr>
																						<td width="19%" height="28"><div
																								align="center">
																								<img src="images/left.gif" />
																							</div></td>
																						<td width="81%"><table width="95%" border="0"
																								cellspacing="0" cellpadding="0">
																								<tr>
																									<td><a href="link/feedback.jsp"
																										target=main class="STYLE3">添加稿件意见反馈信息</a></td>
																								</tr>
																							</table></td>
																					</tr>
																				</table></td>
																		</tr>
																	</table>
																</div></td>
														</tr>
													</table>
												</td>
											</tr>


										</table>
								</td>
							</tr>


						</table> <script>
							function showsubmenu(sid) {
								whichEl = eval("submenu" + sid);
								imgmenu = eval("imgmenu" + sid);
								if (whichEl.style.display == "none") {
									eval("submenu" + sid
											+ ".style.display=\"\";");
									imgmenu.background = "images/main_47.gif";
								} else {
									eval("submenu" + sid
											+ ".style.display=\"none\";");
									imgmenu.background = "images/main_48.gif";
								}
							}
						</script>