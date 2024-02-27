<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
<meta charset="ISO-8859-1">
<title>Welcome To Rays Technologies</title>
</head>
<body>
	<form action="<%=ORSView.WELCOME_CTL%>">
<%@include file="Header.jsp"%>
		<h1 align="center">
			<font size="10px" color="red">Welcome To ORS</font>
		</h1>
		
		
		<%
			UserBean beanUserBean = (UserBean) session.getAttribute("user");
			if (beanUserBean != null) {
				if (beanUserBean.getRoleId() == RoleBean.STUDENT) {
		%>
		<h1 align="center">
			<a href="<%=ORSView.GET_MARKSHEET_CTL%>">Click here to see your Marksheet</a>
		</h1>
		<%
				}
			}
		%>

	</form>
	<%@include file="Footer.jsp"%>
</body>
</html>