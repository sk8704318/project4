<%@page import="java.util.List"%>
<%@page import="in.co.pro4.controller.UserCtl"%>
<%@page import="in.co.pro4.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add User</title>
<link rel="icon" type="image/png"
	href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
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
	<form action="<%=ORSView.USER_CTL%>" method="post">
		<%@include file="Header.jsp"%>
		<jsp:useBean id="bean" class="in.co.pro4.bean.UserBean"
			scope="request"></jsp:useBean>
		<%
			List list = (List) request.getAttribute("roleList");
			RoleBean rbean = new RoleBean();
		%>
		<center>
			<%
				if (bean != null && bean.getId() > 0) {
			%>
			<h1>Update User</h1>
			<%
				} else {
			%>
			<h1>Add User</h1>
			<%
				}
			%>
			<h2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</h2>
			<h2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</h2>

			<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
				type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy"
				value="<%=bean.getModifiedBy()%>"> <input type="hidden"
				name="createdDatetime"
				value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime"
				value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

			<table style="height: 100px; padding-bottom: 5%;">
				<tr>
					<th align="left">First Name <span style="color: red">*</span>
						:
					</th>
					<td><input type="text" name="firstName"
						placeholder="Enter first name" style="width: 231px;"
						value="<%=DataUtility.getStringData(bean.getFirstName())%>">
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="left">Last Name <span style="color: red">*</span> :
					</th>
					<td><input type="text" name="lastName"
						placeholder="Enter last name" style="width: 231px;"
						value="<%=DataUtility.getStringData(bean.getLastName())%>">
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>
				<tr>
					<th align="left">Log In <span style="color: red">*</span> :
					</th>
					<td><input type="text" name="login"
						placeholder="Enter email id" style="width: 231px;"
						value="<%=DataUtility.getStringData(bean.getLogIn())%>"></td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("login", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="left">Gender <span style="color: red">*</span> :
					</th>
					<td>
						<%
							HashMap map = new HashMap();

							map.put("Male", "Male");
							map.put("Female", "Female");

							String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
						%> <%=htmlList%>
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="left">Role <span style="color: red;">*</span> :
					</th>
					<td><%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()), list)%>
					</td>
					<td><font style="color: red;"> <%=ServletUtility.getErrorMessage("roleId", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="left">Date Of Birth <span style="color: red">*</span>
						:
					</th>
					<td><input type="text" name="dob" id="udate"
						readonly="readonly" style="width: 231px;" placeholder="Enter Dob "
						value="<%=DataUtility.getDateString(bean.getDob())%>"></td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="left">Mobile No <span style="color: red">*</span> :
					</th>
					<td><input type="text" name="mobileNo"
						placeholder="Enter Mobile No" style="width: 231px;" maxlength="10"
						value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>


				<%
					if (bean.getId() > 0 && bean != null) {
				%>
				<tr>
					<td><input type="hidden" name="password"
						placeholder="Enter Password" style="width: 231px;"
						value="<%=DataUtility.getStringData(bean.getPassword())%>">
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("password", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<td><input type="hidden" name="confirmPassword"
						placeholder="Re-Enter password" style="width: 231px;"
						value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%>
					</font></td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<th align="left">Password <span style="color: red">*</span> :
					</th>
					<td><input type="password" name="password"
						placeholder="Enter Password" style="width: 231px;"
						value="<%=DataUtility.getStringData(bean.getPassword())%>">
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("password", request)%>
					</font></td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>

				<tr>
					<th align="left">Confirm Password <span style="color: red">*</span>
						:
					</th>
					<td><input type="password" name="confirmPassword"
						placeholder="Re-Enter password" style="width: 231px;"
						value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
					</td>
					<td><font color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%>
					</font></td>
				</tr>
				<%
					}
				%>

				<tr>
					<th style="padding: 3px"></th>
					<td></td>
				</tr>


				<tr>
					<th></th>
					<td colspan="2">&nbsp; &emsp; <input type="submit"
						name="operation" value="<%=UserCtl.OP_SAVE%>"> &nbsp; <input
						type="submit" name="operation" value="<%=UserCtl.OP_RESET%>">
					</td>
				</tr>
			</table>

		</center>
		<%@include file="Footer.jsp"%>
	</form>
</body>
</html> 