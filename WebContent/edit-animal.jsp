<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Chỉnh sửa động vật</title>
</head>
<body>
  <form method="POST">
  <fieldset>
    <legend>Cập nhật động vật</legend>
      <table id="animal-info" style="width:100%; border: 1px">
        <tr>
          <td>Loài</td>
          <td><select class="select-species" name="select-species">
              <option value="thu">Thú</option>
              <option value="luong-cu">Lưỡng cư</option>
              <option value="chim">Chim</option>
              <option value="bo-sat">Bò sát</option>
          </select>(*)</td>
        </tr>
        <tr>
          <td>Mã động vật</td>
          <td><input type="text"></input>(*)</td>
        </tr>
        <tr>
          <td>Tên động vật</td>
          <td><input type="text"></input>(*)</td>
        </tr>
        <tr>
          <td>Giới tính</td>
          <td><input type="checkbox" name="sex" value="1"></input>Cái (*)</td>
        </tr>
        <tr>
          <td>Sức khỏe</td>
          <td><select class="select-health" name="select-health">
              <option value="khoe-manh">Khỏe mạnh</option>
              <option value="om">Ốm</option>
          </select>(*)</td>
        </tr>
        <tr>
          <td>Mô tả</td>
          <td><textarea rows="3" cols="30"></textarea></td>
        </tr>
        <tr>
          <td>Mã khu vực</td>
          <td><select class="select-region" name="select-region">
              <option value="a">A</option>
              <option value="b">B</option>
          </select>(*)</td>
        </tr>
        <tr>
          <td>Mã chuồng</td>
          <td><select class="select-cell" name="select-cell">
              <option value="a1">A1</option>
              <option value="a2">A2</option>
          </select></td>
        </tr>
      </table>
      <input type="button" name="delete" value="Xóa động vật">
      <input type="button" name="save" value="Lưu">
      <input type="button" name="cancel" value="Hủy">
  </fieldset>
  </form>
</body>
</html>
