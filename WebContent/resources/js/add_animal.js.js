/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    jQuery.validator.setDefaults({
        success: "valid"
    });
    $("#frm-add-animal").validate({
        ignore: [],
        debug: false,
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

$(document).ready(function () {
    jQuery.validator.setDefaults({
        success: "valid"
    });
    $("#frm-changepass").validate({
        ignore: [],
        debug: false,
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
