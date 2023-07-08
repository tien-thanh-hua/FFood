<%-- 
    Document   : admin
    Created on : Jul 2, 2023, 10:36:53 PM
    Author     : CE171454 Hua Tien Thanh
--%>
<%@ include file="WEB-INF/jspf/base.jspf" %>
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

    <%@ include file="WEB-INF/jspf/deleteFood.jspf" %>
    <div class="container-fluid m-0 p-0">
      <div class="row m-0">
        <%@ include file="WEB-INF/jspf/adminSidebar.jspf" %>
        <!-- Main Content -->
        <main class="col-md-9 col-lg-10 offset-md-3 offset-lg-2 p-4">
          <div class="tab-content">
            <!-- Food Menu Tab Content -->
            <div class="tab-pane fade show active" id="food-menu">
              <div class="container-fluid p-2">
                <table id="food-table">
                  <h1 class="text-center fw-bold fs-3">Quản lý Món ăn</h1>
                  <a class="btn btn-primary my-2" href="admin/food/add" role="button">Thêm Món</a>
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
                    <c:forEach items="${foodList}" var="f">
                      <tr>
                        <td>${f.foodID}</td>
                        <td>${f.foodType}</td>
                        <td>${f.foodName}</td>
                        <td><fmt:formatNumber type="number" pattern="###,###" value="${f.foodPrice}"/>đ</td>
                        <td>${(f.discountPercent == null) ? 0 : f.discountPercent}%</td>
                        <td class="table-image-cell">
                          <img src="${f.imageURL}" alt="${f.foodName}"/>
                        </td>
                        <td>
                          <a href="/admin/food/update/${f.foodID}" class="btn btn-sm btn-success py-1 m-1">
                            Cập nhật
                          </a>
                          <button type="button" class="btn btn-sm btn-danger py-1 m-1" data-bs-toggle="modal" data-bs-target="#delete-food-modal">
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
                  <a class="btn btn-primary my-2" href="admin/user/add" role="button">Thêm Người dùng</a>
                  <thead>
                    <tr>
                      <th>Mã Tài khoản</th>
                      <th>Mã Khách hàng</th>
                      <th>Tên Người dùng</th>
                      <th>Email</th>
                      <th>Loại Tài khoản</th>
                      <th>Thao tác</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${userAccountList}" var="u">
                      <tr>
                        <td>${u.accountID}</td>
                        <td>${u.customerID}</td>
                        <td>${u.username}</td>
                        <td>${u.email}</td>
                        <td>${u.accountType}</td>
                        <td>
                          <a href="/user/food/update/${u.accountID}" class="btn btn-sm btn-danger">
                            Cập nhật
                          </a>
                          <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#delete-user-modal">
                            Xóa
                          </button>
                        </td>
                      </tr>
                    </c:forEach>
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
                      <th>Địa chỉ nhận</th>
                      <th>Phương thức thanh toán</th>
                      <th>Các món đặt</th>
                      <th>Ghi chú</th> <!-- contains both customer note and cart details -->
                      <th>Thanh toán</th>
                      <th>Trạng thái</th>
                      <th>Thời gian đặt</th>
                      <th>Thời gian nhận</th>
                      <th>Thời gian hủy</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${orderList}" var="o">
                      <tr>
                        <td>${o.orderID}</td>
                        <td>${o.customerID}</td>
                        <td>${o.contactPhone}</td>
                        <td>${o.deliveryAddress}</td>
                        <td>${o.paymentMethod}</td>
                        <td>
                          <c:forEach items="${o.orderItems}" var="orderItem">
                            <p>${orderItem}</p>
                          </c:forEach>
                        </td>
                        <td>${(o.orderNote == null) ? "" : o.orderNote}</td>
                        <td><fmt:formatNumber type="number" pattern="###,###,###.##" value="${o.orderTotal}"/>đ</td>
                        <td>${o.orderStatus}</td>
                        <td>${o.orderTime}</td>
                        <td>${(o.deliveryTime == null) ? "" : o.deliveryTime}</td>
                        <td>${(o.orderCancelTime == null) ? "" : o.orderCancelTime}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
    <%@ include file="WEB-INF/jspf/javascript.jspf" %>
  </body>
</html>
