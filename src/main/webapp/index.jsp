<%-- 
    Document   : index
    Created on : Jun 3, 2023, 5:07:28 PM
    Author     : CE171454 Hua Tien Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>FFood | Đặt món nhanh, rẻ, tiện</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="assets/css/theme.css" rel="stylesheet" />
  </head>

  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <!-- Start Top Nav -->
      <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
          <div class="w-100 d-flex justify-content-between">
            <div>
              <i class="fa fa-envelope mx-2"></i>
              <a class="navbar-sm-brand text-light text-decoration-none" href="#">
                ffood@support.com
              </a>
              <i class="fa fa-phone mx-2"></i>
              <a class="navbar-sm-brand text-light text-decoration-none" href="#">
                0017-001-1704
              </a>
            </div>
            <div>
              <a class="text-light" href="#" target="_blank" rel="sponsored">
                <i class="fab fa-facebook-f fa-sm fa-fw me-2"></i>
              </a>
              <a class="text-light" href="#" target="_blank">
                <i class="fab fa-instagram fa-sm fa-fw me-2"></i>
              </a>
              <a class="text-light" href="#" target="_blank">
                <i class="fab fa-twitter fa-sm fa-fw me-2"></i>
              </a>
              <a class="text-light" href="#" target="_blank">
                <i class="fab fa-linkedin fa-sm fa-fw"></i>
              </a>
            </div>
          </div>
      </nav>

      <!-- NAVBAR -->
      <nav class="navbar navbar-expand-lg navbar-light shadow bg-light sticky-top" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container">
          <a class="navbar-brand d-inline-flex" href="index.html">
            <img class="d-inline-block" src="assets/img/gallery/logo.svg" alt="logo" />
            <span class="text-1000 fs-3 fw-bold ms-2 text-gradient">FFood</span>
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse pt-3 pb-2 py-lg-2 w-100" id="navbarSupportedContent"> 
            <form class="d-flex col">
              <div class="input-group-icon flex-grow-1 mx-5 pe-2">
                <i class="fas fa-search input-box-icon text-primary"></i>
                <input class="form-control border-1 input-box bg-100" type="search" placeholder="Tìm món ăn" aria-label="Tìm món ăn" />
              </div>
              <a class="nav-icon text-decoration-none my-auto" href="#">
                <i class="fas fa-fw fa-cart-arrow-down text-primary fs-2 mx-2"></i>             
              </a>    
              <%
                Cookie[] cookies = request.getCookies();
                boolean isLoggedIn = true;
                try {
                  if (cookies[1] == null) {
                    if (session.getAttribute("quantri") == null) {
                      isLoggedIn = false;
                    }
                  } else {
                    Cookie c = cookies[1];
                    if (!c.getName().equals("quantri")) {
                      isLoggedIn = false;
                    }
                  }
                } catch (ArrayIndexOutOfBoundsException ae) {
                  if (session.getAttribute("quantri") == null) {
                    isLoggedIn = false;
                  }
                } catch (NullPointerException ne) {
                  isLoggedIn = false;
                }
                
                if (isLoggedIn) {
              %>
              <button class="btn btn-primary text-white ms-2" data-bs-toggle="modal" data-bs-target="#" type="button">
                <i class="fas fa-user me-2"></i>
                <%= "Group 1" %>
              </button>
              <%   
                } else {
              %>
              <button class="btn btn-primary text-white ms-2" data-bs-toggle="modal" data-bs-target="#login-modal" type="button">
                <i class="fas fa-user me-2"></i>
                Đăng nhập
              </button>
              <%
                }
              %>
            </form>
          </div>
        </div>
      </nav>

      <!-- LOGIN -->
      <div class="modal" tabindex="-1" id="login-modal">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-body">
              <div class="d-flex col">
                <div class="flex-grow-1"></div>
                <button type="button" class="btn-close ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>                
              </div>
              <form class="form mx-2 p-2 mx-md-4 p-md-4 mb-4" id="main-form" method="post">
                <h1 class="text-center mb-2 mb-md-4">Đăng nhập</h1>
                <div class="form-group col">
                  <label class="col-form-label" for="txtPhoneNumber">Số điện thoại</label>
                  <div class="">
                    <input type="text" class="form-control" id="txtPhoneNumber" name="txtPhoneNumber" placeholder="Nhập số điện thoại">
                    <div class="lblError" id="lblErrorName"></div>
                  </div>
                </div>
                <div class="form-group col">
                  <label class="col-form-label" for="txtPassword">Mật khẩu</label>
                  <div class="">
                    <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Nhập mật khẩu">
                    <i class="bi bi-eye-slash" id="togglePassword"></i>
                    <div class="lblError" id="lblErrorPassword"></div>
                  </div>
                </div>
                <div class="form-group col d-flex mb-4">
                  <div class="form-check form-switch mt-3 mb-2">   
                    <input type="checkbox" class="form-check-input" id="chkRememberMe" name="chkRememberMe" value="remember">
                    <label class="form-check-label" for="chkRememberMe">Nhớ mật khẩu</label>
                  </div>
                  <div class="flex-grow-1"></div>
                  <div class="my-auto">
                    <a href="#" class="text-decoration-underline link-primary">
                      Quên mật khẩu?      
                    </a> 
                  </div>
                </div>
                <div class="form-group row px-3">
                  <button type="submit" class="btn btn-primary btn-lg btn-block" id="btnSubmit" name="btnSubmit" value="Submit">Đăng nhập</button>
                </div>
                <div class="mt-4 text-center">
                  Bạn chưa có tài khoản? 
                  <a href="#signup-modal">
                    <span class="fw-bold text-decoration-underline link-primary" data-bs-toggle="modal" data-bs-target="#signup-modal" data-bs-dismiss="modal">
                      Đăng ký ngay
                    </span>
                  </a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- SIGNUP -->
      <div class="modal" tabindex="-1" id="signup-modal">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-body">
              <div class="d-flex col">
                <div class="flex-grow-1"></div>
                <button type="button" class="btn-close ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>                
              </div>
              <form class="form mx-2 p-2 mx-md-4 p-md-4 mb-4" id="main-form" method="post">
                <h1 class="text-center mb-2 mb-md-4">Đăng ký</h1>
                <div class="form-group col">
                  <label class="col-form-label" for="txtPhoneNumber">Số điện thoại</label>
                  <div class="">
                    <input type="text" class="form-control" id="txtPhoneNumber" name="txtPhoneNumber" placeholder="Nhập số điện thoại">
                    <div class="lblError" id="lblErrorName"></div>
                  </div>
                </div>
                <div class="form-group col">
                  <label class="col-form-label" for="txtPassword">Mật khẩu</label>
                  <div class="">
                    <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Nhập mật khẩu">
                    <i class="bi bi-eye-slash" id="togglePassword"></i>
                    <div class="lblError" id="lblErrorPassword"></div>
                  </div>
                </div>
                <div class="form-group col mb-4">
                  <label class="col-form-label" for="txtPassword">Nhập lại mật khẩu</label>
                  <div class="">
                    <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Nhập lại mật khẩu">
                    <i class="bi bi-eye-slash" id="togglePassword"></i>
                    <div class="lblError" id="lblErrorPassword"></div>
                  </div>
                </div>
                <div class="form-group row px-3">
                  <button type="submit" class="btn btn-primary btn-lg btn-block" id="btnSubmit" name="btnSubmit" value="Submit">Đăng ký</button>
                </div>
                <div class="mt-4 text-center">
                  Bạn đã có tài khoản? 
                  <a href="#login-modal">
                    <span class="fw-bold text-decoration-underline link-primary" data-bs-toggle="modal" data-bs-target="#login-modal" data-bs-dismiss="modal">
                      Đăng nhập tại đây
                    </span>
                  </a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- ======================================-->
      <!-- HERO =================================-->
      <section class="py-5 overflow-hidden bg-primary" id="home">
        <div class="container">
          <div class="row flex-center">
            <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-4 mt-md-2">
              <img class="img-fluid" src="assets/img/gallery/hero-header.png" alt="hero-header" />
            </div>
            <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
              <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">FFood ngay tại nhà</h1>
              <h1 class="text-800 mb-5 fs-4">Chỉ cần vài phút*<br class="d-none d-xxl-block" /> là có ngay đồ ăn nóng hổi</h1>
              <a class="btn btn-lg btn-danger" href="#food-menu"> ĐẶT MÓN NGAY<i class="fas fa-chevron-right ms-2"></i></a>
            </div>
          </div>
        </div>
      </section>

      <!-- ============================================-->
      <!-- CÁC MÓN BÁN CHẠY ===========================-->
      <section class="py-4 overflow-hidden">

        <div class="container">
          <div class="row h-100">
            <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
              <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Các món bán chạy</h5>
            </div>
            <div class="col-12">
              <div class="carousel-item active" data-bs-interval="10000">
                <div class="row gx-3 h-100 align-items-center">
                  <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                    <div class="card card-span h-100 rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/cheese-burger.png" alt="..." />
                      <div class="card-body">
                        <h5 class="fw-bold text-1000 text-truncate mb-1">Cheese Burger</h5>
                        <div><span class="text-warning me-2"><i class="fas fa-map-marker-alt"></i></span><span class="text-primary">Burger Arena</span></div><span class="text-1000 fw-bold">$3.88</span>
                      </div>
                    </div>
                    <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="#!" role="button">Order now</a></div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                    <div class="card card-span h-100 rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/toffes-cake.png" alt="..." />
                      <div class="card-body">
                        <h5 class="fw-bold text-1000 text-truncate mb-1">Toffe's Cake</h5>
                        <div><span class="text-warning me-2"><i class="fas fa-map-marker-alt"></i></span><span class="text-primary">Top Sticks</span></div><span class="text-1000 fw-bold">$4.00</span>
                      </div>
                    </div>
                    <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="#!" role="button">Order now</a></div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                    <div class="card card-span h-100 rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/dancake.png" alt="..." />
                      <div class="card-body">
                        <h5 class="fw-bold text-1000 text-truncate mb-1">Dancake</h5>
                        <div><span class="text-warning me-2"><i class="fas fa-map-marker-alt"></i></span><span class="text-primary">Cake World</span></div><span class="text-1000 fw-bold">$1.99</span>
                      </div>
                    </div>
                    <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="#!" role="button">Order now</a></div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                    <div class="card card-span h-100 rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/crispy-sandwitch.png" alt="..." />
                      <div class="card-body">
                        <h5 class="fw-bold text-1000 text-truncate mb-1">Crispy Sandwitch</h5>
                        <div><span class="text-warning me-2"><i class="fas fa-map-marker-alt"></i></span><span class="text-primary">Fastfood Dine</span></div><span class="text-1000 fw-bold">$3.00</span>
                      </div>
                    </div>
                    <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="#!" role="button">Order now</a></div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                    <div class="card card-span h-100 rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/thai-soup.png" alt="..." />
                      <div class="card-body">
                        <h5 class="fw-bold text-1000 text-truncate mb-1">Thai Soup</h5>
                        <div><span class="text-warning me-2"><i class="fas fa-map-marker-alt"></i></span><span class="text-primary">Foody Man</span></div><span class="text-1000 fw-bold">$2.79</span>
                      </div>
                    </div>
                    <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="#!" role="button">Order now</a></div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div><!-- end of .container-->
      </section>

      <!-- ======================================-->
      <!-- DANH SÁCH MÓN ĂN =====================-->
      <section class="py-4 overflow-hidden">
        <div class="container">
          <div class="row flex-grow-1 mb-6">
            <div class="col-lg-7 mx-auto text-center mt-7 mb-3" id="food-menu">
              <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Danh sách món ăn</h5>
            </div>
          </div>
          <!-- Food categories -->
          <div class="row flex-center">
            <div class="col-12">
              <div class="carousel slide" id="carouselSearchByFood" data-bs-touch="false" data-bs-interval="false">
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="0">
                    <div class="row h-100 align-items-center">
                      <div class="col-sm-4 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/search-pizza.png" alt="..." />
                          <div class="card-body">
                            <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Cơm</h5>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/noodles.png" alt="..." />
                          <div class="card-body">
                            <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Mì</h5>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/sub-sandwich.png" alt="..." />
                          <div class="card-body">
                            <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Bánh mì</h5>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/fried-chicken-square.png" alt="..." />
                          <div class="card-body">
                            <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Gà rán</h5>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/chowmein.png" alt="..." />
                          <div class="card-body">
                            <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Tráng miệng</h5>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-circle"><img class="img-fluid rounded-circle h-100" src="assets/img/gallery/steak.png" alt="..." />
                          <div class="card-body">
                            <h5 class="text-center fw-bold text-1000 text-truncate mb-2">Đồ uống</h5>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row gx-3">
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3">
                <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/food-world.png" alt="..." />
                <div class="card-img-overlay ps-0">
                  <span class="badge bg-danger p-2 ms-3">
                    <i class="fas fa-tag me-2 fs-0"></i>
                    <span class="fs-0">Giảm 20%</span> 
                  </span>
                  <span class="badge bg-primary ms-2 me-1 p-2">
                    <i class="fas fa-clock me-1 fs-0"></i>
                    <span class="fs-0">Fast</span>
                  </span>
                </div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/food-world-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Food world</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">46</span>
                    </div>
                  </div><span class="badge bg-soft-danger p-2"><span class="fw-bold fs-1 text-danger">Opens Tomorrow</span></span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/pizza-hub.png" alt="..." />
                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0">10% off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span></div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/pizzahub-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Pizza hub</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">40</span>
                    </div>
                  </div><span class="badge bg-soft-danger p-2"><span class="fw-bold fs-1 text-danger">Opens Tomorrow</span></span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/donuts-hut.png" alt="..." />
                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0">15% off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span></div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/donuts-hut-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Donuts hut</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">20</span>
                    </div>
                  </div><span class="badge bg-soft-success p-2"><span class="fw-bold fs-1 text-success">Open Now</span></span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/donuthut.png" alt="..." />
                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0">15% off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span></div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/donut-hut-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Donuts hut</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">50</span>
                    </div>
                  </div><span class="badge bg-soft-success p-2"><span class="fw-bold fs-1 text-success">Open Now</span></span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/ruby-tuesday.png" alt="..." />
                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0">10% off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span></div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/ruby-tuesday-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Ruby tuesday</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">50</span>
                    </div>
                  </div><span class="badge bg-soft-success p-2"><span class="fw-bold fs-1 text-success">Open Now</span></span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/kuakata.png" alt="..." />
                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0">10% off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span></div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/kuakata-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Kuakata Fried Chicken</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">50</span>
                    </div>
                  </div><span class="badge bg-soft-success p-2"><span class="fw-bold fs-1 text-success">Open Now</span></span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/red-square.png" alt="..." />
                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0">10% off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span></div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/red-square-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Kuakata Fried Chicken</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">50</span>
                    </div>
                  </div><span class="badge bg-soft-success p-2"><span class="fw-bold fs-1 text-success">Open Now</span></span>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/taco-bell.png" alt="..." />
                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0">10% off</span></span><span class="badge bg-primary ms-2 me-1 p-2"><i class="fas fa-clock me-1 fs-0"></i><span class="fs-0">Fast</span></span></div>
                <div class="card-body">
                  <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="assets/img/gallery/taco-bell-logo.png" alt="" />
                    <div class="flex-1 ms-3">
                      <h5 class="mb-0 fw-bold text-1000">Taco bell</h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary">50</span>
                    </div>
                  </div><span class="badge bg-soft-success p-2"><span class="fw-bold fs-1 text-success">Open Now</span></span>
                </div>
              </div>
            </div>
            <div class="col-12 d-flex justify-content-center mt-2">
              <a class="btn btn-lg btn-primary" href="#!">
                XEM TẤT CẢ 
                <i class="fas fa-chevron-right ms-2"> </i>
              </a>
            </div>
          </div>
        </div><!-- end of .container-->

      </section>

      <!-- ============================================-->
      <!-- CÁCH GỌI MÓN ===============================-->
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

      <!-- ============================================-->
      <!-- CTA BANNER =================================-->
      <section class="py-0">
        <div class="bg-holder" style="background-image:url(assets/img/gallery/cta-two-bg.png);background-position:center;background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row flex-center">
            <div class="col-xxl-9 py-7 text-center">
              <h1 class="fw-bold mb-4 text-white fs-6">Bạn đã sẵn sàng đặt món <br />ngon bổ rẻ chưa?</h1>
              <a class="btn btn-lg btn-danger" href="#food-menu"> ĐẶT MÓN NGAY<i class="fas fa-chevron-right ms-2"></i></a>
            </div>
          </div>
        </div>
      </section>

      <!-- ============================================-->
      <!-- FOOTER =====================================-->
      <section class="py-0 pt-4 bg-1000">

        <div class="container">
          <div class="row">
            <div class="col-6 col-md-4 col-lg-3 col-xxl-2 mb-3">
              <h5 class="lh-lg fw-bold text-white">THÔNG TIN CHUNG</h5>
              <ul class="list-unstyled mb-md-4 mb-lg-0">
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Về chúng tôi</a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Đội ngũ nhân viên</a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Tuyển dụng</a></li>
              </ul>
            </div>
            <div class="col-6 col-md-4 col-lg-3 col-xxl-2 col-lg-3 mb-3">
              <h5 class="lh-lg fw-bold text-white">LIÊN HỆ</h5>
              <ul class="list-unstyled mb-md-4 mb-lg-0">
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Hỗ trợ &amp; Tư vấn khách hàng</a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Cộng tác với chúng tôi </a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Số điện thoại: 0017-001-1704</a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Email: ffood@support.com</a></li>
              </ul>
            </div>
            <div class="col-6 col-md-4 col-lg-3 col-xxl-2 mb-3">
              <h5 class="lh-lg fw-bold text-white">CÁC CHÍNH SÁCH</h5>
              <ul class="list-unstyled mb-md-4 mb-lg-0">
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Điều khoản &amp; Chính sách</a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Hoàn tiền</a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Quyền riêng tư</a></li>
                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Chính sách về Cookie</a></li>
              </ul>
            </div>
            <div class="col-6 col-md-4 col-lg-3 col-xxl-2 mb-3">
              <h5 class="lh-lg fw-bold text-white">HÃY THEO DÕI CHÚNG TÔI</h5>
              <div class="text-start my-3"> <a href="#!">
                  <svg class="svg-inline--fa fa-instagram fa-w-14 fs-2 me-2" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="instagram" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                  <path fill="#BDBDBD" d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path>
                  </svg></a><a href="#!">
                  <svg class="svg-inline--fa fa-facebook fa-w-16 fs-2 mx-2" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="facebook" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                  <path fill="#BDBDBD" d="M504 256C504 119 393 8 256 8S8 119 8 256c0 123.78 90.69 226.38 209.25 245V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.28c-30.8 0-40.41 19.12-40.41 38.73V256h68.78l-11 71.69h-57.78V501C413.31 482.38 504 379.78 504 256z"></path>
                  </svg></a><a href="#!">
                  <svg class="svg-inline--fa fa-twitter fa-w-16 fs-2 mx-2" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="twitter" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                  <path fill="#BDBDBD" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path>
                  </svg></a></div>
            </div>
          </div>
          <hr class="border border-800" />
          <div class="row flex-center pb-3">
            <div class="col-md-6 order-0">
              <p class="text-200 text-center">All Rights Reserved &copy; FFood, 2023</p>
            </div>
          </div>
        </div><!-- end of .container-->

      </section>

    </main>

    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="assets/js/theme.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
  </body>

</html>