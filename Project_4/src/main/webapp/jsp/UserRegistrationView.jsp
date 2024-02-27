
<%@page import="in.co.pro4.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
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
			yearRange : '1950:2010',
		//  mindefaultDate : "01-01-1962"
		});
	});
</script>
</head>
<body>
	<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">
<%@include file="Header.jsp"%>
		<script type="text/javascript" src="/js/HTMLCalender.js"></script>
		<jsp:useBean id="bean" class="in.co.pro4.bean.UserBean" scope="request"></jsp:useBean>
		<center>
			<h1>User Registration</h1>
			<h2>
				<font color="green">
					 <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</h2>
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
					<th align="right">First Name <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="firstName"
								placeholder="Enter first name" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getFirstName())%>">
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("firstName", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="right">Last Name <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="lastName"
								placeholder="Enter last name" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getLastName())%>">
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("lastName", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="right">Log In <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="login"
								placeholder="Enter email id" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getLogIn())%>">
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("login", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="right">Gender <span style="color: red">*</span> : </th>
					<td>
						<%
							HashMap map = new HashMap();

							map.put("Male", "Male");
							map.put("Female", "Female");
							 
							

							String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
						%>
					   <%=htmlList%>
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("gender", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="right">Date Of Birth <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="dob" 
								id="udate"
								readonly="readonly" 
								style="width: 231px;" 
								placeholder="Enter Dob "
								value="<%=DataUtility.getDateString(bean.getDob())%>">
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("dob", request)%>
						</font>
					</td>
				</tr>

				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="right">Mobile No <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="mobileNo"
								placeholder="Enter Mobile No" 
								style="width: 231px;" 
								maxlength="10"
								value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("mobileNo", request)%>
					</font></td>
				</tr>

				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="right">Password <span style="color: red">*</span> : </th>
					<td>
						<input type="password" 
								name="password"
								placeholder="Enter Password" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getPassword())%>">
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("password", request)%>
						</font>
					</td>
				</tr>

				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="right">Confirm Password <span style="color: red">*</span> : </th>
					<td>
						<input type="password" 
								name="confirmPassword"
								placeholder="Re-Enter password" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
					</td>
					<td style="position: fixed">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("confirmPassword", request)%>
						</font>
					</td>
				</tr>

				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">
					&nbsp; &emsp; 
						<input type="submit"
								name="operation" 
								value="<%=UserRegistrationCtl.OP_SIGN_UP%>">
					&nbsp; 
						<input type="submit" 
								name="operation"
								value="<%=UserRegistrationCtl.OP_RESET%>">
					</td>
				</tr>
			</table>

		</center>
		<%@include file="Footer.jsp"%>
	</form>
</body>
</html>