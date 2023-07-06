<%-- 
    Document   : addFood
    Created on : Jul 6, 2023, 10:45:56 AM
    Author     : CE171454 Hua Tien Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>FFood | Thêm Món</title>
    <%@ include file="WEB-INF/jspf/base.jspf" %>
    <%@ include file="WEB-INF/jspf/resources.jspf" %>
  </head>
  <body>
    <div class="container-fluid m-0 p-0"><div class="row m-0">
        <%@ include file="WEB-INF/jspf/adminSidebar.jspf" %>
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
                    <c:forEach items="${listFood}" var="f">
                      <tr>
                        <td>${f.id}</td>
                        <td>${f.type}</td>
                        <td>${f.name}</td>
                        <td><fmt:formatNumber type="number" pattern="###,###" value="${f.price}"/>đ</td>
                        <td>${(f.discountPercent == null) ? 0 : f.discountPercent}%</td>
                        <td class="table-image-cell">
                          <img src="${f.url}" alt="${f.name}"/>
                        </td>
                        <td>
                          <a href="/admin/food/update/${f.id}" class="btn btn-sm btn-danger">
                            Cập nhật
                          </a>
                          <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#delete-food-modal">
                            Xóa
                          </button>
                        </td>
                      </tr>
                    </c:forEach>
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
      </div>
    </div>

    <%@ include file="WEB-INF/jspf/javascript.jspf" %>
  </body>
</html>
