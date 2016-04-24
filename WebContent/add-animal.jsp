<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thêm động vật</title>
</head>
<body>
  <form method="POST" action="<%=request.getContextPath()%>/AddAnimalServlet">
  <fieldset>
    <legend>Thêm động vật</legend>
      <table id="animal-info" style="width:100%; border: 1px">
        <tr>
          <td>Loài</td>
          <td><select class="select-species" name="select-species">
              <option value="0">Thú</option>
              <option value="1">Lưỡng cư</option>
              <option value="2">Chim</option>
              <option value="3">Bò sát</option>
          </select>(*)</td>
        </tr>
        <tr>
          <td>Mã động vật</td>
          <td><input type="text" name="txt_animal_id"></input>(*)</td>
        </tr>
        <tr>
          <td>Tên động vật</td>
          <td><input type="text" name="txt_animal_name"></input>(*)</td>
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
      <input type="button" name="erase" value="Xóa hết">
      <input type="submit" name="add" value="Thêm">
      <input type="button" name="cancel" value="Hủy">
  </fieldset>
  </form>
</body>
</html>
