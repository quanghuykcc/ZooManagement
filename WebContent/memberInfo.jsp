<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
<title>Thông tin cá nhân</title>
<style>
	table{
	margin-left: 300px;
	}
</style>
</head>
<body >
	<div class="col-md-7" >
	<label style="margin-left: 560px; margin-top: 20px; font-size: 20px;">Thông tin nhân viên</label>
	<table class="table table-bordered">
		<tr>
			<td>Tên đăng nhập</td>
			<td>vietnhut</td>
		</tr>
		<tr>
			<td>Mã nhân viên</td>
			<td>AA0123</td>
		</tr>
		<tr>
			<td>Tên nhân viên</td>
			<td>Lê Viết Nhựt</td>
		</tr>
		<tr>
			<td>Giới tính</td>
			<td>Nam</td>
		</tr>
		<tr>
			<td>Ngày sinh</td>
			<td>6/10/1994</td>
		</tr>
		<tr>
			<td>Số điện thoại</td>
			<td>01687184516</td>
		</tr>
		<tr>
			<td>Địa chỉ</td>
			<td>Tam Đàn Phú Ninh Quảng Nam</td>
		</tr>
	</table>
	<div style="margin-left: 300px;">
		<a href="<%=request.getContextPath()%>/employee-management"><input type="submit" value="Chỉnh sửa" name="submit" class="btn btn-default btn-primary"/></a><br/>
		<span><a href="<%=request.getContextPath()%>/change-pass">Thay đổi mật khấu ?</a></span>
	</div>
	</div>
</body>
</html>