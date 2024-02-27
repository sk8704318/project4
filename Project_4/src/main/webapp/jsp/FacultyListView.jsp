<%@page import="in.co.pro4.controller.FacultyListCtl"%>
<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="in.co.pro4.bean.FacultyBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
<meta charset="ISO-8859-1">
<title>Student List</title>

<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT%>/js/Checkbox11.js"></script>

<title>Faculty List</title>
</head>
<body>
	<jsp:useBean id="bean" class="in.co.pro4.bean.FacultyBean" scope="request"></jsp:useBean>
	<%@include file="Header.jsp"%>

	<jsp:useBean id="colbean" class="in.co.pro4.bean.CollegeBean" scope="request"></jsp:useBean>
	<jsp:useBean id="corbean" class="in.co.pro4.bean.CourseBean" scope="request"></jsp:useBean>


	<center>
		<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">

			<div align="center">
				<h1>Faculty List</h1>
				<h3>
					<font style="color: green">
						<%=ServletUtility.getSuccessMessage(request)%>
					</font>
				</h3>
				<h3>
					<font style="color: red">
						<%=ServletUtility.getErrorMessage(request)%>
					</font>
				</h3>
			</div>


			<%
				List clist = (List) request.getAttribute("CollegeList");

				List colist = (List) request.getAttribute("CourseList");

				int next = DataUtility.getInt(request.getAttribute("nextlist").toString());
			%>



			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);

				int index = (pageNo - 1) * pageSize + 1;
				List list = ServletUtility.getList(request);
				Iterator<FacultyBean> it = list.iterator();

				if (list.size() != 0) {
			%>

			<table width="100%" align="center">
				<tr>
					<th></th>
					<td align="center">
						<label>First Name :</label> 
						<input type="text" 
								name="firstname" 
								style="width: 231px;"
								placeholder="Enter First Name"
								value=<%=ServletUtility.getParameter("firstname", request)%>>
						&nbsp; 
						
						<label>College Name :</label> 
						<%=HTMLUtility.getList("collegeid", String.valueOf(bean.getCollegeId()), clist)%>
						&nbsp; 
						
					<label>Course Name :</label> 
						<%=HTMLUtility.getList("courseid", String.valueOf(bean.getCourseId()), colist)%>
					&nbsp;
						&nbsp; 
						
						<input type="submit" 
								name="operation"
								value="<%=FacultyListCtl.OP_SEARCH%>"> 
						
						<input type="submit" 
								name="operation"
								value="<%=FacultyListCtl.OP_RESET%>">
					</td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%" align="center" cellpadding=8px cellspacing=".2">

				<tr style="background: #0FFAAD">
					<th>
						<input type="checkbox" 
								id="select_all" 
								name="Select"
								<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
								<%="disabled"%> <%}%>>Select All
					</th>
					<th>S.No.</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email ID</th>
					<th>College Name</th>
					<th>Course Name</th>
					<th>Subject Name</th>
					<th>DOB</th>
					<th>Mobile No</th>
					<th>Edit</th>
				</tr>

				<%
					while (it.hasNext()) {
							bean = it.next();
				%>

				<tr>
					<td>
						<input type="checkbox" 
								class="checkbox" 
								name="ids"
								value="<%=bean.getId()%>"
								<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
								<%="disabled"%> <%}%>>
					</td>
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getFirstName()%></td>
					<td align="center"><%=bean.getLastName()%></td>
					<td align="center"><%=bean.getEmailId()%></td>
					<td align="center"><%=bean.getCollegeName()%></td>
					<td align="center"><%=bean.getCourseName()%></td>
					<td align="center"><%=bean.getSubjectName()%></td>
					<td align="center"><%=bean.getDob()%></td>
					<td align="center"><%=bean.getMobileNo()%></td>
					<td align="center">
						<a href="FacultyCtl?id=<%=bean.getId()%>"
						<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
						onclick="return false;" <%}%>>Edit </a>
					</td>

				</tr>
				<%
					}
				%>
			</table>

			<table width="100%">
				<tr>
					<th></th>
					<%
						if (pageNo == 1) {
					%>
					<td align="left">
						<input type="submit" 
								name="operation"
								disabled="disabled" 
								value="<%=FacultyListCtl.OP_PREVIOUS%>">
					</td>
					<%
						} else {
					%>
					<td align="left">
						<input type="submit" 
								name="operation"
								value="<%=FacultyListCtl.OP_PREVIOUS%>">
					</td>
					<%
						}
					%>
					<td>
						<input type="submit" 
								name="operation"
								value="<%=FacultyListCtl.OP_DELETE%>"
								<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
								<%="disabled"%> <%}%>>
					</td>
					<td>
						<input type="submit" 
								name="operation"
								value="<%=FacultyListCtl.OP_NEW%>"
								<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
								<%="disabled"%> <%}%>>
					</td>


					<td align="right">
						<input type="submit" 
								name="operation"
								value="<%=FacultyListCtl.OP_NEXT%>"
								<%=(list.size() < pageSize || next == 0) ? "disabled" : ""%>>
					</td>
				</tr>
			</table>

			<%
				}
				if (list.size() == 0)

				{
			%>
			<td align="center">
				<input type="submit" 
						name="operation"
						value="<%=FacultyListCtl.OP_BACK%>">
			</td>
			<%
				}
			%>
			
			
				<input type="hidden" name="pageNo" value="<%=pageNo%>"> 
				<input type="hidden" name="pageSize" value="<%=pageSize%>">
				
		</form>
		
		</br> 
		</br> 
		</br> 
		</br> 
		</br> 
		</br>
	</center>

	<%@include file="Footer.jsp"%>
</body>
</html>