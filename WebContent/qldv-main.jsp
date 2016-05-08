<%@page import="model.Animal"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js" ></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery.validate.js" ></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
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
    <div id="navitication" class="col-md-3">
      <ul>
        <li><a href="#">Quản lý động vật</a>
          <ul>
            <li><a href="#">Khu vực</a></li>
            <li><a href="<%=request.getContextPath()%>/animal-management">Chuồng</a></li>
            <li><a href=<%=request.getContextPath() + "/animal-management" %>>Động vật</a></li>
          </ul>
        </li>
        <li><a href="<%=request.getContextPath()%>/info-user">Quản lý nhân viên</a>
        </li>
        <li><a href="#">Quản lý thức ăn</a>
        </li>
        <li><a href="#">Quản lý vé</a></li>
      </ul>
    </div>
    <div id="animal-filter" class="col-md-8">
      <div id="filter">
        <div id="form-filter">
        <form class="form-inline" role="form" action=<%=request.getContextPath() + "/search" %> method="post">
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
                <input type="text" name="animal_id" class="form-control">
                <input type="submit" class="btn btn-info" name="search" value="Tìm kiếm"></input>
            </div>
        </form>
        </div>
        <div id="add-btn">
        	<a href=<%=request.getContextPath() + "/add-animal" %>>
        		<input type="button" class="btn btn-info" name="add" value="Thêm động vật" onClick=""></input>
        	</a>
        </div>
      </div>
      <br>
      <table id="animal-info" class="table table-striped table-responsive" style="width: 100%">
        <tr>
          <th>Mã ĐV</th>
          <th>Tên động vật</th>
          <th>Loài</th>
          <th>Khu vực</th>
          <th>Chuồng</th>
          <th>Sức khỏe</th>
          <th></th>
        </tr>
        <%
        	ArrayList<Animal> animalList = (ArrayList<Animal>) request.getAttribute("animal_list");
        	for (Animal animal : animalList) {
        %>
        <tr>
          <td><%=animal.getAnimalID()%></td>
          <td><%=animal.getAnimalName()%></td>
          <td><%=animal.getSpecies().getSpeciesName()%></td>
          <td><%=animal.getRegionID()%></td>
          <td><%=animal.getCellID()%></td>
          <td><%=animal.getHealthStatus()%></td>
          <td><a href=<%=request.getContextPath() + "/UpdateAnimal?animal_id=" + animal.getAnimalID() %>><button class="btn btn-info">Cập nhật</button></a></td>
        </tr>
        <%
        	}
        %>
      </table>
    </div>
  </div>
</body>
</html>
