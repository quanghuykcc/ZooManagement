<%@page import="dao.CellDAO"%>
<%@page import="dao.RegionDAO"%>
<%@page import="dao.SpeciesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cell, model.Region, model.Species"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/inc/header.jsp" %>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/add_animal.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/add_animal.css">
<meta charset="UTF-8">
<title>Thêm động vật</title>
<style>
	.medium{
		width: 350px;
	}
</style>
</head>
<body style="margin-left:450px;">
	<div id="add-animal-form">
		<form method="POST" action="AddAnimalServlet" id="frm-add-animal">
			<fieldset>
				<legend style="text-align: center;">Thêm động vật</legend>
				<table id="animal-info" style="border: 1px">
					<tr>
						<td><label for="select-species">Loài (*)</label></td>
						<td><select id="species_id" name="species_id"
							class="form-control">
								<%
                                    ArrayList<Species> speciesList = SpeciesDAO.getAllSpecies();
                                    for (Species species : speciesList) {
                                %>
								<option value=<%=species.getSpeciesID()%>>
									<%=species.getSpeciesName()%>
								</option>
								<%
                                    }  %>

						</select></td>
					</tr>
					<tr>
						<td><label for="animal-id">Mã động vật (*)</label></td>
						<td><input type="text" class="form-control medium" id="animal_id"
							name="animal_id"></td>
					</tr>
					<tr>
						<td><label for="animal-name">Tên động vật (*)</label></td>
						<td><input type="text" class="form-control medium" id="animal_name"
							name="animal_name"></td>
					</tr>
					<tr>
						<td><label for="gender">Giới tính (*)</label></td>
						<td><input type="radio" name="gender" id="gender" value="female">Con cái
							<input type="radio" name="gender" id="gender" value="male">Con đực
					</tr>
					<tr>
						<td><label for="weight">Cân nặng</label></td>
						<td><input type="text" id="weight" name="weight"
							class="form-control medium"></td>
					</tr>
					<tr>
						<td><label for="height">Chiều cao</label></td>
						<td><input type="text" id="height" name="height"
							class="form-control medium"></td>
					</tr>
					<tr>
						<td><label for="health_status">Sức khỏe</label></td>
						<td><input type="text" name="health_status"
							class="form-control medium" id="health_status"></td>
					</tr>
					<tr>
						<td><label for="description">Mô tả</label></td>
						<td><textarea id="description" class="form-control medium" rows="3"
								cols="30" name="description"></textarea></td>
					</tr>
					<tr>
						<td><label for="region-id">Mã khu vực (*)</label></td>
						<td><select id="region_id" class="form-control"
							name="region_id">
								<%  
                                    ArrayList<Region> regionList = RegionDAO.getAllRegions();
                                    for (Region region : regionList) { %>
								<option value=<%=region.getRegionID()%>><%=region.getRegionID()%></option>
								<%
                                    }
                                %>
						</select></td>
					</tr>
					<tr>
						<td><label for="select-cell">Mã chuồng</label></td>
						<td><select id="cell_id" class="form-control" name="cell_id">
								<%  
                                    ArrayList<Cell> cellList = CellDAO.getAllCells();
                                    for (Cell cell : cellList) {
                                        out.println("<option value=\"" + cell.getCellID() + "\">"+ cell.getCellID() + "</option>");
                                    }
                                %>
						</select></td>
					</tr>
				</table>
				<input type="button" class="btn btn-default btn-primary" name="erase"
					value="Xóa hết"> <input type="submit"
					class="btn btn-default btn-primary" name="submit" value="Thêm"> <a
					href=<%=request.getContextPath() + "/animal-management"%>>
					<input
					type="button" class="btn btn-default btn-primary" name="cancel" value="Hủy" ></a>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							jQuery.validator.setDefaults({
								success : "valid"
							});
							$("#frm-add-animal")
									.validate(
											{
												ignore : [],
												debug : false,
												rules : {
													animal_id : {
														required : true,
														maxlength: 10,
													},
													animal_name : {
														required : true,
														maxlength: 30,
													},
													gender: {
														required: true,
													},
												},
												messages : {
													animal_id : {
														required : "<span style='color:red;'>Vui lòng nhập mã động vật</span>",
														maxlength : "<span style='color:red;'>Mã động vật không thể hơn 10 ký tự</span>",
													},
													animal_name : {
														required : "<span style='color:red;'>Vui lòng nhập tên động vật</span>",
														maxlength : "<span style='color:red;'>Tên động vật không thể hơn 30 ký tự</span>",
													},
													gender: {
														required : "<p style='color:red;'>Vui lòng chọn giới tính</p>",
													}
												}
											});
						});
	</script>
</body>
</html>
