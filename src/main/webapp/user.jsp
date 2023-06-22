<%-- 
    Document   : user
    Created on : Jul 2, 2023, 8:04:59 PM
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
    <title>FFood | Tài khoản Người dùng</title>

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
    <script src="<%= request.getContextPath() + "vendors/code.jquery.com_jquery-3.7.0.js"%>"></script>
  </head>
  <body>
    <%@ include file="WEB-INF/jspf/base.jspf" %>
    <%@ include file="WEB-INF/jspf/header.jspf" %>
    <div class="container my-5">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="edit-tab" data-bs-toggle="tab" data-bs-target="#edit" type="button"
                  role="tab" aria-controls="edit" aria-selected="true">Thông tin của tôi</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button"
                  role="tab" aria-controls="login" aria-selected="false">Tài khoản đăng nhập</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="order-history-tab" data-bs-toggle="tab" data-bs-target="#order-history"
                  type="button" role="tab" aria-controls="order-history" aria-selected="false">Đơn món</button>
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content my-3">
        <!-- Edit Information Tab -->
        <div class="tab-pane fade show active" id="edit" role="tabpanel" aria-labelledby="edit-tab">
          <div class="row">
            <div class="col-md-6">
              <!-- Edit user information form -->
              <form>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <label for="last-name" class="form-label">Họ</label>
                    <input type="text" class="form-control" id="last-name">
                  </div>
                  <div class="col-md-6">
                    <label for="first-name" class="form-label">Tên</label>
                    <input type="text" class="form-control" id="first-name">
                  </div>
                </div>
                <div class="mb-3">
                  <label>Giới tính</label><br>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="male" value="Nam">
                    <label class="form-check-label" for="male">Nam</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="female" value="Nữ">
                    <label class="form-check-label" for="female">Nữ</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="other" value="Khác">
                    <label class="form-check-label" for="other">Khác</label>
                  </div>
                </div>
              </form>
            </div>
            <div class="col-md-6">
              <!-- Edit user contact information form -->
              <form>
                <div class="mb-3">
                  <label for="phone" class="form-label">Số điện thoại</label>
                  <input type="tel" class="form-control" id="phone">
                </div>
                <div class="mb-3">
                  <label for="address" class="form-label">Địa chỉ</label>
                  <textarea class="form-control" id="address" rows="2"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Lưu thông tin</button>
              </form>
            </div>
          </div>
        </div>

        <!-- Change Login Info Tab -->
        <div class="tab-pane fade" id="login" role="tabpanel" aria-labelledby="login-tab">
          <div class="row">
            <div class="col-md-6">
              <!-- Change username form -->
              <form>
                <div class="mb-3">
                  <label for="new-username" class="form-label">Tên Người dùng mới</label>
                  <input type="text" class="form-control" id="new-username">
                </div>
                <button type="submit" class="btn btn-primary">Đổi tên Người dùng</button>
              </form>
            </div>
            <div class="col-md-6">
              <!-- Change password form -->
              <form>
                <div class="mb-3">
                  <label for="current-password" class="form-label">Mật khẩu hiện tại</label>
                  <input type="password" class="form-control" id="current-password">
                </div>
                <div class="mb-3">
                  <label for="new-password" class="form-label">Mật khẩu mới</label>
                  <input type="password" class="form-control" id="new-password">
                </div>
                <div class="mb-3">
                  <label for="confirm-password" class="form-label">Nhập lại Mật khẩu mới</label>
                  <input type="password" class="form-control" id="confirm-password">
                </div>
                <button type="submit" class="btn btn-primary">Đổi Mật khẩu</button>
              </form>
            </div>
          </div>
        </div>

        <!-- Order History Tab -->
        <div class="tab-pane fade" id="order-history" role="tabpanel" aria-labelledby="order-history-tab">
          <!-- Display order history as cards -->
          <div class="card">
            <div class="card-header">
              Dơn #123456 (Trạng thái: Đã giao thành công)
            </div>
            <div class="card-body">
              <p>Thời gian đặt: 30 tháng 6, 2023, 10:30</p>
              <p>Ordered Food Items:</p>
              <ul>
                <li>Cơm sườn bì chả x 2 (Đơn giá: 40.000đ)</li>
                <li>Phở x 1 (Đơn giá: 60.000đ)</li>
              </ul>
              <p>Tổng thanh toán: 140.000đ</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="WEB-INF/jspf/footer.jspf" %>
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
