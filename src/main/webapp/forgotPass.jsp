<%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/18/2022
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>HAHATI | Quên mật khẩu</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet"/>
    <!-- Css Styles -->
    <%@include file="css.jsp" %>
    <link rel="stylesheet" href="css/account.css" type="text/css"/>
</head>
<style>
    .loading:after {
        content: '';
        display: block;
        position: absolute;
        top: 50%;
        left: 50%;
        width: 20px;
        height: 20px;
        margin: -10px 0 0 -10px;
        border-radius: 50%;
        border: 2px solid  #0b2e13;
        border-top-color: #fff;
        animation: spin .8s linear infinite;
        opacity: 1;
        pointer-events: none;
    }

    @keyframes spin {
        to {
            transform: rotate(360deg);
        }
    }
</style>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
            <a href="#">Đăng nhập</a>
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"
        ><img src="img/icon/search.png" alt=""
        /></a>
        <a href="#"><img src="img/icon/heart.png" alt=""/></a>
        <a href="#"><img src="img/icon/cart.png" alt=""/> <span>0</span></a>
    </div>
    <div id="mobile-menu-wrap"></div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->

<div class="main">
    <!-- Shopping Cart Section Begin -->
    <section class="login-register">
        <div class="main-content-wrap section-ptb lagin-and-register-page">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 m-auto">
                        <div class="login-register-wrapper">
                            <!-- login-register-tab-list start -->
                            <div class="login-register-tab-list nav">
                                <a class="active" data-bs-toggle="tab" href="#lg1">
                                    <h4>Quên mật khẩu</h4>
                                </a>
                            </div>
                            <!-- login-register-tab-list end -->
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">

                                            <form id="forgot_form" action="${pageContext.request.contextPath}/forgotPass" method="post">
                                                <div class="login-input-box">
                                                    <span class="text-danger"
                                                          id="register-username-error"> </span>
                                                    <input name="user-email" placeholder="Email" type="email"
                                                    />
                                                </div>
                                                <div class="button-box">
                                                    <div class="login-toggle-btn">
                                                        <a href="./login-register.jsp" style="color: blue">Đăng nhập</a>
                                                    </div>
                                                    <div class="button-box">
                                                        <button class="login-btn btn  " id="send" type="submit">
                                                            <span>Gửi</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


</div>

<!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here....."/>
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/account/bootstrap.min.js"></script>
</body>

<script>
    $(document).ready(function () {
        $("#forgot_form").submit(function (e) {
            e.preventDefault();
            $("#send").addClass("loading");
            $('button').prop('disabled', true);
            $.ajax({
                type: $(this).attr('method'),
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success: function (data) {
                    console.log(data);
                    if (data == 0) {
                        console.log("success 0")
                        $(".login-register").remove();
                        $(".main").html(`  <div class=" d-flex  flex-column justify-content-center  align-items-center" style=" width: 100%; height: 75%; ">
        <h3>Kiểm tra email của bạn</h3>

        <div class=" d-flex  flex-row">

            <div class="button-box" style="margin: 20px">
                <button class="login-btn btn" onclick="window.location.href='./login'">
                    <span>Đăng nhập</span>
                </button>
            </div>
            <div class="button-box" style="margin: 20px">
                <button class="login-btn btn" onclick="window.location.href='./'">
                    <span>Trang chủ</span>
                </button>
            </div>
        </div>
    </div>`)

                    } else if (data == 1) {
                        console.log("Không tìm thấy địa chỉ email")
                        $("#register-username-error").empty();
                        $("#register-username-error").append("Không tìm thấy địa chỉ email");
                        $("#send").removeClass('loading');
                        $('button').prop('disabled', false);
                    } else if (data == 2) {
                        console.log("Vui lòng nhập email")
                        $("#register-username-error").empty();
                        $("#register-username-error").append("Vui lòng nhập email");
                        $("#send").removeClass('loading');
                        $('button').prop('disabled', false);
                    } else if (data == 3) {
                        console.log("Đã quá 5 lần quên mật khẩu, thử lại vào ngài mai")
                        $("#register-username-error").empty();
                        $("#register-username-error").append("Đã quá 5 lần quên mật khẩu, thử lại vào ngài mai");
                        $("#send").removeClass('loading');
                        $('button').prop('disabled', false);
                    }
                },
                error: function (data) {
                    console.log('An error occurred.');
                    console.log(data);
                    $("#send").removeClass('loading');
                    $('button').prop('disabled', false);
                },
                complete: function() {
                    $("#send").removeClass('loading');
                    $('button').prop('disabled', false);
                }
            });
        });
    });
</script>
</html>