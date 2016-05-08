<%@page import="org.json.*"%>
<%@page import="dao.CellDAO"%>
<%@page import="dao.RegionDAO"%>
<%@page import="dao.SpeciesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cell, model.Region, model.Species"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-2.1.1.min.js" ></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery.validate.js" ></script>
        <!--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.43/jquery.form-validator.min.js"></script>-->
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/add_animal.js" ></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/add_animal.css" >
        <meta charset="UTF-8">

        <script>
            function cell_on_region() {
                regionID = $("#region_id").val();
                $.get("RegionJsonServlet", {regionID: regionID}, function (responseJSON) {
                    var $cell_select = $("#cell_id");
                    $cell_select.find('option').remove();
                    $.each(responseJSON, function (key, value) {
                        $cell_select.prepend($('<option></option>').attr("value", key).text(value));
                    });
                });
            };
            $(document).ready(function() {
                cell_on_region();
                $("#region_id").change(cell_on_region);
            });
        </script>
        <title>Thêm động vật</title>
    </head>
    <body>
        <div id="add-animal-form">
            <form method="POST" action="AddAnimalServlet" id="frm-add-animal">
                <fieldset>
                    <legend>Thêm động vật</legend>
                    <table id="animal-info" style="border: 1px">
                        <tr>
                            <td><label for="select-species">Loài (*)</label></td>
                            <td><select id="species_id" name="species_id" data-validation="required" data-validation-error-msg="Không được để trống" class="form-control">
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
                            <td><input type="text" class="form-control" id="animal_id" name="animal_id"></td>
                        </tr>
                        <tr>
                            <td><label for="animal-name">Tên động vật (*)</label></td>
                            <td><input type="text" class="form-control" id="animal_name" name="animal_name"></td>
                        </tr>
                        <tr>
                            <td><label for="gender">Giới tính (*)</label></td>
                            <td><label><input type="checkbox" id="gender" class="in-row" name="gender" class="form-control"><p class="in-row">Cái</p></label></td>
                        </tr>
                        <tr>
                            <td><label for="weight">Cân nặng</label></td>
                            <td><input type="number" id="weight" name="weight" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label for="height">Chiều cao</label></td>
                            <td><input type="number" id="height" name="height" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label for="health_status">Sức khỏe</label></td>
                            <td><input type="text" name="health_status" class="form-control" id="health_status"></td>
                        </tr>
                        <tr>
                            <td><label for="description">Mô tả</label></td>
                            <td><textarea id="description" class="form-control" rows="3" cols="30" name="description"></textarea></td>
                        </tr>
                        <tr>
                            <td><label for="region_id">Mã khu vực (*)</label></td>
                            <td><select id="region_id" class="form-control" name="region_id">
                                    <%
                                        ArrayList<Region> regionList = RegionDAO.getAllRegions();
                                        for (Region region : regionList) {%>
                                    <option value=<%=region.getRegionID()%>><%=region.getRegionID()%></option>
                                    <%
                                        }
                                    %>
                                </select></td>
                        </tr>
                        <tr>
                            <td><label for="select-cell">Mã chuồng</label></td>
                            <td><select id="cell_id" class="form-control" name="cell_id"></select></td>
                        </tr>
                    </table>
                    <input type="button" class="btn btn-default" name="erase" value="Xóa hết">
                    <input type="submit" class="btn btn-default" name="submit" value="Thêm">
                    <a href=<%=request.getContextPath() + "/animal-management"%>><input type="button" class="btn btn-default" name="cancel" value="Hủy"></a>
                </fieldset>
            </form>
        </div>
    </body>
</html>
