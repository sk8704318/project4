<%@page import="in.co.pro4.utility.DataValidator"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
<meta charset="ISO-8859-1">
<title>LogIn Page</title>
</head>

<body>
	<form action="<%=ORSView.LOGIN_CTL%>" method="post">
<%@include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.pro4.bean.UserBean" scope="request"></jsp:useBean>
		<%
			String URI = (String) request.getAttribute("uri");
		%>

		<input type="hidden" name="URI"  value="<%=URI%>">
		
		<center>
			<h1>Login</h1>

			<h2>
				<font color="red">
					<%=ServletUtility.getErrorMessage(request)%>
				</font>
			</h2>
			<h2>
				<font color="green">
					 <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</h2>

			<input type="hidden" name="id" value="<%=bean.getId()%>"> 
			<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

			<table>
				<tr>
					<th>Login Id<font color="red">* </font>:</th>
					<td>
 						<input type="text"  
								name="login" 
								size="30" 
								placeholder="Enter Login Id"
								value="<%=DataUtility.getStringData(bean.getLogIn())%>">
					</td>
					<td style="position: fixed;">
						<font color="red">
							<%=ServletUtility.getErrorMessage("login", request)%>
						</font>
					</td>                            
				</tr>
				<tr>
					<th style="padding: 4px;"></th>
				</tr>
				<tr>
					<th>Password<font color="red">* </font>:</th>
					<td>
						<input type="password" 
								name="password" size="30"
								placeholder="Enter Password"
								value="<%=DataUtility.getStringData(bean.getPassword())%>">
					</td>
					<td style="position: fixed;">
						<font color="red">
							<%=ServletUtility.getErrorMessage("password", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 4px;"></th>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="submit" 
								name="operation"
								value="<%=LoginCtl.OP_SIGN_IN%>">
						&nbsp; 
						<input type="submit" 
								name="operation" 
								value="<%=LoginCtl.OP_SIGN_UP%>">
						&nbsp;
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<a href="<%=ORSView.FORGET_PASSWORD_CTL%>">
							<b>Forget my password</b>
						</a>&nbsp;
					</td>
				</tr>
			</table>
		</center>
	</form>
	<%@include file="Footer.jsp"%>
</body>
</html>