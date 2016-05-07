<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/inc/header.jsp" %>
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
  <legend style="text-align: center;">Đổi mật khẩu</legend>
    Tên đăng nhập:<br>
    <div class="form-group">
    <label>Mật khẩu cũ:</label>
    <input class="form-control" type="password" name="old_password">
    </div>
    <div class="form-group">
    <label>Mật khẩu mới:</label>
    <input class="form-control" type="password" name="new_password" id="new_password">
    </div>
    <div class="form-group">
    <label>Xác nhận mật khẩu:</label>
    <input class="form-control" type="password" name="comfirm_password">
    </div>
    <input type="submit" value="Đăng nhập" name="submit" class="btn btn-default btn-primary">
    </fieldset>
    </form>
</body>
</html>