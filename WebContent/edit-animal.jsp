<%@page import="model.Animal"%>
<%@page import="model.Cell"%>
<%@page import="model.Region"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Species"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/inc/header.jsp"%>
<title>Chỉnh sửa động vật</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/lib/jquery.validate.js"></script>
	<script type="text/javascript">
	$(document).ready(
		function() {
			 
		}
	);
	
	</script>
<style>
body {
	width: 700px;
	margin: auto;
}

.medium {
	width: 400px;
}

.bt {
	margin-left: 150px;
}
</style>
</head>
<body>
	<form method="POST">
		<fieldset>
			<legend style="text-align: center;">Chỉnh sửa động vật</legend>
			
			<% 
				Animal animal = (Animal) request.getAttribute("animal");
			%>
			
			<table id="animal-info" style="width: 100%; border: 1px">
				<tr>
					<td><label for="select-species">Loài</label></td>
					<td><select id="select-species" name="select-species"
						class="form-control medium ">
							<%
								ArrayList<Species> speciesList = (ArrayList<Species>) request.getAttribute("species_list");
								for (Species species : speciesList) {
									if (species.getSpeciesID().equals(animal.getSpeciesID())) {
									
							%>
							<option value=<%=species.getSpeciesID()%> selected><%=species.getSpeciesName()%></option>
							<%
								}
							else {
							%>
								<option value=<%=species.getSpeciesID()%>><%=species.getSpeciesName()%></option>
							<%
							}
								}
							%>
					</select>(*)</td>
				</tr>
				<tr>
					<td><label for="animal-id">Mã động vật</label></td>
					<td><input style="margin-top: 10px;"
						class="form-control medium" type="text" class="form-control"
						id="animal-id" name="animal-id" value=<%=animal.getAnimalID()%> ></input>(*)</td>
				</tr>
				<tr>
					<td><label for="animal-name">Tên động vật</label></td>
					<td><input class="form-control medium" type="text"
						class="form-control" id="animal-name" name="animal-name" value=<%=animal.getAnimalName() %>></input>(*)</td>
				</tr>
				<tr>
					<td><label for="gender">Giới tính</label></td>
					<td>
						<input type="radio" name="gender" value="male">Con cái 
						<input type="radio" name="gender" value="female">Con đực
					</td>
				</tr>
				<tr>
					<td><label for="weight"></label>Cân nặng</td>
					<td><input style="margin-top: 10px;"
						class="form-control medium" type="text" id="weight" name="weight"
						class="form-control" value=<%=animal.getWeight() %>></input></td>
				</tr>
				<tr>
					<td><label for="height"></label>Chiều cao</td>
					<td><input style="margin-top: 10px;"
						class="form-control medium" type="text" id="height" name="height"
						class="form-control" value=<%=animal.getHeight() %>></input></td>
				</tr>
				<tr>
					<td><label for="select-helth">Sức khỏe</label></td>
					<td><input type="text" class="form-control medium" name="health_status" value=<%=animal.getHealthStatus() %>></td>
				</tr>
				<tr>
					<td><label for="desc">Mô tả</label></td>
					<td><textarea id="desc" class="form-control medium" rows="3"
							cols="30" name="description" value=<%=animal.getDescription() %>></textarea></td>
				</tr>
				<tr>
					<td><label for="select-region"></label>Mã khu vực</td>
					<td><select style="margin-top: 10px;"
						class="form-control medium" name="region">
							<%
								ArrayList<Region> regionList = (ArrayList<Region>) request.getAttribute("region_list");
								for (Region region : regionList) {
									if (region.getRegionID().equals(animal.getRegionID())) {
								
							%>
							<option value=<%=region.getRegionID()%> selected><%=region.getRegionName() %></option>
							<%
									}
									else {
										%>
								<option value=<%=region.getRegionID()%>"><%=region.getRegionName() %></option>		
							<%
									}
								}
							%>
					</select>(*)</td>
				</tr>
				<tr>
					<td><label for="select-cell">Mã chuồng</label></td>
					<td><select style="margin-top: 10px;"
						class="form-control medium" name="cell_id">
							<%
							ArrayList<Cell> cellList = (ArrayList<Cell>) request.getAttribute("cell_list");
							for (Cell cell : cellList) {
								if (cell.getCellID().equals(animal.getCellID())) {
						%>
							<option value=<%=cell.getCellID() %> selected><%=cell.getCellID()%></option>

							<%
							}
								else {
									%>
									<option value=<%=cell.getCellID() %>><%=cell.getCellID()%></option>
									<%
								}
								}
						%>
					</select></td>
				</tr>
			</table>
			<div class="bt">
				<input style="margin-top: 10px;" type="button"
					class="btn btn-default btn-primary" name="delete"
					value="Xóa động vật"> <input style="margin-top: 10px;"
					type="button" class="btn btn-default btn-primary" name="save"
					value="Lưu"> <input style="margin-top: 10px;" type="button"
					class="btn btn-default btn-primary" name="cancel" value="Hủy">
			</div>
		</fieldset>
	</form>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							jQuery.validator.setDefaults({
								success : "valid"
							});
							$("#frm-changepass")
									.validate(
											{
												ignore : [],
												debug : false,
												rules : {
													animal_id : {
														required : true,
													},
													animal_name : {
														required : true,
														minlength : 6,
													},
													weight : {
														required : true,

													},
													height : {
														required : true,

													},
													health_status : {
														required : true,

													},
													description : {
														required : true,

													},
												},
												messages : {
													animal_id : {
														required : "<span style='color:red;'>Không được bỏ trống</span>",
													},
													animal_name : {
														required : "<span style='color:red;'>Không được bỏ trống</span>",
													},
													weight : {
														required : "<span style='color:red;'>Không được bỏ trống</span>",
													},
													height : {
														required : "<span style='color:red;'>Không được bỏ trống</span>",
													},
													health_status : {
														required : "<span style='color:red;'>Không được bỏ trống</span>",
													},
													description : {
														required : "<span style='color:red;'>Không được bỏ trống</span>",
													},
												}
											});
						});
	</script>
</body>
</html>
