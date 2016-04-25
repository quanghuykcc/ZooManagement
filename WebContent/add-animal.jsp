<%@page import="model.Cell"%>
<%@page import="model.Region"%>
<%@page import="model.Species"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js" ></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery.validate.js" ></script>
  
  <script type="text/javascript">
			$(document).ready(function(){
				jQuery.validator.setDefaults({
					  success: "valid"
				});
				$("#frm-add-animal").validate({
					ignore : [],
					debug : false,
					rules: {
						animal_id: {
							required: true,
							maxlength: 10,
						},
						animal_name: {
							maxlength: 30,
						},
						
						species_id: {
							required: true,
							maxlength: 10,
						},
						
						weight: {
						},
						height: {
						},
						health_status: {
							maxlength: 30
						},
						description: {
							maxlength: 1000
						},
						cell_id: {
							required: true,
							maxlength: 10
						},
					},
					messages: {
						
						animal_id: {
							required: "<span style='color:red;'>Cần phải nhập mã động vật</span>",
							maxlength: "<span style='color:red;'>Mã động vật tối đa là 10 ký tự</span>",
						},
						animal_name: {
							maxlength: "<span style='color:red;'>Tên động vật tối đa là 30 ký tự</span>",
						},
						
						species_id: {
							required: "<span style='color:red;'>Cần phải chọn loài cho động vật</span>",
							maxlength: "<span style='color:red;'>Mã loài tối đa là 10 ký tự</span>",
						},
						
						weight: {
						},
						height: {
						},
						health_status: {
							maxlength: "<span style='color:red;'>Tình trạng sức khỏe tối đa là 30 ký tự</span>",
						},
						description: {
							maxlength: "<span style='color:red;'>Mô tả tối đa là 1000 ký tự</span>",
						},
						cell_id: {
							required: "<span style='color:red;'>Cần phải chọn chuồng cho động vật</span>",
							maxlength: "<span style='color:red;'>Mã chuồng tối đa là 10 ký tự</span>",
						},
					}
				});
			});
	</script>
  
  <meta charset="UTF-8">
  <title>Thêm động vật</title>
</head>
<body>
  <form method="POST" action="<%=request.getContextPath()%>/AddAnimalServlet" id="frm-add-animal">
    <fieldset>
      <legend>Thêm động vật</legend>
        <table id="animal-info" style="width:100%; border: 1px">
          <tr>
            <td><label for="select-species">Loài</label></td>
            <td><select id="species_id" name="species_id" class="form-control">
            <%
            	ArrayList<Species> speciesList = (ArrayList<Species>) request.getAttribute("species_list");
            	for (Species species : speciesList) {
            %>
            		<option value=<%=species.getSpeciesID() %>>
            			<%=species.getSpeciesName()%>
            		</option>
            <%	
            	}
            		
            %>
                
               
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="animal-id">Mã động vật</label></td>
            <td><input type="text" class="form-control" id="animal_id" name="animal_id"></input>(*)</td>
          </tr>
          <tr>
            <td><label for="animal-name">Tên động vật</label></td>
            <td><input type="text" class="form-control" id="animal_name" name="animal_name"></input>(*)</td>
          </tr>
          <tr>
            <td><label for="sex"></label>Giới tính</td>
            <td><input type="checkbox" id="gender" name="gender" class="form-control"></input>Cái (*)</td>
          </tr>
          <tr>
            <td><label for="weight"></label>Cân nặng</td>
            <td><input type="number" id="weight" name="weight" class="form-control"></input></td>
          </tr>
          <tr>
            <td><label for="height"></label>Chiều cao</td>
            <td><input type="number" id="height" name="height" class="form-control"></input></td>
          </tr>
          <tr>
            <td><label for="select-helth">Sức khỏe</label></td>
            <td><input type="text" name="health_status" class="form-control" id="health_status"></td>
          </tr>
          <tr>
            <td><label for="desc">Mô tả</label></td>
            <td><textarea id="description" class="form-control" rows="3" cols="30" name="description"></textarea></td>
          </tr>
          <tr>
            <td><label for="select-region"></label>Mã khu vực</td>
            <td><select id="region_id" class="form-control" name="region_id">
            	<%
	            	ArrayList<Region> regionList = (ArrayList<Region>) request.getAttribute("region_list");
	            	for (Region region : regionList) {
	            %>
	            		<option value=<%=region.getRegionID()%>>
	            			<%=region.getRegionID()%>
	            		</option>
	            <%	
	            	}
	            		
	            %>
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="select-cell">Mã chuồng</label></td>
            <td><select id="cell_id" class="form-control" name="cell_id">
                <%
	            	ArrayList<Cell> cellList = (ArrayList<Cell>) request.getAttribute("cell_list");
	            	for (Cell cell : cellList) {
	            %>
	            		<option value=<%=cell.getCellID()%>>
	            			<%=cell.getCellID()%>
	            		</option>
	            <%	
	            	}
	            		
	            %>
            </select></td>
          </tr>
        </table>
      <input type="button" class="btn btn-default" name="erase" value="Xóa hết">
      <input type="submit" class="btn btn-default" name="submit" value="Thêm">
      <a href=<%=request.getContextPath() + "/animal-management" %>><input type="button" class="btn btn-default" name="cancel" value="Hủy"></a>
  </fieldset>
  </form>
</body>
</html>
