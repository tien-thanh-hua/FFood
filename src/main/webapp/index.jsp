<%-- 
    Document   : index
    Created on : Jun 3, 2023, 5:07:28 PM
    Author     : CE171454 Hua Tien Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>FFood</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="assets/css/templatemo.css" type="text/css"/>
        <link rel="stylesheet" href="assets/css/custom.css" type="text/css"/>

        <!-- Load fonts style after rendering the layout styles -->
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap"
            />
        <link rel="stylesheet" href="assets/css/fontawesome.min.css" />
    </head>

    <body>
        <!-- Start Top Nav -->
        <nav
            class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block"
            id="templatemo_nav_top"
            >
            <div class="container text-light">
                <div class="w-100 d-flex justify-content-between">
                    <div>
                        <i class="fa fa-envelope mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="#"
                           >FFood@fpt.com</a
                        >
                        <i class="fa fa-phone mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="#"
                           >0123456789</a
                        >
                    </div>
                    <div>
                        <a class="text-light" href="#" target="_blank" rel="sponsored"
                           ><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i
                            ></a>
                        <a class="text-light" href="#" target="_blank"
                           ><i class="fab fa-instagram fa-sm fa-fw me-2"></i
                            ></a>
                        <a class="text-light" href="#" target="_blank"
                           ><i class="fab fa-twitter fa-sm fa-fw me-2"></i
                            ></a>
                        <a class="text-light" href="#" target="_blank"
                           ><i class="fab fa-linkedin fa-sm fa-fw"></i
                            ></a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Close Top Nav -->

        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-light shadow">
            <div class="container d-flex justify-content-between align-items-center">
                <a
                    class="navbar-brand text-success logo h1 align-self-center"
                    href="index.jsp"
                    >
                    FFood
                </a>

                <button
                    class="navbar-toggler border-0"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#templatemo_main_nav"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div
                    class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between"
                    id="templatemo_main_nav"
                    >
                    <div class="flex-fill">
                        <ul
                            class="nav navbar-nav d-flex justify-content-between mx-lg-auto"
                            >
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.html">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.html">Contact</a>
                            </li>
                        </ul>
                    </div>
                    <div class="navbar align-self-center d-flex">
                        <div
                            class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3"
                            >
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    id="inputMobileSearch"
                                    placeholder="Search ..."
                                    />
                                <div class="input-group-text">
                                    <i class="fa fa-fw fa-search"></i>
                                </div>
                            </div>
                        </div>
                        <a
                            class="nav-icon d-none d-lg-inline"
                            href="#"
                            data-bs-toggle="modal"
                            data-bs-target="#templatemo_search"
                            >
                            <i class="fa fa-fw fa-search text-dark mr-2"></i>
                        </a>
                        <a class="nav-icon position-relative text-decoration-none" href="#">
                            <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                            <span
                                class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"
                                ></span>
                        </a>
                        <a class="nav-icon position-relative text-decoration-none" href="#">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i>
                            <span
                                class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"
                                ></span>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Close Header -->

        <!-- Modal -->
        <div
            class="modal fade bg-white"
            id="templatemo_search"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog modal-lg" role="document">
                <div class="w-100 pt-1 mb-5 text-right">
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                        ></button>
                </div>
                <form
                    action=""
                    method="get"
                    class="modal-content modal-body border-0 p-0"
                    >
                    <div class="input-group mb-2">
                        <input
                            type="text"
                            class="form-control"
                            id="inputModalSearch"
                            name="q"
                            placeholder="Search ..."
                            />
                        <button
                            type="submit"
                            class="input-group-text bg-success text-light"
                            >
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Start Banner Hero -->
        <div
            id="template-mo-zay-hero-carousel"
            class="carousel slide"
            data-bs-ride="carousel"
            >
            <ol class="carousel-indicators">
                <li
                    data-bs-target="#template-mo-zay-hero-carousel"
                    data-bs-slide-to="0"
                    class="active"
                    ></li>
                <li
                    data-bs-target="#template-mo-zay-hero-carousel"
                    data-bs-slide-to="1"
                    ></li>
                <li
                    data-bs-target="#template-mo-zay-hero-carousel"
                    data-bs-slide-to="2"
                    ></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="row p-5">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                <img
                                    class="img-fluid"
                                    src="assets/img/banner_img_01.jpg"
                                    alt=""
                                    />
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left align-self-center">
                                    <h1 class="h1 text-success"><b>FFood</b></h1>
                                    <h3 class="h2">Đa Dạng Món Ăn</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row p-5">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                <img
                                    class="img-fluid"
                                    src="assets/img/banner_img_02.jpg"
                                    alt=""
                                    />
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1">Giải Tỏa Cơn Khát</h1>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row p-5">
                            <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                                <img
                                    class="img-fluid"
                                    src="assets/img/banner_img_03.jpg"
                                    alt=""
                                    />
                            </div>
                            <div class="col-lg-6 mb-0 d-flex align-items-center">
                                <div class="text-align-left">
                                    <h1 class="h1">Thiên Đường Bánh Ngọt</h1>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a
                class="carousel-control-prev text-decoration-none w-auto ps-3"
                href="#template-mo-zay-hero-carousel"
                role="button"
                data-bs-slide="prev"
                >
                <i class="fas fa-chevron-left"></i>
            </a>
            <a
                class="carousel-control-next text-decoration-none w-auto pe-3"
                href="#template-mo-zay-hero-carousel"
                role="button"
                data-bs-slide="next"
                >
                <i class="fas fa-chevron-right"></i>
            </a>
        </div>
        <!-- End Banner Hero -->

        <!-- Start Featured Product -->
        <section class="bg-light">
            <div class="container py-5">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Menu</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://images.foody.vn/res/g9/88504/prof/s640x400/foody-mobile-com-tam-huyen-mb-jpg-974-635742936873952850.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 200px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">40,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Cơm Tấm</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://images.foody.vn/res/g88/870335/prof/s640x400/foody-upload-api-foody-mobile-foody-upload-api-foo-190820154516.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">60,000đ</li>
                                </ul>
                                <a
                                    href="shop-single.html"
                                    class="h2 text-decoration-none text-dark"
                                    >Bún Đậu Mắm Tôm</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (48)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://i.ytimg.com/vi/C1P1Cw9J1-I/maxresdefault.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul
                                    class="list-unstyled d-flex justify-content-between"
                                    >
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">40,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Bún Riêu</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (74)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://cdn.tgdd.vn/Files/2022/01/21/1412109/huong-dan-cach-lam-tra-sua-tran-chau-duong-den-202201211522033706.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">30,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Trà Sữa</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/8/18/ca-phe-16607581080101863582923.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">20,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark">Cà Phê</a>
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://forza.com.vn/wp-content/uploads/2021/03/nuoc-ep-trai-cay-080321-4.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">30,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Sinh Tố</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://images.foody.vn/res/g108/1077272/prof/s640x400/file_restaurant_photo_ukt5_16373-858aec29-211119153222.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">50,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Bánh Donut</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://images.foody.vn/res/g114/1135778/prof/s640x400/foody-upload-api-foody-mobile-im-d76ba201-220505134459.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">80,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Bông Lan Trứng Muối</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://images.foody.vn/res/g20/194427/prof/s640x400/file_restaurant_photo_8mtd_16097-26571dc4-210104113939.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">220,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Bánh Kem</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://cdn.tgdd.vn/Files/2021/04/05/1340926/cach-lam-ca-vien-chien-nuoc-mam-an-vat-an-com-deu-ngon-202201051649517330.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">50,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Cá Viên Chiên</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://bepmina.vn/wp-content/uploads/2021/07/cach-lam-khoai-tay-chien-scaled.jpeg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">30,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Khoai Tây Chiên</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="#">
                                <img
                                    style="height: 220px"
                                    src="https://daylambanh.edu.vn/wp-content/uploads/2019/10/banh-chuoi-chien-an-vat-600x400.jpg"
                                    class="card-img-top"
                                    alt="..."
                                    />
                            </a>
                            <div class="card-body" style="height: 220px">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">10,000đ</li>
                                </ul>
                                <a href="#" class="h2 text-decoration-none text-dark"
                                   >Chuối Chiên</a
                                >
                                <p class="card-text">...</p>
                                <p class="text-muted">Reviews (24)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Featured Product -->

        <!-- Start Footer -->
        <footer class="bg-dark" id="tempaltemo_footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-success border-bottom pb-3 border-light logo">
                            Group1
                        </h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li>
                                <i class="fas fa-map-marker-alt fa-fw"></i>
                                FPT Cần Thơ
                            </li>
                            <li>
                                <i class="fa fa-phone fa-fw"></i>
                                <a class="text-decoration-none" href="#">0123456789</a>
                            </li>
                            <li>
                                <i class="fa fa-envelope fa-fw"></i>
                                <a class="text-decoration-none" href="mailto:info@company.com"
                                   >FFood@fpt.com</a
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">
                            Products
                        </h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li><a class="text-decoration-none" href="#">Đồ Ăn</a></li>
                            <li><a class="text-decoration-none" href="#">Đồ Uống</a></li>
                            <li><a class="text-decoration-none" href="#">Bánh Ngọt</a></li>
                            <li><a class="text-decoration-none" href="#">Đồ Ăn Vặt</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">
                            Further Info
                        </h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li><a class="text-decoration-none" href="#">Home</a></li>
                            <li><a class="text-decoration-none" href="#">About Us</a></li>
                            <li><a class="text-decoration-none" href="#">Locations</a></li>
                            <li><a class="text-decoration-none" href="#">FAQs</a></li>
                            <li><a class="text-decoration-none" href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row text-light mb-4">
                    <div class="col-12 mb-3">
                        <div class="w-100 my-3 border-top border-light"></div>
                    </div>
                    <div class="col-auto me-auto">
                        <ul class="list-inline text-left footer-icons">
                            <li
                                class="list-inline-item border border-light rounded-circle text-center"
                                >
                                <a
                                    class="text-light text-decoration-none"
                                    target="_blank"
                                    href="http://facebook.com/"
                                    ><i class="fab fa-facebook-f fa-lg fa-fw"></i
                                    ></a>
                            </li>
                            <li
                                class="list-inline-item border border-light rounded-circle text-center"
                                >
                                <a
                                    class="text-light text-decoration-none"
                                    target="_blank"
                                    href="https://www.instagram.com/"
                                    ><i class="fab fa-instagram fa-lg fa-fw"></i
                                    ></a>
                            </li>
                            <li
                                class="list-inline-item border border-light rounded-circle text-center"
                                >
                                <a
                                    class="text-light text-decoration-none"
                                    target="_blank"
                                    href="https://twitter.com/"
                                    ><i class="fab fa-twitter fa-lg fa-fw"></i
                                    ></a>
                            </li>
                            <li
                                class="list-inline-item border border-light rounded-circle text-center"
                                >
                                <a
                                    class="text-light text-decoration-none"
                                    target="_blank"
                                    href="https://www.linkedin.com/"
                                    ><i class="fab fa-linkedin fa-lg fa-fw"></i
                                    ></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-auto">
                        <label class="sr-only" for="subscribeEmail">Email address</label>
                        <div class="input-group mb-2">
                            <input
                                type="text"
                                class="form-control bg-dark border-light"
                                id="subscribeEmail"
                                placeholder="Email address"
                                />
                            <div class="input-group-text btn-success text-light">
                                Subscribe
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <!-- Start Script -->
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->
    </body>
</html>

