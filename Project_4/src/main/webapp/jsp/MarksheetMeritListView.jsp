<%@page import="in.co.pro4.controller.MarksheetMeritListCtl"%>
<%@page import="in.co.pro4.bean.MarksheetBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.pro4.utility.ServletUtility"%>
<%@page import="in.co.pro4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/Raysicon.png" sizes="16*16" />

<title>Merit List</title>

</head>
<body>
	<jsp:useBean id="bean" class="in.co.pro4.bean.MarksheetBean" scope="request"></jsp:useBean>
	<form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="POST">
<%@include file="Header.jsp"%>
		<center>
			<h1>Marksheet Merit List</h1>
			<br>
			
			<table border="1" width="100%" align="center" cellpadding=4px cellspacing=".2">
				<tr style="background: #0FFAAD">

					<th>S.No.</th>
					<th>Roll No</th>
					<th>Name</th>
					<th>Physics</th>
					<th>Chemistry</th>
					<th>Maths</th>
					<th>Total</th>
					<th>Percentage</th>
				</tr>
				<%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					List list = ServletUtility.getList(request);
					Iterator<MarksheetBean> it = list.iterator();

					while (it.hasNext()) {

						bean = it.next();

						int phy = bean.getPhysics();
						int chem = bean.getChemistry();
						int maths = bean.getMaths();
						int total = (phy + chem + maths);
						float perc = total / 3;
				%>
				<tr align="center">

					<td><%=index++%></td>
					<td><%=bean.getRollNo()%></td>
					<td><%=bean.getName()%></td>
					<td><%=phy%></td>
					<td><%=chem%></td>
					<td><%=maths%></td>
					<td><%=total%></td>
					<td><%=((perc) + "%")%></td>
				</tr>

				<%
					}
				%>
			</table>
			<br>
			<table>
				<tr>
					<td align="right">
						<input type="submit" 
								name="operation"
								value="<%=MarksheetMeritListCtl.OP_BACK%>">
					</td>
				</tr>
			</table>
			
				<input type="hidden" name="pageNo" value="<%=pageNo%>"> 
				<input type="hidden" name="pageSize" value="<%=pageSize%>">
	</form>
	</center>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>


	<%@include file="Footer.jsp"%>
</body>
</html>