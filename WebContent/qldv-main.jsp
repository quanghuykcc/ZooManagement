<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <style>
    table, th, td {
      border: 1px solid black;
      border-collapse: collapse;
    }
    table {
        margin-top: 20px;
        margin-bottom: 20px;
    }
    #form-filter {
        float: left;
    }
    #add-btn {
        float: right;
    }
  </style>
  <title>Quản lý động vật</title>
</head>
<body>
  <div>
    <div id="head-navi-bar">

      <div><h2>TRANG CHỦ > QUẢN LÝ ĐỘNG VẬT > ĐỘNG VẬT</h2></div>
      <div>

      </div>
    </div>
    <div id="navitication" class="col-md-4">
      <ul>
        <li><a href="">Quản lý động vật</a>
          <ul>
            <li><a href="">Khu vực</a></li>
            <li><a href="">Chuồng</a></li>
            <li><a href="">Động vật</a></li>
          </ul>
        </li>
        <li><a href="">Quản lý nhân viên</a>
        </li>
        <li><a href="">Quản lý thức ăn</a>
        </li>
        <li><a href="">Quản lý vé</a></li>
      </ul>
    </div>
    <div id="animal-filter" class="col-md-8">
      <div id="filter">
        <div id="form-filter">
        <form class="form-inline" role="form" action="index.html" method="post">
            <div class="from-group">
                <select name="region" class="form-control">
                  <option disabled="disable">Chọn khu vực</option>
                  <option>A</option>
                </select>
                <select name="cell" class="form-control">
                  <option disabled="disable" selected="selected">Chọn chuồng</option>
                </select>
                <select name="species" class="form-control">
                  <option disabled="disable" selected="selected">Chọn loài</option>
                </select>
                <input type="text" name="animal-name" class="form-control">
                <input type="button" class="btn btn-default" name="search" value="Search"></input>
            </div>
        </form>
        </div>
        <div id="add-btn"><input type="button" class="btn btn-default" name="add" value="Add"></input></div>
      </div>
      <br>
      <table id="animal-info" class="table-bordered" style="width: 100%">
        <tr>
          <th>Mã ĐV</th>
          <th>Tên động vật</th>
          <th>Loài</th>
          <th>Khu vực</th>
          <th>Chuồng</th>
          <th>Sức khỏe</th>
        </tr>
        <tr>
          <td>Jill</td>
          <td>Smith</td>
          <td>50</td>
          <td>KV01</td>
          <td>C002</td>
          <td>Good</td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>