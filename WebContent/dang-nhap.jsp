<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
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
  <form method="POST">
  <fieldset>
  <legend>Thông tin đăng nhập</legend>
    Tên đăng nhập:<br>
    <input type="text" name="username"><br>
    Mật khẩu:<br>
    <input type="password" name="password"><br>
    <a href="#">Quên mật khẩu</a><br>
    <input type="submit" value="Đăng nhập">
    <input type="submit" value="Đăng kí">
    </fieldset>
  </form>
</body>
</html>