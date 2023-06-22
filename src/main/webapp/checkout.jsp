<%-- 
    Document   : checkout
    Created on : Jul 1, 2023, 8:00:52 PM
    Author     : CE171454 Hua Tien Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Title -->
    <title>FFood | Thanh toán đơn món</title>

    <!-- Favicons -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">

    <!-- Stylesheets -->
    <link href="<%= request.getContextPath() + "assets/css/theme.css"%>" rel="stylesheet" />
    <link href="<%= request.getContextPath() + "assets/css/style.css"%>" rel="stylesheet" />
    <link href="<%= request.getContextPath() + "assets/css/vendors/bootstrap-5.3.0-dist/bootstrap.min.css"%>" rel="stylesheet">

    <!-- JavaScript -->
    <script src="vendors/code.jquery.com_jquery-3.7.0.js""></script>
  </head>
  <body>
    <main class="main" id="top">
      <%@ include file="WEB-INF/jspf/base.jspf" %>
      <%@ include file="WEB-INF/jspf/header.jspf" %>
      <%@ include file="WEB-INF/jspf/login.jspf" %>
      <%@ include file="WEB-INF/jspf/signup.jspf" %>

      <div class="container my-5">
        <div class="row">
          <div class="col-md-6">
            <h4>Giỏ hàng của bạn</h4>
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th>Món ăn/Đồ uống</th>
                    <th>Đơn giá</th>
                    <th>Só lượng</th>
                    <th>Số tiền</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Cơm sườn bì chả</td>
                    <td>40.000</td>
                    <td>2</td>
                    <td>80.000</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-12">
                <h4>Thông tin giao món</h4>
                <div class="mb-3">
                  <label for="phone" class="form-label">Điện thoại liên hệ</label>
                  <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number">
                </div>
                <div class="mb-3">
                  <label for="address" class="form-label">Địa chỉ giao món</label>
                  <textarea class="form-control" id="address" rows="3" placeholder="Enter your delivery address"></textarea>
                </div>
                <div class="mb-3">
                  <label for="note" class="form-label">Ghi chú</label>
                  <textarea class="form-control" id="note" rows="3" placeholder="Enter any additional notes"></textarea>
                </div>
              </div>
              <div class="col-md-12">
                <h4>Phương thức Thanh toán</h4>
                <div class="btn-group">
                  <input type="radio" class="btn-check" name="paymentMethod" id="paymentMethod1">
                  <label class="btn btn-outline-dark p-3" for="paymentMethod1">Thẻ tín dụng</label>

                  <input type="radio" class="btn-check" name="paymentMethod" id="paymentMethod2">
                  <label class="btn btn-outline-dark p-3" for="paymentMethod2">Thẻ ghi nợ</label>

                  <input type="radio" class="btn-check" name="paymentMethod" id="paymentMethod3">
                  <label class="btn btn-outline-dark p-3" for="paymentMethod3">Thanh toán khi nhận món (COD)</label>
                </div>
              </div>
              <div class="col-md-12 text-md-end mt-3 d-flex justify-content-end align-items-center">
                <h4 class="d-inline-flex">Tổng thanh toán: 80.000đ</h4>
                <button type="button" class="btn btn-primary ms-3">Đặt món</button>
              </div>
            </div>
          </div>
        </div>
      </div>


      <%@ include file="WEB-INF/jspf/footer.jspf" %>
    </main>

    <!-- JavaScripts -->
    <script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="assets/js/theme.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
  </body>
</html>
