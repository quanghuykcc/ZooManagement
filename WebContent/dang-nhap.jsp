<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@include file="/inc/header.jsp" %>
  <title>Đăng nhập</title>
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
							required: "<p style='color:red;'>Không được bỏ trống</p>",
						},
					}
				});
			});
			</script>
  <form method="POST" action="<%=request.getContextPath()%>/checklogin" id="frm-login">
  <legend style="text-align: center;">Thông tin đăng nhập</legend>
    <label for="inputEmail" class="sr-only">Email address</label>
        <input style="margin-top: 10px;" type="text" id="inputEmail" class="form-control" placeholder="Email address" name="username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input style="margin-bottom: 10px;" type="password" id="inputPassword" class="form-control" placeholder="Password" name = "password" required>
   <br>
    <a href="#">Quên mật khẩu</a><br>
    <button style="margin-top: 10px;" class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Sign in</button>
    <%
			String mgs = request.getParameter("msg");
			if("0".equals(mgs)){
		%>
		<p style="color:red;">Sai username hoặc password</p>
		<%}%>
  </form>
</body>
</html>