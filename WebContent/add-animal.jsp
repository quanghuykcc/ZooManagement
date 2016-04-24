<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <meta charset="UTF-8">
  <title>Thêm động vật</title>
</head>
<body>
  <form method="POST" action="<%=request.getContextPath()%>/AddAnimalServlet">
    <fieldset>
      <legend>Thêm động vật</legend>
        <table id="animal-info" style="width:100%; border: 1px">
          <tr>
            <td><label for="select-species">Loài</label></td>
            <td><select id="select-species" name="select-species" class="form-control">
                <option value="thu">Thú</option>
                <option value="luong-cu">Lưỡng cư</option>
                <option value="chim">Chim</option>
                <option value="bo-sat">Bò sát</option>
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="animal-id">Mã động vật</label></td>
            <td><input type="text" class="form-control" id="animal-id"></input>(*)</td>
          </tr>
          <tr>
            <td><label for="animal-name">Tên động vật</label></td>
            <td><input type="text" class="form-control" id="animal-name"></input>(*)</td>
          </tr>
          <tr>
            <td><label for="sex"></label>Giới tính</td>
            <td><input type="checkbox" id="sex" name="sex" value="1" class="form-control"></input>Cái (*)</td>
          </tr>
          <tr>
            <td><label for="weight"></label>Cân nặng</td>
            <td><input type="text" id="weight" name="weight" class="form-control"></input></td>
          </tr>
          <tr>
            <td><label for="height"></label>Chiều cao</td>
            <td><input type="text" id="height" name="height" class="form-control"></input></td>
          </tr>
          <tr>
            <td><label for="select-helth">Sức khỏe</label></td>
            <td><select id="select-health" name="select-health" class="form-control">
                <option value="khoe-manh">Khỏe mạnh</option>
                <option value="om">Ốm</option>
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="desc">Mô tả</label></td>
            <td><textarea id="desc" class="form-control" rows="3" cols="30"></textarea></td>
          </tr>
          <tr>
            <td><label for="select-region"></label>Mã khu vực</td>
            <td><select id="select-region" class="form-control" name="select-region">
                <option value="a">A</option>
                <option value="b">B</option>
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="select-cell">Mã chuồng</label></td>
            <td><select id="select-cell" class="form-control" name="select-cell">
                <option value="a1">A1</option>
                <option value="a2">A2</option>
            </select></td>
          </tr>
        </table>
      <input type="button" class="btn btn-default" name="erase" value="Xóa hết">
      <input type="button" class="btn btn-default" name="add" value="Thêm">
      <input type="button" class="btn btn-default" name="cancel" value="Hủy">
  </fieldset>
  </form>
</body>
</html>
