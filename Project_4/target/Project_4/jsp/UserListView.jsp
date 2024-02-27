<%@page import="in.co.pro4.model.RoleModel"%>
<%@page import="in.co.pro4.utility.HTMLUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.UserListCtl"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
<meta charset="ISO-8859-1">
<title>User List</title>

<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT%>/js/Checkbox11.js"></script>


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
	<jsp:useBean id="bean" class="in.co.pro4.bean.UserBean" scope="request"></jsp:useBean>
	<%@include file="Header.jsp"%>

	<form action="<%=ORSView.USER_LIST_CTL%>" method="post">

		<center>

			<div align="center">
				<h1>User List</h1>
				<h3>
					<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
					<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
				</h3>
			</div>

			<%
				List rlist = (List) request.getAttribute("RoleList");

				List ulist = (List) request.getAttribute("LoginId");

				int next = DataUtility.getInt(request.getAttribute("nextlist").toString());
			%>


			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;

				List list = ServletUtility.getList(request);
				Iterator<UserBean> it = list.iterator();

				if (list.size() != 0) {
			%>
			<table width="100%" align="center">
				<tr>
					<th></th>
					<td align="center">
						<label>FirstName : </label> 
						<input type="text" 
								name="firstName" 
								style="width: 231px;"
								placeholder="Enter First Name"
								value="<%=ServletUtility.getParameter("firstName", request)%>">
					&emsp;
					



			<!-- 		 <label >Date Of Birth : </label>
						 <input type="text" 
						 		id="udate" 
						 		placeholder="Enter Date of birth" 
						 		name="dob"
						 		readonly="readonly"
								value="<%ServletUtility.getParameter("dob", request);%>">

 				 -->
 				
 						
 					
 					
						<label>Login Id : </label> 
						<input type="text" 
								name="loginid"
								style="width: 231px;" 
								placeholder="Enter Login-Id"
								value="<%=ServletUtility.getParameter("login", request)%>">
					&emsp;
 	


	<%-- <label>Gender: </label> 
						<input type="text" 
								name="gender"
								style="width: 231px;" 
								placeholder="Enter Login-Id"
								value="<%=ServletUtility.getParameter("gender", request)%>">
					&emsp;
					
 --%>
 
					<%-- 	<label>model : </label> 
							<select style='width: 238px;  height: 23px;' class='form-control' name='" + name + "'>
							<option style='width: 210px;  height: 30px;' selected value=''>--------------------Select--------------------</option></select>
				    &nbsp;&nbsp; 
				    --%>
						<label>Role : </label> 
							<%=HTMLUtility.getList("roleid", String.valueOf(bean.getRoleId()), rlist)%>
				    &nbsp;&nbsp; 
				    	<input type="submit" 
				    			name="operation"
								value="<%=UserListCtl.OP_SEARCH%>"> 
					&nbsp; 
						<input type="submit" 
								name="operation" 
								value="<%=UserListCtl.OP_RESET%>">
					</td>
				</tr>
			</table>
			<br>

			<table border="1" width="100%" align="center" cellpadding=6px cellspacing=".2">
				<tr style="background: #0FFAAD">
					<th><input type="checkbox" id="select_all" name="select">Select All</th>
					<th>S.No.</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>LoginId</th>
					<th>Gender</th>
					<th>Date Of Birth</th>
					<th>Mobile No</th>
					<th>Edit</th>
				</tr>

				<%
					while (it.hasNext()) {
							bean = it.next();
							RoleModel model = new RoleModel();
							RoleBean rolebean = new RoleBean();
							rolebean = model.findByPK(bean.getRoleId());
				%>


				<tr align="center">
					<td>																						
						<input type="checkbox" 
								class="checkbox" 
								name="ids"
								value="<%=bean.getId()%>"
							<%if (userBean.getId() == bean.getId() || bean.getRoleId() == RoleBean.ADMIN) {%>
							<%="disabled"%> <%}%>>
					</td>
					<td><%=index++%></td>
					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getLogIn()%></td>
					<td><%=bean.getGender()%></td>
					<td><%=bean.getDob()%></td>
					<td><%=bean.getMobileNo()%></td>
					<td>
						<a href="UserCtl?id=<%=bean.getId()%>"
						<%if (userBean.getId() == bean.getId() || bean.getRoleId() == RoleBean.ADMIN) {%> 
							onclick="return false;" 
						<%}%>>Edit</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>

			<table width="100%">`-
				<tr>
					<th></th>
					<%
						if (pageNo == 1) {
					%>
					<td>
						<input type="submit" 
								name="operation" 
								disabled="disabled"
								value="<%=UserListCtl.OP_PREVIOUS%>">
					</td>
					<%
						} else {
					%>
					<td>
						<input type="submit" 
								name="operation"
								value="<%=UserListCtl.OP_PREVIOUS%>">
					</td>
					<%
						}
					%>

					<td>
						<input type="submit" 
								name="operation"
								value="<%=UserListCtl.OP_DELETE%>">
					</td>
					<td>
						<input type="submit" 
								name="operation"
								value="<%=UserListCtl.OP_NEW%>">
					</td>
					<td align="right">
						<input type="submit" 
								name="operation"
								value="<%=UserListCtl.OP_NEXT%>"
								<%=(list.size() < pageSize || next == 0) ? "disabled" : ""%>>
					</td>



				</tr>
			</table>
			<%
				}
				if (list.size() == 0) {
			%>
			<td align="center">
				<input type="submit" 
						name="operation"
						value="<%=UserListCtl.OP_BACK%>">
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

	</center>

	<%@include file="Footer.jsp"%>

</body>
</html>