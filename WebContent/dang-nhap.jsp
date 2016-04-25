<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js" ></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery.validate.js" ></script>
  <title></title>
  <style type="text/css">
  body{
    width: 400px;
    margin: 20px auto;
  }
  input{
  	margin-top: 10px;
  }
  </style>
</head>
<body>
  <h3 style="text-align: center;">CHƯƠNG TRÌNH QUẢN LÝ SỞ THÚ</h3>
   <script type="text/javascript">
			$(document).ready(function(){
				jQuery.validator.setDefaults({
					  success: "valid"
				});
				$("#frm-login").validate({
					ignore : [],
					debug : false,
					rules: {
						username: {
							required: true,
						},
						password: {
							required: true,
	
						},
					},
					messages: {
						username: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
						password: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
					}
				});
			});
			</script>
  <form method="POST" action="<%=request.getContextPath()%>/checklogin" id="frm-login">
  <fieldset>
  <legend>Thông tin đăng nhập</legend>
    Tên đăng nhập:<br>
    <input type="text" name="username"><br>
    Mật khẩu:<br>
    <input type="password" name="password"><br>
    <a href="#">Quên mật khẩu</a><br>
    <input type="submit" value="Đăng nhập" name="submit">
    <input type="button" value="Đăng kí">
    <%
			String mgs = request.getParameter("msg");
			if("0".equals(mgs)){
		%>
		<p style="color:red;">Sai username hoặc password</p>
		<%}%>
    </fieldset>
  </form>
</body>
</html>