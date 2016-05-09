<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/inc/header.jsp" %>
<title>Thông tin cá nhân</title>
<style>
	table{
	margin-left: 300px;
	}
</style>
</head>
<body >
	<%
		User sUser =(User) session.getAttribute("sUser");
		UserDAO userDAO = new UserDAO();
		User u = userDAO.getEmployeeByID(sUser.getEmployeeID());
	%>
	<div class="col-md-7" >
	<label style="margin-left: 560px; margin-top: 20px; font-size: 20px;">Thông tin nhân viên</label>
	<table class="table table-bordered">
		<tr>
			<td>Tên đăng nhập</td>
			<td><%=sUser.getUsername() %></td>
		</tr>
		<tr>
			<td>Mã nhân viên</td>
			<td><%=u.getEmployeeID() %></td>
		</tr>
		<tr>
			<td>Tên nhân viên</td>
			<td><%=u.getEmployeeName() %></td>
		</tr>
		<tr>
			<td>Giới tính</td>
			<%if(u.getGender()==1){%>
				<td>Nam</td>	
			<%}else if(u.getGender()==0){%>
				<td>Nữ</td>
			<%} %>
		</tr>
		<tr>
			<td>Ngày sinh</td>
			<td><%=u.getBirthday() %></td>
		</tr>
		<tr>
			<td>Số điện thoại</td>
			<td><%=u.getPhone() %></td>
		</tr>
		<tr>
			<td>Địa chỉ</td>
			<td><%=u.getAddress() %></td>
		</tr>
	</table>
	<div style="margin-left: 300px;">
		<a href="<%=request.getContextPath()%>/employee-management"><input type="button" value="Chỉnh sửa" name="submit" class="btn btn-default btn-primary"/></a>
		<a href="<%=request.getContextPath()%>/info-user"><input style="font-style: normal;"
				type="button" name="quit" class="btn btn-default btn-primary"
				value="Thoát" /> </a><br/>
		<span><a  style="margin-top: 10px;" href="<%=request.getContextPath()%>/change-pass">Thay đổi mật khấu ?</a></span>
	</div>
	</div>
</body>
</html>