<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js" ></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery.validate.js" ></script>
<title>Change Pass User</title>
<style type="text/css">
	input{
		margin-top: 10px;
	}
	body {
		width: 400px;
		height: 500px;
		margin: auto;
}
</style>
</head>
<body>
	 <script type="text/javascript">
			$(document).ready(function(){
				jQuery.validator.setDefaults({
					  success: "valid"
				});
				$("#frm-changepass").validate({
					ignore : [],
					debug : false,
					rules: {
						old_password: {
							required: true,
						},
						new_password: {
							required: true,
							minlength: 6,
						},
						comfirm_password: {
							required: true,
							equalTo: "#new_password",
							
						},
					},
					messages: {
						old_password: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
						new_password: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
							minlength: "<span style='color:red;'>Mật khẩu quá ngắn (phải >5 kí tự)</span>",
						},
						comfirm_password: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
							equalTo: "<span style='color:red;'>Xác nhận mật khẩu không đúng</span>",
						},
					}
				});
			});
			</script>
  <form method="POST" action="<%=request.getContextPath()%>/change-pass" id="frm-changepass">
  <fieldset>
  <legend>Đổi mật khẩu</legend>
    Tên đăng nhập:<br>
    Mật khẩu cũ:<br>
    <input type="password" name="old_password"><br>
    Mật khẩu mới:<br>
    <input type="password" name="new_password" id="new_password"><br>
    Xác nhận mật khẩu:<br>
    <input type="password" name="comfirm_password"><br>
    <input type="submit" value="Đăng nhập" name="submit">
    </fieldset>
    </form>
</body>
</html>