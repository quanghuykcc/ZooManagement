<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Quản lý nhân viên</title>
<style>
	body{
		width:400px;
		height: 500px;
		margin: auto;
	}
	input{
		margin-top: 10px;
	}
	a{
		text-decoration: none;
		font-style: italic;
		margin-left: 20px;
	}
	a:hover{
		text-decoration: underline;
	}
	span{
		margin-left: 10px;
	}
</style>
</head>
<body>
	<%
		User user =(User) session.getAttribute("sUser");
		if(user!=null){
	%>
	<form action="<%=request.getContextPath()%>/employee-management" method="POST">
	<fieldset>
	<legend style='color:'>Thông tin nhân viên</legend>
		Tên đăng nhập: <span style="font-weight: bold;color:blue;"> <%=user.getUsername() %></span><br/>
		Quyền quản trị:	<span style="font-weight: bold;color:blue;"> <%=user.getUserTypeName()%></span>	<br/>
		Tên nhân viên<br>
		<input type="text" name="employeename" value="<%=user.getEmployeeName()%>"><br/>
		Giới tính<br/>
		<%if(user.getGender()==1){ %>
		<input type="radio" name="gender" checked="checked" value="Nam">Nam
		<input type="radio" name="gender" value="Nữ">Nữ<br/>
		<%}else{%>
		<input type="radio" name="gender" value="Nam">Nam
		<input type="radio" name="gender" checked="checked" value="Nữ">Nữ<br/>
		<%} %>
		Ngày sinh<br/>
		<input type="text" name="birthday" value="<%=user.getBirthday()%>"><br/>
		Số điện thoại<br/>
		<input type="number" name="phone" value="<%=user.getPhone()%>"><br/>
		Địa chỉ<br/>
		<textarea rows="3" cols="40" name="address"><%=user.getAddress()%></textarea><br/>
		<input type="submit" name="submit" value="Cập nhật">
		<input type="button" name="quit" value="Thoát"/>
		<span ><a href="<%=request.getContextPath()%>/change-pass">Thay đổi mật khấu ?</a></span>
		</fieldset>
	</form>
	<%} %>
</body>
</html>