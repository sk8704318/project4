<%@page import="in.co.pro4.bean.RoleBean"%>
<%@page import="in.co.pro4.controller.LoginCtl"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@page import="in.co.pro4.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
<meta charset="ISO-8859-1">
<title>Header</title>
</head>
<body>
	<%
		UserBean userBean = (UserBean) session.getAttribute("user");
		boolean userLoggedIn = userBean != null;
		String welcomeMsg = "Hi, ";
		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg += userBean.getFirstName() + " (" + role + ")";
		} else {
			welcomeMsg += "Guest";
		}
	%>

	<table style="font-size: 18px">
		<tr>
			<th></th>
			<td width="90%">
			<a href="<%=ORSView.WELCOME_CTL%>">Welcome</a> | 
			<%
				if (userLoggedIn) {
			%> 
			<a href=" <%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</a>
			<%
				} else {
			%>
			 <a href="<%=ORSView.LOGIN_CTL%>">Login</a>
		    <%
 				}
 			%>
 			</td>
			<td rowspan="2">
				<h1 align="right">
					<img src="<%=ORSView.APP_CONTEXT%>/img/RaysLogo.png" width="240" height="90">
				</h1>
			</td>
		</tr>

		<tr>
			<th></th>
			<td>
				<h3><%=welcomeMsg%></h3>
			</td>
		</tr>

		<%
			if (userLoggedIn) {
		%>

		<tr>
			<th></th>
			<td colspan="2">
				<font> 
					<a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</a> | 
					<a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a> | 
					<a href="<%=ORSView.GET_MARKSHEET_CTL%>">Get Marksheet</a> | 
					<a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet Merit List</a> | 
					
					<%
					if (userBean.getRoleId() == RoleBean.ADMIN) {
					%> 
					<a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a> | 
					<a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a> | 
					<a href="<%=ORSView.USER_CTL%>">Add User</a> | 
					<a href="<%=ORSView.USER_LIST_CTL%>">User List</a> | 
					<a href="<%=ORSView.COLLEGE_CTL%>">Add College</a> | 
					<a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> | 
					<a href="<%=ORSView.ROLE_CTL%>">Add Role</a> | 
					<a href="<%=ORSView.ROLE_LIST_CTL%>">Role List</a> | 
					<a href="<%=ORSView.STUDENT_CTL%>">Add Student</a> | 
					<a href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> | 
					<a href="<%=ORSView.COURSE_CTL%>">Add Course</a> | 
					<a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a> | 
					<a href="<%=ORSView.SUBJECT_CTL%>">Add Subject</a> | 
					<a href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a> | 
					<a href="<%=ORSView.FACULTY_CTL%>">Add Faculty</a> | 
					<a href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a> | 
					<a href="<%=ORSView.TIMETABLE_CTL%>">Add Time Table</a> | 
					<a href="<%=ORSView.TIMETABLE_LIST_CTL%>">Time Table List</a> | 
					
					<a target="blank" href="<%=ORSView.JAVA_DOC_VIEW%>">Java Doc</a> 
					<%
 						}
 					%> 
 					<%
 					if (userBean.getRoleId() == RoleBean.STUDENT) {
 					%> 
 					<a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> | 
 					<a href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> | 
 					<a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a> | 
 					<a href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a> | 
 					<a href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a> | 
 					<a href="<%=ORSView.TIMETABLE_LIST_CTL%>">Time Table List</a> |
 					<%
 						}
 					%> 
 					<%
 					if (userBean.getRoleId() == RoleBean.KIOSK) {
 					%> 
 					<a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</b></a> | 
 					<a href="<%=ORSView.TIMETABLE_LIST_CTL%>">Time Table List</b></a> | 
 					<a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</b></a> |
 					<%
 						}
 					%>
 					<%
 					if (userBean.getRoleId() == RoleBean.FACULTY) {
 					%> 
 					<a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a> | 
 					<a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a> | 
 					<a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> | 
 					<a href="<%=ORSView.STUDENT_CTL%>">Add Student</a> | 
 					<a href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> | 
 					<a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a> | 
 					<a href="<%=ORSView.SUBJECT_CTL%>">Add Subject</a> | 
 					<a href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a> | 
 					<a href="<%=ORSView.TIMETABLE_CTL%>">Add Time Table</a> | 
 					<a href="<%=ORSView.TIMETABLE_LIST_CTL%>">Time Table List</a> |
 					<%
 						}
 					%> 
 					<%
 					if (userBean.getRoleId() == RoleBean.COLLEGE_SCHOOL) {
 					%> 
 					<a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a> | 
 					<a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a> | 
 					<a href="<%=ORSView.STUDENT_CTL%>">Add Student</a> | 
 					<a href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> | 
 					<a href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a> | 
 					<a href="<%=ORSView.TIMETABLE_LIST_CTL%>">Time Table List</a> | 
 					<a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a> | 
 					<%
 						}
 					%>
				</font>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<hr>
</body>
</html>