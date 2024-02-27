<%@page import="in.co.pro4.controller.ForgetPasswordCtl"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
</head>
<body>
	<jsp:useBean id="bean" class="in.co.pro4.bean.UserBean" scope="request"></jsp:useBean>
<%@ include file="Header.jsp"%>
	<div class="ss">
		<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">

			<div align="center">
				<h1 align="center">Forgot your password ?</h1>
				<lable>Submit your Email address and we'll send your password.</lable>
				<br>
			    <br>

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
			</div>

			<div align="center">
				<input type="hidden"  name="id"  value="<%=bean.getId()%>">

				<table align="center">
					<tr>
						<th align="left">Email Id <span style="color: red">* </span> : </th>
						<td>
							<input type="text" 
									name="login" 
									size="25"
									placeholder="Enter the Valid-Email Id" 
									size="30"
									value="<%=ServletUtility.getParameter("login", request)%>">
						</td>
						<td style="position: fixed">
							<font color="red"> 
								<%=ServletUtility.getErrorMessage("login", request)%>
							</font>
						</td>
					<tr>
						<th style="padding: 3px"></th>
					</tr>

					<tr>
						<th></th>
						<td>
						&nbsp;&nbsp; 
							<input type="submit" 
									name="operation"
									value="<%=ForgetPasswordCtl.OP_GO%>"> 
						&nbsp;&nbsp; 
							<input type="submit" 
									name="operation"
									value="<%=ForgetPasswordCtl.OP_RESET%>">
						</td>
					</tr>
				</table>
			</div>
		</form>
		</center>
	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>