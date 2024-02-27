<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.pro4.controller.MyProfileCtl"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>My Profile</title>

<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />

<meta charset="utf-8">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#udate").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1995:2010',
		//  mindefaultDate : "01-01-1962"
		});
	});
</script>
</head>
<body>
<%@include file="Header.jsp"%>
	<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">

	<script type="text/javascript" src="../js/calendar.js"></script>
	<jsp:useBean id="bean" class="in.co.pro4.bean.UserBean" scope="request"></jsp:useBean>

		<center>
			<h1>My Profile</h1>

			<h2>
				<font color="red"> 
					<%=ServletUtility.getErrorMessage(request)%>
				</font>
			</h2>
			
			<input type="hidden" name="id" value="<%=bean.getId()%>"> 
			<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">


			<table>
				<tr>
					<th align="left">LoginId<span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="login" 
								size="29"
								value="<%=DataUtility.getStringData(bean.getLogIn())%>"
								readonly="readonly">
								
						<font color="red"> 
								<%=ServletUtility.getErrorMessage("login", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 4px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="left">First Name<span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="firstName" 
								size="29"
								value="<%=DataUtility.getStringData(bean.getFirstName())%>">
					
					<font color="red"> 
						<%=ServletUtility.getErrorMessage("firstName", request)%>
					</font>
				</td>
				</tr>
				<tr>
					<th style="padding: 4px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="left">Last Name<span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="lastName" 
								size="29"
								value="<%=DataUtility.getStringData(bean.getLastName())%>">
						
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("lastName", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 4px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="left">Gender <span style="color: red">*</span> : </th>
					<td>
						<%
							HashMap map = new HashMap();
							map.put("Male", "Male");
							map.put("Female", "Female");

							String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
						%> 
						<%=htmlList%>
					</td>
				</tr>
				<tr>
					<th style="padding: 4px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="left">Mobile No<span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="mobileNo" 
								maxlength="10"
								size="29"
								value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
					
					<font color="red"> 
						<%=ServletUtility.getErrorMessage("mobileNo", request)%>
					</font>
				</td>
				</tr>
				<tr>
					<th style="padding: 4px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="left">Date Of Birth (mm/dd/yyyy)<span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								id="udate"
								name="dob" 
								size="29"
								readonly="readonly"
								value="<%=DataUtility.getDateString(bean.getDob())%>">
					
					<td style="position: fixed;">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("dob", request)%>
						</font>
					</td>
					</td>
				</tr>

				<h2>
					<font color="green"> 
						<%=ServletUtility.getSuccessMessage(request)%>
					</font>
				</h2>
				<tr>
					<th style="padding: 4px"></th>
					<td></td>
				</tr>

				<tr>
					<th></th>
					<td colspan="2">
						<input type="submit" 
								name="operation"
								value="<%=MyProfileCtl.OP_SAVE%>"> 
					&nbsp;
					
						<input type="submit" 
								name="operation"
								value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>"> 
					
					&nbsp;
					</td>
				</tr>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>