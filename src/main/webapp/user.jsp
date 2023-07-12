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
    <%@ include file="WEB-INF/jspf/resources.jspf" %>
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
              <form method="post" action="/user/info">
                <!-- Hidden - User Account ID -->
                <input type="hidden" id="txtAccountID" name="txtAccountID" value="${currentAccount.accountID}"/>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <label for="txtLastName" class="form-label">Họ</label>
                    <input type="text" class="form-control" id="txtLastName">
                  </div>
                  <div class="col-md-6">
                    <label for="txtFirstName" class="form-label">Tên</label>
                    <input type="text" class="form-control" id="txtFirstName">
                  </div>
                </div>
                <div class="mb-3">
                  <label>Giới tính</label><br>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="txtGender" id="male" value="Nam">
                    <label class="form-check-label" for="male">Nam</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="txtGender" id="female" value="Nữ">
                    <label class="form-check-label" for="female">Nữ</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="txtGender" id="other" value="Khác">
                    <label class="form-check-label" for="other">Khác</label>
                  </div>
                </div>
              </form>
            </div>
            <div class="col-md-6">
              <!-- Edit user contact information form -->
              <form>
                <div class="mb-3">
                  <label for="txtPhoneNumber" class="form-label">Số điện thoại</label>
                  <input type="tel" class="form-control" id="txtPhoneNumber">
                </div>
                <div class="mb-3">
                  <label for="txtAddress" class="form-label">Địa chỉ</label>
                  <textarea class="form-control" id="txtAddress" rows="2"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Lưu thông tin</button>
                <!-- Hidden Submit Value -->
                <input type="hidden" id="btnSubmit" name="btnSubmit" value="SubmitUpdateUser">
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
    <%@ include file="WEB-INF/jspf/javascript.jspf" %>
  </body>
</html>
