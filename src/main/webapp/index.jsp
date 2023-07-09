<%-- 
    Document   : index
    Created on : Jun 3, 2023, 5:07:28 PM
    Author     : CE171454 Hua Tien Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/base.jspf" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Title -->
    <title>FFood | Đặt món nhanh, rẻ, tiện</title>
    <%@ include file="WEB-INF/jspf/resources.jspf" %>
  </head>
  <body>
    <!-- Main Content -->
    <main class="main" id="top">
      <%@ include file="WEB-INF/jspf/header.jspf" %>
      <%@ include file="WEB-INF/jspf/login.jspf" %>
      <%@ include file="WEB-INF/jspf/signup.jspf" %>
      <%@ include file="WEB-INF/jspf/cart.jspf" %>

      <!-- HERO -->
      <section class="py-5 overflow-hidden bg-primary" id="home">
        <div class="container">
          <div class="row flex-center">
            <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-4 mt-md-2">
              <img class="img-fluid" src="assets/img/gallery/hero-header.png" alt="hero-header" />
            </div>
            <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
              <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">FFood ngay tại nhà</h1>
              <h1 class="text-800 mb-5 fs-4">Chỉ cần vài phút*<br class="d-none d-xxl-block" /> là có ngay đồ ăn nóng hổi</h1>
              <a class="btn btn-lg btn-danger" href="#foodList"> ĐẶT MÓN NGAY<i class="fas fa-chevron-right ms-2"></i></a>
            </div>
          </div>
        </div>
      </section>

      <!-- Food List -->
      <section class="py-4 overflow-hidden">
        <div class="container">
          <div class="row flex-grow-1 mb-6">
            <div class="col-lg-7 mx-auto text-center mt-7 mb-3">
              <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Danh sách món ăn</h5>
            </div>
          </div>
          <!-- Food Categories -->
          <div class="row flex-center">
            <div class="col-12">
              <div class="row h-100 align-items-center">
                <div class="col-6 col-sm-4 col-md-3 col-lg mb-5 h-100">
                  <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/search-pizza.png" alt="..." />
                    <div class="card-body">
                      <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Cơm</h5>
                    </div>
                  </div>
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg mb-5 h-100">
                  <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/noodles.png" alt="..." />
                    <div class="card-body">
                      <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Mì</h5>
                    </div>
                  </div>
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg mb-5 h-100">
                  <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/sub-sandwich.png" alt="..." />
                    <div class="card-body">
                      <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Bánh mì</h5>
                    </div>
                  </div>
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg mb-5 h-100">
                  <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/fried-chicken-square.png" alt="..." />
                    <div class="card-body">
                      <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Gà rán</h5>
                    </div>
                  </div>
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg mb-5 h-100">
                  <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/chowmein.png" alt="..." />
                    <div class="card-body">
                      <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Tráng miệng</h5>
                    </div>
                  </div>
                </div>
                <div class="col-6 col-sm-4 col-md-3 col-lg mb-5 h-100">
                  <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/steak.png" alt="..." />
                    <div class="card-body">
                      <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Đồ uống</h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!<!-- Food list -->
          <div class="row gx-3" id="foodList">
            <c:forEach items="${foodList}" var="f"  >
              <div class="col-sm-6 col-md-4 col-lg-3 mb-5 h-100" id="foodObject">
                <div class="card card-span h-100 rounded-3 shadow">
                  <div class="position-relative">
                    <img class="card-img-top img-fluid rounded-3 h-100" src="${f.imageURL}" alt="${f.foodName}" />
                    <c:set var="discount" value="${f.discountPercent}"/>
                    <c:if test="${discount != 0}">
                      <span class="badge bg-danger p-2 m-3 position-absolute top-0 start-0">
                        <i class="fas fa-tag me-2 fs-0"></i>
                        <span class="fs-0">
                          <c:out value="Giảm ${f.discountPercent}%"/>
                        </span>
                      </span>
                    </c:if>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title fw-bold fs-1 text-1000 text-truncate mb-1">${f.foodName}</h5>
                    <div class="card-text mb-3">
                      <span class="text-primary fw-bold">
                        <fmt:formatNumber type="number" pattern="###,###" value="${f.foodPrice - (f.foodPrice * f.discountPercent / 100)}" />đ
                      </span>
                    </div>
                    <div class="d-grid gap-2">
                      <button class="btn btn-lg btn-danger px-2" role="button">Thêm vào Giỏ hàng</button>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
            <div class="col-12 d-flex justify-content-center mt-2">
              <a class="btn btn-lg btn-primary" href="#!">
                XEM TẤT CẢ 
                <i class="fas fa-chevron-right ms-2"> </i>
              </a>
            </div>
          </div>
        </div><!-- end of .container-->

      </section>

      <!-- CÁCH GỌI MÓN -->
      <section class="py-0 bg-primary-gradient">

        <div class="container">
          <div class="row justify-content-center g-0">
            <div class="col-xl-9">
              <div class="col-lg-6 text-center mx-auto mb-3 mb-md-5 mt-4">
                <h5 class="fw-bold text-danger fs-3 fs-lg-5 lh-sm my-6">Cách đặt món nhanh</h5>
              </div>
              <div class="row">
                <div class="col-sm-6 col-md-3 mb-6">
                  <div class="text-center"><img class="shadow-icon" src="assets/img/gallery/order.png" height="112" alt="..." />
                    <h5 class="mt-4 fw-bold">Chọn món ăn và đồ uống</h5>
                    <p class="mb-md-0">Chọn những món bạn muốn ăn, và số lương món ăn cần đặt</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-3 mb-6">
                  <div class="text-center"><img class="shadow-icon" src="assets/img/gallery/location.png" height="112" alt="..." />
                    <h5 class="mt-4 fw-bold">Chọn địa điểm giao món</h5>
                    <p class="mb-md-0">Đặt địa điểm giao, và món ăn của bạn sẽ đến trong chốc lát</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-3 mb-6">
                  <div class="text-center"><img class="shadow-icon" src="assets/img/gallery/pay.png" height="112" alt="..." />
                    <h5 class="mt-4 fw-bold">Chọn phương thức thanh toán</h5>
                    <p class="mb-md-0">Thanh toán trước qua thẻ hoặc thanh toán khi nhận món (COD)</p>
                  </div>
                </div>
                <div class="col-sm-6 col-md-3 mb-6">
                  <div class="text-center"><img class="shadow-icon" src="assets/img/gallery/meals.png" height="112" alt="..." />
                    <h5 class="mt-4 fw-bold">Thưởng thức món ăn</h5>
                    <p class="mb-md-0">Thưởng thức đồ ăn nóng hổi, vừa ăn vừa thổi</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div><!-- end of .container-->

      </section>

      <!-- CTA BANNER -->
      <section class="py-0">
        <div class="bg-holder" style="background-image:url(assets/img/gallery/cta-two-bg.png);background-position:center;background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row flex-center">
            <div class="col-xxl-9 py-7 text-center">
              <h1 class="fw-bold mb-4 text-white fs-6">Bạn đã sẵn sàng đặt món <br />ngon bổ rẻ chưa?</h1>
              <a class="btn btn-lg btn-danger" href="#foodList"> ĐẶT MÓN NGAY<i class="fas fa-chevron-right ms-2"></i></a>
            </div>
          </div>
        </div>
      </section>
      <%@ include file="WEB-INF/jspf/footer.jspf" %>
    </main>
    <%@ include file="WEB-INF/jspf/javascript.jspf" %>
  </body>
</html>