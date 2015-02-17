<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>修改稿件信息</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
</head>

<body class="margin_left">



	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="100%" height="26" background="images/tab_05.gif"
				style="padding-left:38px;">当前位置 >> 稿件管理 >> 稿件列表 >> 修改稿件</td>
		</tr>
		<tr>
			<td>
				<div class="table_box2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th colspan="4"; ><font size="3px">修改稿件
							</th>
						</tr>
						<tr>
							<td align="right" width="197" style="padding-top:20px;">稿件编号：</td>
							<td width="215" style="padding-top:20px;"><input type="text"
								value="00001"
								onfocus="if(value=='00001') {value='';}this.style.color='#000';"
								onblur="if (value=='') {value='00001';this.style.color='#999';}">
							</td>
							<td align="right" width="182" style="padding-top:20px;">稿件名称：</td>
							<td width="505" style="padding-top:20px;"><input type="text"
								value="新闻与写作">
							</td>
						</tr>
						<tr>
							<td align="right"><p>稿件类型：</p>
							</td>
							<td><select name="">
									<option>网络及论坛稿</option>
							</select>
							</td>
							<td align="right"><p>稿件上传者：</p>
							</td>
							<td><input type="text" value="胡寿英">
							</td>
						</tr>
						<tr>
							<td align="right"><p>所属类别：</p>
							</td>
							<td><select name="">
									<option>网络及论坛</option>
							</select>
							</td>
							<td align="right"><p>稿件作者：</p>
							</td>
							<td><input type="text" value="胡寿英">
							</td>
						</tr>
						<tr>
							<td align="right">稿件提供：</td>
							<td><input type="text" value="搜狐网">
							</td>
							<td align="right">执行情况：</td>
							<td><select name="">
									<option>执行中</option>
									<option>未开始</option>
									<option>中止搁置</option>
									<option>已完成</option>
							</select>
							</td>
						</tr>
						<tr>
							<td align="right">经办人：</td>
							<td><input type="text" value="小李" class="input65">
							</td>
							<td align="right">签订日：</td>
							<td><input type="text" value="2012-05-27">
							</td>
						</tr>
						<tr>
							<td align="right"><p>开始日期：</p>
							</td>
							<td><input type="text" value="2012-06-11">
							</td>
							<td align="right"><p>截止日期：</p>
							</td>
							<td><input type="text" value="2012-08-11">
							</td>
						</tr>
						<tr>
							<td align="right">录入人：</td>
							<td><input type="text" value="小王" class="input65">
							</td>
							<td align="right"><p>录入日期：</p>
							</td>
							<td><input type="text" value="2012-05-27">
							</td>
						</tr>
						<tr>
							<td align="right">实务位置稿件：</td>
							<td><input type="text" value="研发部">
							</td>
							<td align="right"><p>电子稿件路径：</p>
							</td>
							<td><input type="text" value="xxxxxxx">
							</td>
						</tr>
						<tr>
							<td align="right">备注：</td>
							<td colspan="3"><textarea name="Content" rows="6"
									onfocus="if(this.value=='请输入') {this.value='';}this.style.color='#333';"
									onblur="if(this.value=='') {this.value='请输入';this.style.color='#333';}"
									maxlength="20"></textarea>
							</td>
						</tr>
						<tr>
							<td align="right"><p>稿件主要内容：</p>
							</td>
							<td colspan="3"><textarea name="Content" rows="6"
									onfocus="if(this.value=='稿件的要求如下：') {this.value='';}this.style.color='#333';"
									onblur="if(this.value=='') {this.value='稿件的要求如下：';this.style.color='#333';}"
									maxlength="20">稿件的要求如下：
      读者从新闻报道中要了解的是客观外界的真实情况，因此，新闻稿件所反映的客体必须是客观存在的事实，不能是虚假的东西。新闻稿件所写的内容不真实，即是新闻所反映的客体缺乏客观根据，具有主观成分。
      </textarea>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="2"><input type="submit"
								class="btn big" value="保存" style="font-size:12px;height:24px;"
								id="save" /></td>
							<td align="center"><input type="submit" class="btn big"
								value="返回" style="font-size:12px;height:24px;" id="return" /></td>
						</tr>
					</table>
				</div></td>
		</tr>
	</table>
</body>
</html>
