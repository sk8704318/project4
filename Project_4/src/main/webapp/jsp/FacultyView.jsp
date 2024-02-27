<%@page import="in.co.pro4.controller.FacultyCtl"%>
<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.bean.SubjectBean"%>
<%@page import="in.co.pro4.bean.CourseBean"%>
<%@page import="in.co.pro4.bean.CollegeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
<title>Add Faculty</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#date").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1995:2010',
		});
	});
</script>
</head>
<body>
	<jsp:useBean id="bean" class="in.co.pro4.bean.FacultyBean" scope="request"></jsp:useBean>
	<%@include file="Header.jsp"%>


<form action="<%=ORSView.FACULTY_CTL%>" method="post">

		<%
			List<CollegeBean> colist = (List<CollegeBean>) request.getAttribute("CollegeList");
			List<CourseBean> clist = (List<CourseBean>) request.getAttribute("CourseList");
			List<SubjectBean> slist = (List<SubjectBean>) request.getAttribute("SubjectList");
		%>

		<center>
			<h1>
				<%
					if (bean != null && bean.getId() > 0) {
				%>

				<tr>
					<th>Update Faculty</th>
				</tr>
				<%
					} else {
				%>

				<tr>
					<th>Add Faculty</th>
				</tr>
				<%
					}
				%>
			</h1>

			<div>
				<h3>
					<font color="green">
						<%=ServletUtility.getSuccessMessage(request)%>
					</font>
					<font color="red">
						<%=ServletUtility.getErrorMessage(request)%>
					</font>
				</h3>
			</div>

			<input type="hidden" name="id" value=<%=bean.getId()%>> 
			<input type="hidden" name="createdby" value=<%=bean.getCreatedBy()%>>
			<input type="hidden" name="modifiedby" value=<%=bean.getModifiedBy()%>> 
			<input type="hidden" name="createdDatetime" value=<%=DataUtility.getStringData(bean.getCreatedDatetime())%>>
			<input type="hidden" name="modifiedDatetime" value=<%=DataUtility.getStringData(bean.getModifiedDatetime())%>>

			<table style="height: 100px; padding-bottom:5%;">

				<tr>
					<th align="left">First Name <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="firstname"
								placeholder=" Enter First Name" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getFirstName())%>">
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("firstname", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th align="left">Last Name <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="lastname"
								placeholder=" Enter last Name" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getLastName())%>">
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("lastname", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th align="left">Gender <span style="color: red">*</span> : </th>
					<td>
						<%
							HashMap map = new HashMap();
							map.put("Male", "Male");
							map.put("Female", "Female");

							String hlist = HTMLUtility.getList("gender", String.valueOf(bean.getGender()), map);
						%> 
						<%=hlist%>
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("gender", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th align="left">College Name <span style="color: red">*</span> : </th>
					<td>
						<%=HTMLUtility.getList("collegeid", String.valueOf(bean.getCollegeId()), colist)%>
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("collegeid", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th align="left">Course Name <span style="color: red">*</span> : </th>
					<td>
						<%=HTMLUtility.getList("courseid", String.valueOf(bean.getCourseId()), clist)%>
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("courseid", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th align="left">Subject Name <span style="color: red">*</span> : </th>
					<td>
						<%=HTMLUtility.getList("subjectid",String.valueOf(bean.getSubjectId()), slist)%>
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("subjectid", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th align="left">Date Of Birth <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="dob"
								placeholder="Enter Date Of Birth" 
								style="width: 231px;"
								readonly="readonly" 
								id="date"
								value="<%=DataUtility.getDateString(bean.getDob())%>">
					</td>
					<td >
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("dob", request)%>
						</font>
					</td>
				</tr>
				<tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>


				<tr>
					<th align="left">LoginId <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="loginid"
								placeholder=" Enter Login Id" 
								style="width: 231px;"
								value="<%=DataUtility.getStringData(bean.getEmailId())%>">
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("loginid", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 3px"></th>
				</tr>

				<tr>
					<th align="left">MobileNo <span style="color: red">*</span> : </th>
					<td>
						<input type="text" 
								name="mobileno" 
								style="width: 231px;"
								maxlength="10" 
								placeholder=" Enter Mobile No"
								value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
					</td>
					<td >
						<font color="red">
							<%=ServletUtility.getErrorMessage("mobileno", request)%>
						</font>
					</td>
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
							value="<%=FacultyCtl.OP_UPDATE%>"> 
					&nbsp; &nbsp; 
					<input type="submit" 
							name="operation" 
							value="<%=FacultyCtl.OP_CANCEL%>">
					</td>
					<%
						} else {
					%>
					<td>
					&nbsp; &emsp; 
					<input type="submit" 
							name="operation"
							value="<%=FacultyCtl.OP_SAVE%>"> 
					&nbsp; &nbsp; 
					<input type="submit" 
							name="operation" 
							value="<%=FacultyCtl.OP_RESET%>">
					</td>
					<%
						}
					%>
				</tr>
			</table>
		</center>
	</form>
	
	<%@include file="Footer.jsp"%>

</body>
</html>