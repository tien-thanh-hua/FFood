/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
$(document).ready(validateForm());
function validateForm() {

  $("#add-food-form").validate({
    rules: {
      txtFoodTypeID: {
        required: true
      },
      txtFoodName: {
        required: true,
        maxlength: 50
      },
      txtFoodPrice: {
        required: true,
        number: true,
        min: 1
      },
      txtDiscountPercent: {
        required: true,
        digits: true,
        min: 0,
        max: 100
      },
      txtImageURL: {
        required: true,
        url: true,
        maxlength: 255,
        pattern: "^https://drive\\.google\\.com/file/d/.*?/view\\?usp=drive_link$"
      }
    },
    messages: {
      txtFoodTypeID: "Hãy chọn loại món",
      txtFoodName: {
        required: "Tên món không được để trống",
        maxlength: "Tên món không dài quá 50 kí tự"
      },
      txtFoodPrice: {
        required: "Đơn giá không được để trống",
        number: "Đơn giá phải là định dạng số",
        min: "Đơn giá phải là số dương"
      },
      txtDiscountPercent: {
        required: "Giá trị giảm giá không được để trống",
        digits: "Giá trị giảm giá phải là số nguyên",
        min: "Giá trị giảm giá không được dưới 0",
        max: "Giá trị giảm giá không được quá 100"
      },
      txtImageURL: {
        required: "Đường dẫn ảnh không được để trống",
        url: "Giá trị nhập vào phải là đường dẫn",
        maxlength: "Đường dẫn không dài quá 255 kí tự",
        pattern: "Định dạng đường dẫn không đúng"
      }
    },
    errorElement: "p",
    highlight: function (element, errorClass, validClass) {
      $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
    },
    submitHandler: function (form) {
      form.submit();
    }
  });
  
  $("#update-food-form").validate({
    rules: {
      txtFoodTypeID: {
        required: true
      },
      txtFoodName: {
        required: true,
        maxlength: 50
      },
      txtFoodPrice: {
        required: true,
        number: true,
        min: 1
      },
      txtDiscountPercent: {
        required: true,
        digits: true,
        min: 0,
        max: 100
      },
      txtImageURL: {
        required: true,
        url: true,
        maxlength: 255,
        pattern: "^https://drive\\.google\\.com/file/d/.*?/view\\?usp=drive_link$"
      }
    },
    messages: {
      txtFoodTypeID: "Hãy chọn loại món",
      txtFoodName: {
        required: "Tên món không được để trống",
        maxlength: "Tên món không dài quá 50 kí tự"
      },
      txtFoodPrice: {
        required: "Đơn giá không được để trống",
        number: "Đơn giá phải là định dạng số",
        min: "Đơn giá phải là số dương"
      },
      txtDiscountPercent: {
        required: "Giá trị giảm giá không được để trống",
        digits: "Giá trị giảm giá phải là số nguyên",
        min: "Giá trị giảm giá không được dưới 0",
        max: "Giá trị giảm giá không được quá 100"
      },
      txtImageURL: {
        required: "Đường dẫn ảnh không được để trống",
        url: "Giá trị nhập vào phải là đường dẫn",
        maxlength: "Đường dẫn không dài quá 255 kí tự",
        pattern: "Định dạng đường dẫn không đúng"
      }
    },
    errorElement: "p",
    highlight: function (element, errorClass, validClass) {
      $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
    },
    submitHandler: function (form) {
      form.submit();
    }
  });

  $("#login-form").validate({
    rules: {
      txtUsername: {
        required: true,
        maxlength: 50
      },
      txtPassword: {
        required: true
      }
    },

    messages: {
      txtUsername: {
        required: "Please enter the username.",
        maxlength: "Username length should not exceed 50 characters."
      },
      txtProdName: {
        required: "Please enter the password."
      }
    },
    errorElement: "p",
    highlight: function (element, errorClass, validClass) {
      $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
    },
    submitHandler: function (form) {
      form.submit();
    }
  });

}


