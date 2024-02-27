<%@page import="in.co.pro4.controller.SubjectListCtl"%>
<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.pro4.bean.SubjectBean"%>
<%@page import="in.co.pro4.bean.CourseBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />

<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT%>/js/Checkbox11.js"></script>

<meta charset="ISO-8859-1">
<title>Subject List</title>
</head>
<body>
	<jsp:useBean id="bean" class="in.co.pro4.bean.SubjectBean" scope="request"></jsp:useBean>
<%@include file="Header.jsp"%>
	<div align="center">
		<h1 align="center" style="margin-bottom: -15; color: navy;">Subject List</h1>

		<div style="height: 15px; margin-bottom: 12px">
			<h3>
				<font color="red">
					<%=ServletUtility.getErrorMessage(request)%>
				</font>
			</h3>
			<h3>
				<font color="green">
					<%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</h3>
		</div>
		<form action="<%=ORSView.SUBJECT_LIST_CTL%>" method="post">

			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());

				@SuppressWarnings("unchecked")
				List<CourseBean> clist = (List<CourseBean>) request.getAttribute("courseList");
				@SuppressWarnings("unchecked")
				List<SubjectBean> slist = (List<SubjectBean>) request.getAttribute("subjectList");
				@SuppressWarnings("unchecked")
				List<SubjectBean> list = (List<SubjectBean>) ServletUtility.getList(request);
				Iterator<SubjectBean> it = list.iterator();

				if (list.size() != 0) {
			%>


			<input type="hidden" name="pageNo" value="<%=pageNo%>">
			<input type="hidden" name="pageSize" value="<%=pageSize%>">

			<table style="width: 100%">
				<tr>
					<td align="center">
						<label><b>Subject Name :</b></label> 
						<%=HTMLUtility.getList("subjectId", String.valueOf(bean.getId()), slist)%>
					&emsp;
					
						<label><b>Course Name :</b></label> 
						<%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), clist)%>
					&emsp;
					
						<input type="submit" 
								name="operation" 
								value="<%=SubjectListCtl.OP_SEARCH%>">
					&nbsp; 
						
						<input type="submit" 
								name="operation" 
								value="<%=SubjectListCtl.OP_RESET%>">
					</td>
				</tr>
			</table>
			<br>

			<table border="1" width="100%" align="center" cellpadding=6px cellspacing=".2">
				<tr style="background: #0FFAAD;">
					<th>
						<input type="checkbox" 
								id="select_all" 
								name="select"
								<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
								<%="disabled"%> <%}%>> Select All.
					</th>
					<th width="5%">S.No</th>
					<th width="30%">Subject Name</th>
					<th width="15%">Course Name</th>
					<th width="40%">Description</th>
					<th width="5%">Edit</th>
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
					<td style="text-align: center;"><%=index++%></td>
					<td style="text-align: center;"><%=bean.getSubjectName()%></td>
					<td style="text-align: center;"><%=bean.getCourseName()%></td>
					<td style="text-align: center;"><%=bean.getDescription()%></td>
					<td style="text-align: center;">
						<a href="SubjectCtl?id=<%=bean.getId()%>"
							<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
							onclick="return false;" <%}%>>Edit</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<table style="width: 100%">
				<tr>

					<td style="width: 25%">
						<input type="submit" 
								name="operation"
								value="<%=SubjectListCtl.OP_PREVIOUS%>"
								<%=pageNo > 1 ? "" : "disabled"%>>
					</td>

					<td align="center" style="width: 25%">
						<input type="submit"
								name="operation" 
								value="<%=SubjectListCtl.OP_DELETE%>"
								<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
								<%="disabled"%> <%}%>>
					</td>
					<td align="center" style="width: 25%">
						<input type="submit"
								name="operation" 
								value="<%=SubjectListCtl.OP_NEW%>"
								<%if (userBean.getRoleId() == RoleBean.STUDENT) {%>
								<%="disabled"%> <%}%>>
					</td>
					<td align="right">
						<input type="submit" 
								name="operation"
								value="<%=SubjectListCtl.OP_NEXT%>"
								<%=(nextPageSize != 0) ? "" : "disabled"%>>
					</td>

				</tr>

			</table>
			<%
				}
				if (list.size() == 0) {
			%>
			<table>
				<tr>
					<td align="right">
						<input type="submit" 
								name="operation"
								value="<%=SubjectListCtl.OP_BACK%>">
					</td>
				</tr>
			</table>
			<%
				}
			%>
		</form>
	</div>
	</br>
	</br>
	</br>
	</br>
	<%@include file="Footer.jsp"%>
</body>
</html>