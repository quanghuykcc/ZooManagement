<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/header.jsp" %>
  <title>Chỉnh sửa động vật</title>
   <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js" ></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery.validate.js" ></script>
	<style>
		body{
			width:700px;
			margin: auto;
		}
		.medium{
			width: 400px;
		}
		.bt{
			margin-left: 150px;
		}
	</style>
</head>
<body>
    <form method="POST">
    <fieldset>
      <legend style="text-align: center;">Thêm động vật</legend>
        <table id="animal-info" style="width:100%; border: 1px">
          <tr>
            <td><label for="select-species">Loài</label></td>
            <td><select id="select-species" name="select-species" class="form-control medium ">
                <option value="thu">Thú</option>
                <option value="luong-cu">Lưỡng cư</option>
                <option value="chim">Chim</option>
                <option value="bo-sat">Bò sát</option>
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="animal-id">Mã động vật</label></td>
            <td><input style="margin-top: 10px;" class="form-control medium" type="text" class="form-control" id="animal-id" name="animal-id"></input>(*)</td>
          </tr>
          <tr>
            <td><label for="animal-name">Tên động vật</label></td>
            <td><input  class="form-control medium" type="text" class="form-control" id="animal-name" name="animal-name"></input>(*)</td>
          </tr>
          <tr>
				<td><label for="gender">Giới tính</label></td>
				<td>
				<input type="radio" name="gender" checked="checked" value="Nam">Nam
				<input type="radio" name="gender" value="Nữ">Nữ
				</td>
          </tr>
          <tr>
            <td><label for="weight"></label>Cân nặng</td>
            <td><input style="margin-top: 10px;" class="form-control medium" type="text" id="weight" name="weight" class="form-control"></input></td>
          </tr>
          <tr>
            <td><label for="height"></label>Chiều cao</td>
            <td><input style="margin-top: 10px;" class="form-control medium" type="text" id="height" name="height" class="form-control"></input></td>
          </tr>
          <tr>
            <td><label for="select-helth">Sức khỏe</label></td>
            <td><select style="margin-top: 10px;" id="select-health" name="select-health" class="form-control medium">
                <option value="khoe-manh">Khỏe mạnh</option>
                <option value="om">Ốm</option>
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="desc">Mô tả</label></td>
            <td><textarea id="desc" class="form-control medium" rows="3" cols="30" name="description"></textarea></td>
          </tr>
          <tr>
            <td><label for="select-region"></label>Mã khu vực</td>
            <td><select  style="margin-top: 10px;" id="select-region" class="form-control medium" name="select-region">
                <option value="a">A</option>
                <option value="b">B</option>
            </select>(*)</td>
          </tr>
          <tr>
            <td><label for="select-cell">Mã chuồng</label></td>
            <td><select style="margin-top: 10px;" id="select-cell" class="form-control medium" name="select-cell">
                <option value="a1">A1</option>
                <option value="a2">A2</option>
            </select></td>
          </tr>
        </table>
        <div class="bt">
	      <input style="margin-top: 10px;" type="button" class="btn btn-default btn-primary" name="delete" value="Xóa động vật">
	      <input style="margin-top: 10px;"type="button" class="btn btn-default btn-primary" name="save" value="Lưu">
	      <input style="margin-top: 10px;" type="button" class="btn btn-default btn-primary" name="cancel" value="Hủy">
  		</div>
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
