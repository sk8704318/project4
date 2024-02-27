<%@page import="in.co.pro4.controller.ChangePasswordCtl"%>
<%@page import="in.co.pro4.utility.DataUtility"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
	<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="post">
<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean" class="in.co.pro4.bean.UserBean" scope="request"></jsp:useBean>
		<div align="center">
			<h1 align="center">Change Password</h1>
			
			<div style="height: 15px; margin-bottom: 12px">
				<h3 align="center">
					<font color="green">
						 <%=ServletUtility.getSuccessMessage(request)%>
					</font>
				</h3>

				<h3 align="center">
					<font color="red"> 
						<%=ServletUtility.getErrorMessage(request)%>
					</font>
				</h3>

			</div>

			<input type="hidden" name="id" value="<%=bean.getId()%>">
		    <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
			<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">


			<table>
				<tr>
					<th align="left">Old Password<span style="color: red">*</span> : </th>
					<td align="center">
						<input type="password" 
								name="oldPassword"
								style="width: 231px;" 
								placeholder="Enter Old Password"
								value=<%=DataUtility.getString(request.getParameter("oldPassword") == null ? ""
										: DataUtility.getString(request.getParameter("oldPassword")))%>>
					</td>
					<td style="position: fixed;">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("oldPassword", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 4px;"></th>
				</tr>


				<tr>
					<th align="left">New Password<span style="color: red">*</span> : </th>
					<td align="center">
						<input type="password" 
								name="newPassword"
								style="width: 231px;" 
								placeholder="Enter New Password"
								value=<%=DataUtility.getString(request.getParameter("newPassword") == null ? ""
									: DataUtility.getString(request.getParameter("newPassword")))%>>
					</td>
					<td style="position: fixed;">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("newPassword", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 4px;"></th>
				</tr>
				<tr>
					<th align="left">Confirm Password<span style="color: red">*</span> : </th>
					<td align="center">
						<input type="password"
								name="confirmPassword" 
								style="width: 231px;"
								placeholder="Re-Enter New Password"
								value=<%=DataUtility.getString(request.getParameter("confirmPassword") == null ? ""
									: DataUtility.getString(request.getParameter("confirmPassword")))%>>
					</td>
					<td style="position: fixed;">
						<font color="red"> 
							<%=ServletUtility.getErrorMessage("confirmPassword", request)%>
						</font>
					</td>
				</tr>
				<tr>
					<th style="padding: 4px;"></th>
				</tr>
				<tr>
					<th></th>
					<td align="left" colspan="2">
						<input type="submit"
								name="operation" 
								value="<%=ChangePasswordCtl.OP_SAVE%>">
				&nbsp; 
						<input type="submit" 
								name="operation"
								value="<%=ChangePasswordCtl.OP_CHANGE_MY_PROFILE%>">
					</td>
				</tr>

			</table>
		</div>
	</form>

	<%@ include file="Footer.jsp"%>
</body>
</html>