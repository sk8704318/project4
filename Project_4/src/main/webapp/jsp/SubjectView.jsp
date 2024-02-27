<%@page import="in.co.pro4.controller.SubjectCtl"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.bean.CourseBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />

<title>Add Subject</title>
</head>
<body>
	<jsp:useBean id="bean" class="in.co.pro4.bean.SubjectBean" scope="request"></jsp:useBean>
	<form action="<%=ORSView.SUBJECT_CTL%>" method="post">
<%@include file="Header.jsp"%>

       <%
			List<CourseBean> cl = (List<CourseBean>) request.getAttribute("CourseList");
		%>
		<center>
			<h1>
				<%
					if (bean != null && bean.getId() > 0) {
				%>
				<tr>
					<th>Update Subject</th>
				</tr>
				<%
					} else {
				%>
				<tr>
					<th>Add Subject</th>
				</tr>
				<%
					}
				%>
			</h1>
			<div>
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

			<input type="hidden" name="id" value="<%=bean.getId()%>"> 
			<input type="hidden" name="createdby" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedby" value="<%=bean.getModifiedBy()%>"> 
			<input type="hidden" name="createddatetime" value="<%=bean.getCreatedDatetime()%>">
			<input type="hidden" name="modifieddatetime" value="<%=bean.getModifiedDatetime()%>">

			<table>

				<tr>
					<th align="left">Course Name <span style="color: red">*</span> : </th>
					<td>
						<%=HTMLUtility.getList("coursename", String.valueOf(bean.getCourseId()), cl)%>
					</td>
					<td style="position: fixed">
						<font color="red">
							<%=ServletUtility.getErrorMessage("coursename", request)%>
						</font>
					</td>
				</tr>

				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<th align="left">Subject Name <span style="color: red">*</span> : </th>
				<td>
					<input type="text" 
							name="name"
							placeholder="Enter Subject Name" 
							style="width: 231px;"
							value="<%=DataUtility.getStringData(bean.getSubjectName())%>">
				</td>
				<td style="position: fixed">
					<font color="red">
						<%=ServletUtility.getErrorMessage("name", request)%>
					</font>
				</td>
				</th>
				</tr>

				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<th align="left">Description <span style="color: red">*</span> : </th>
				<td>
					<input type="text" 
							name="description"
							placeholder="Enter Description" 
							style="width: 231px;"
							value="<%=DataUtility.getStringData(bean.getDescription())%>">
				</td>
				<td style="position: fixed">
					<font color="red">
						<%=ServletUtility.getErrorMessage("description", request)%>
					</font>
				</td>
				</th>
				</tr>

				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th></th>
					<%
						if (bean.getId() > 0) {
					%>
					<td>
					&nbsp; &emsp; 
						<input type="submit" 
								name="operation"
								value="<%=SubjectCtl.OP_UPDATE%>"> 
					&nbsp; &nbsp; 
						<input type="submit" 
								name="operation" 
								value="<%=SubjectCtl.OP_CANCEL%>">
					</td>
					<%
						} else {
					%>

					<td>
					&nbsp; &emsp; 
						<input type="submit" 
								name="operation"
								value="<%=SubjectCtl.OP_SAVE%>"> 
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						<input type="submit" 
								name="operation"
								value="<%=SubjectCtl.OP_RESET%>">
					</td>
					<%
						}
					%>

				</tr>
			</table>
	</form>
	</br>
	</br>
	</center>

	<%@include file="Footer.jsp"%>
</body>
</html>