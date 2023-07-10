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
        <%@ include file="WEB-INF/jspf/resources.jspf" %>
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
                                    <c:set var="totalPrice" value="0"></c:set>
                                    <c:forEach var="cart" items="${sessionScope['cart'].items}">
                                        <tr>
                                            <td>${cart.food.foodName}</td>
                                            <td>${cart.food.getFoodPriceFormat()}</td>
                                            <td>${cart.foodQuantity}</td>
                                            <td><c:set var="productPrice" value="${Double.parseDouble(cart.food.foodPrice) * cart.foodQuantity}" />
                                                <c:set var="totalPrice" value="${totalPrice + productPrice}" /> 
                                                ${Double.parseDouble(cart.food.foodPrice) * cart.foodQuantity} đ</td>
                                        </tr>
                                    </c:forEach>


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
                                <h4 class="d-inline-flex">Tổng thanh toán: ${totalPrice}đ</h4>
                                <button type="button" class="btn btn-primary ms-3">Đặt món</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%@ include file="WEB-INF/jspf/footer.jspf" %>
        </main>
        <%@ include file="WEB-INF/jspf/javascript.jspf" %>
    </body>
</html>
