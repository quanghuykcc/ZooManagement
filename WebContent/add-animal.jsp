<%@page import="model.Cell"%>
<%@page import="model.Region"%>
<%@page import="model.Species"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <meta charset="UTF-8">
  <title>Thêm động vật</title>
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js" ></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery.validate.js" ></script>
</head>
<body>
  <form method="POST" action="<%=request.getContextPath()%>/AddAnimalServlet">
    <fieldset>
      <legend>Thêm động vật</legend>
        <table id="animal-info" style="width:100%; border: 1px">
          <tr>
            <td><label for="select-species">Loài</label></td>
            <td><select id="select-species" name="species_id" class="form-control">
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
            <td><input type="text" class="form-control" id="animal-id" name="animal_id"></input>(*)</td>
          </tr>
          <tr>
            <td><label for="animal-name">Tên động vật</label></td>
            <td><input type="text" class="form-control" id="animal-name" name="animal_name"></input>(*)</td>
          </tr>
          <tr>
            <td><label for="sex"></label>Giới tính</td>
            <td><input type="checkbox" id="sex" name="gender" value="1" class="form-control"></input>Cái (*)</td>
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
            <td><input type="text" name="health_status" class="form-control"></td>
          </tr>
          <tr>
            <td><label for="desc">Mô tả</label></td>
            <td><textarea id="desc" class="form-control" rows="3" cols="30" name="description"></textarea></td>
          </tr>
          <tr>
            <td><label for="select-region"></label>Mã khu vực</td>
            <td><select id="select-region" class="form-control" name="region_id">
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
            <td><select id="select-cell" class="form-control" name="cell_id">
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
      <input type="button" class="btn btn-default btn-primary" name="erase" value="Xóa hết">
      <input type="submit" class="btn btn-default btn-primary" name="submit" value="Thêm">
      <input type="button" class="btn btn-default btn-primary" name="cancel" value="Hủy">
  </fieldset>
  </form>
  <script type="text/javascript">
			$(document).ready(function(){
				jQuery.validator.setDefaults({
					  success: "valid"
				});
				$("#frm-changepass").validate({
					ignore : [],
					debug : false,
					rules: {
						animal_id: {
							required: true,
						},
						animal_name: {
							required: true,
							minlength: 6,
						},
						weight: {
							required: true,
							
						},
						height: {
							required: true,
							
						},
						health_status: {
							required: true,
							
						},
						description: {
							required: true,
							
						},
					},
					messages: {
						animal_id: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
						animal_name: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
						weight: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
						height: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
						health_status: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
						description: {
							required: "<span style='color:red;'>Không được bỏ trống</span>",
						},
					}
				});
			});
			</script>
</body>
</html>
