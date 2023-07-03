<%-- 
    Document   : admin
    Created on : Jul 2, 2023, 10:36:53 PM
    Author     : CE171454 Hua Tien Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>FFood | Dashboard</title>
    <%@ include file="WEB-INF/jspf/resources.jspf" %>
    <%@ include file="WEB-INF/jspf/adminDataTables.jspf" %>

  </head>
  <body>

    <div class="container-fluid m-0 p-0"><div class="row m-0">
        <!-- Sidebar -->
        <div class="d-flex flex-column flex-shrink-0 col-md-3 col-lg-2 p-3 bg-warning-subtle vh-md-100">
          <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <img class="d-inline-block" src="<%= request.getContextPath() + "assets/img/gallery/logo.svg"%>" alt="logo" />
            <span class="text-1000 fs-2 fw-bold lh-1 ms-2 text-gradient">FFood Dashboard</span>
          </a>
          <hr class="border border-800 border-1 border-opacity-25">
          <ul class="nav nav-pills flex-column mb-auto"> 
            <li class="nav-item">
              <a href="#food-menu" class="nav-link link-body-emphasis" data-bs-toggle="tab">
                <i class="fas fa-hamburger fa-fw me-2"></i>
                Món ăn
              </a>
            </li>
            <li class="nav-item">
              <a href="#users" class="nav-link link-body-emphasis" data-bs-toggle="tab">
                <i class="fas fa-users fa-fw me-2"></i>
                Người dùng
              </a>
            </li>
            <li class="nav-item">
              <a href="#orders" class="nav-link link-body-emphasis" data-bs-toggle="tab">
                <i class="fas fa-table fa-fw me-2"></i>
                Đơn món
              </a>
            </li>
          </ul>
          <hr class="border border-800 border-1 border-opacity-25">
          <div class="flex-grow-0"></div>
          <div class="dropdown">
            <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              <strong>Nguyen Van A</strong>
            </a>
            <ul class="dropdown-menu text-small shadow">
              <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
            </ul>
          </div>
        </div>

        <!-- Main Content -->
        <main class="col p-4">
          <div class="tab-content">
            <!-- Food Menu Tab Content -->
            <div class="tab-pane fade show active" id="food-menu">
              <div class="container-fluid p-2">
                <table id="food-table">
                  <h1 class="text-center fw-bold fs-3">Quản lý Món ăn</h1>
                  <a class="btn btn-primary my-2" href="/Order/Add" role="button">Thêm Món</a>
                  <thead>
                    <tr>
                      <th>Mã số</th>
                      <th>Loại món</th>
                      <th>Tên món</th>
                      <th>Đơn giá</th> 
                      <th>Giảm giá</th>
                      <th>Hình ảnh</th>
                      <th>Thao tác</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                      //OrderDAO dao = new OrderDAO();
                      //ResultSet rs = dao.getAll();
                      //while (rs.next()) {
                    %>
                    <tr>
                      <td>1</td>
                      <td>Cơm</td>
                      <td>Cơm chiên dương châu</td>
                      <td>40000</td>
                      <td>0</td>
                      <td class="table-image-cell">
                        <img src="https://pastaxi-manager.onepas.vn/content/uploads/articles/vuonghoai/cach-lam-com-tam-suon-bi-cha/cach-lam-com-tam-suon-bi-cha-1.jpg" 
                             alt=""
                             class="" />
                      </td>
                      <td>
                        <a href="/admin/food/update" />Cập nhật<a/>
                        <a href="/admin/food/delete" onclick="return confirm('Do you want to delete this order?')" />Xóa<a/>
                      </td>
                    </tr>
                    <%
                      //}
                    %>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- Users Tab Content -->
            <div class="tab-pane fade" id="users">
              <div class="container-fluid p-2">
                <table id="users-table">
                  <h1 class="text-center fw-bold fs-3">Quản lý Người dùng</h1>
                  <a class="btn btn-primary my-2" href="/Order/Add" role="button">Thêm Người dùng</a>
                  <thead>
                    <tr>
                      <th>Mã Tài khoản</th>
                      <th>Mã Khách hàng</th>
                      <th>Mã Quản trị</th>
                      <th>Tên Người dùng</th>
                      <th>Email</th>
                      <th>Loại Tài khoản</th> 
                    </tr>
                  </thead>
                  <tbody>
                    <%                      //OrderDAO dao = new OrderDAO();
                      //ResultSet rs = dao.getAll();
                      //while (rs.next()) {
                    %>
                    <tr>
                      <td>1</td>
                      <td>2</td>
                      <td>Không có</td>
                      <td>nva</td>
                      <td>nva@gmail.com</td>
                      <td>Người dùng</td>
                    </tr>
                    <%                      //}
                    %>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- Orders Tab Content -->
            <div class="tab-pane fade" id="orders">
              <div class="container-fluid p-2">
                <table id="orders-table">
                  <h1 class="text-center fw-bold fs-3">Quản lý Đơn món</h1>
                  <thead>
                    <tr>
                      <th>Mã Đơn</th>
                      <th>Mã KH</th>
                      <th>SĐT liên lạc</th>
                      <th>Phương thức thanh toán</th>
                      <th>Ghi chú</th> <!-- contains both customer note and cart details -->
                      <th>Thanh toán</th>
                      <th>Trạng thái</th>
                      <th>Thời gian đặt</th>
                      <th>Thời gian nhận</th>
                      <th>Thời gian hủy</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%                      //OrderDAO dao = new OrderDAO();
                      //ResultSet rs = dao.getAll();
                      //while (rs.next()) {
                    %>
                   
                    <%                      //}
                    %>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- Add more tab content sections for future features -->
          </div>
        </main>
      </div></div>

    <%@ include file="WEB-INF/jspf/javascript.jspf" %>
  </body>
</html>
