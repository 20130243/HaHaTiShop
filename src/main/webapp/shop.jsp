<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page import="vn.edu.hcmuaf.fit.services.CategoryService" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/3/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="zxx">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thức uống</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/shop.css" type="text/css">
    <link rel="stylesheet" href="css/modal.css" type="text/css">
    <link rel="stylesheet" href="css/header-footer.css" type="text/css">

</head>

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
            <a href="login-register.jsp">Đăng nhập</a>
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
        <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
    </div>
    <div id="mobile-menu-wrap"></div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>

<!-- Header Section End -->

<!-- Shop Section Begin -->
<section class="shop">
    <div class="container">
        <div class="breadcumb">
            <h1>Thức uống</h1>
            <h6>Tất cả sản phẩm</h6>
            <img src="assets/images/icon_tealeaves.png" width="500px" height="50px"
                 style="object-fit: cover;scale: 0.5;">
        </div>
        <div class="row">
            <div class=" col-lg-9">
                <!-- Button trigger modal -->
                <form id="category_filter" name="form_filter" method="get">
                    <div class="row search_bar">

                        <div class="col-lg-4 col-md-4 col-sm-4 ">
                            <h6 class="search_bar_text">Tìm kiếm</h6>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <h6 class="search_bar_text">Nhóm sản phẩm</h6>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 ">
                            <h6 class="search_bar_text">Theo giá</h6>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-4 shop__sidebar__search">
                            <input name="search" type="text" placeholder="Tìm kiếm sản phẩm"
                                   style="padding-right:42px ;" value="<%=request.getParameter("search") != null? request.getParameter("search") : ""%>">
                            <button type="submit"><span class="icon_search"></span></button>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4" style="z-index: 99;">
                            <select id="category" name="category" onchange="form_filter.submit()">
                                <%
                                    List<Category> listCategories = (List<Category>) request.getAttribute("listCategories");
                                    String checkCategories = request.getParameter("category");
                                    for (Category category : listCategories) {
                                %>

                                <option  <%= checkCategories!=null?checkCategories.equals(category.getName())? "selected" : "" : ""%> value="<%=category.getName()%>"><%=category.getName()%> <%=category.getStatus()==1?" (Hết nguyên liệu)" : category.getStatus()==2?" (Ngừng kinh doanh)" : ""%></option>

                                <%}%>
                            </select>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4" style="z-index: 99;">

                            <select id="sort" name="sort" onchange="form_filter.submit()">
                                <%
                                    String sort = (String)  request.getAttribute("sort");
                                %>
                                <option value="none" <%=sort.equals("none")? "selected" : ""%>>Lựa chọn lọc </option>
                                <option value="price-asc" <%=sort.equals("price-asc")? "selected" : ""%>>Sắp xếp theo giá tiền tăng dần</option>
                                <option value="price-desc" <%=sort.equals("price-desc")? "selected" : ""%>>Sắp xếp theo giá tiền giảm dần</option>
                            </select>

                        </div>
                    </div>
                    <input type="text" name="hideSticky" value="1" style="display: none">
                </form>
                <div id="product-container" class="row">
                    <%
                        List<Product> list = (List<Product>) request.getAttribute("listProduct");
                        if(list != null) {
                            for (Product p : list) {

                    %>
                    <div class="product-amount col-lg-3 col-md-4 col-sm-4">
                        <div class="product__item sale" data-toggle="modal"
                             data-target="#myModal<%=p.getId()%>" data-id="<%=p.getId()%>">
                            <div class="product__item__pic set-bg" data-setbg="<%=p.getImage().get(0).getUrl()%>">
                                <%
                                    if (p.getStatus() == 1) {
                                %>
                                <span class="label">Sale</span>
                                <%}%>
                            </div>
                            <div class="product__item__text">
                                <h5 class="product-name"><%=p.getName()%>
                                </h5>
                                <%
                                    int price = 0;
                                    CurrencyFormat currency = new CurrencyFormat();
                                    if (p.getPriceSize().size()
                                            > 0) {
                                        price = (int) (p.getPriceSize().get(0).getPrice());
                                    } else {
                                        price = 0;
                                    }
                                %>
                                <h6 class="product-price"><%=currency.format(price)%>
                                </h6>
                            </div>

                        </div>
                        <form action="addToCart" method="get">
                            <div id="myModal<%=p.getId()%>" class="modal fade in" tabindex="-1" role="dialog">

                                <div class="modal-dialog product-modal" role="document">
                                    <div class="modal-content flex-row">
                                        <div class="w-50">

                                            <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
                                                <!--Slides-->
                                                <div class="carousel-inner " role="listbox" style="height: 500px; padding: 50px">
                                                    <%
                                                    if(p.getImage() != null) {
                                                        for (int i = 0; i < p.getImage().size(); i++) {
                                                    %>
                                                    <div class="carousel-item <%=i==0?"active":""%>">
                                                        <img class="d-block " src="<%=p.getImage().get(i).getUrl()%>" alt=" slide">
                                                    </div>
                                                    <% }} %>
                                                </div>
                                                <!--/.Slides-->
                                                <!--Controls-->
                                                <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev" style="left: 25px;">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="carousel-control-next right-25" href="#carousel-thumb" role="button" data-slide="next" style="right: 25px;">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                                <!--/.Controls-->

                                                <ol class="carousel-indicators" style="position: inherit;">
                                                    <%
                                                        if(p.getImage() != null) {
                                                            for (int i = 0; i < p.getImage().size(); i++) {
                                                    %>
                                                    <li data-target="#carousel-thumb" data-slide-to="<%=i%>" class="active"> <img class="d-block" width="50px" src="<%=p.getImage().get(i).getUrl()%>"></li>
                                                    <% }} %>
                                                </ol>
                                            </div>
                                            <div class="product-modal-price">
                                                <%
                                                    if(p.getPriceSize().size() > 0) {
                                                        List<PriceSize> sizes = p.getPriceSize();
                                                        for(PriceSize size : sizes) {
                                                            if(sizes.size() == 1) {
                                                %>
                                                <h6 class="<%=(p.getPriceSize().get(0).getSize().equalsIgnoreCase("M") || p.getPriceSize().get(0).getSize().equalsIgnoreCase("L"))?"active":"d-none"%> size<%=p.getId()%>"> <%= new CurrencyFormat().format((int) size.getPrice())%></h6>
                                                <%} else {
                                                %>
                                                <h6 class="<%=size.getSize().equalsIgnoreCase("M")?"active":"d-none"%> size<%=p.getId()%>"> <%= new CurrencyFormat().format((int) size.getPrice())%></h6>
                                                <%
                                                            }}}%>
                                            </div>
                                        </div>
                                        <div class="w-50 product-modal-detail">
                                            <div class="product-modal-header">
                                                <h3><%=p.getName()%>
                                                </h3>
                                                <input class="product-modal-id" type="text" name="product_id" value="<%=p.getId()%>" checked="checked">
                                            </div>
                                            <div class="product-modal-middle">
                                                <div class="product-modal-option ">
                                                    <h6 class="title">Kích cỡ:</h6>
                                                    <div class="product-modal-size">
                                                        <%
                                                            if(p.getPriceSize().size() > 0) {
                                                                List<PriceSize> sizes = p.getPriceSize();

                                                                if(sizes.size() == 1) {
                                                        %>
                                                        <input class="size" type="radio" name="size<%=p.getId()%>" id="m_size<%=p.getId()%>" value="<%=sizes.get(0).getSize()%>" checked="checked">
                                                        <label class="size-radio active" for="m_size<%=p.getId()%>"><%=sizes.get(0).getSize()%></label>
                                                        <%
                                                        } else {
                                                        %>
                                                        <input class="size" type="radio" name="size<%=p.getId()%>" id="m_size<%=p.getId()%>" value="<%=sizes.get(0).getSize()%>" checked="checked">
                                                        <label class="size-radio" for="m_size<%=p.getId()%>"><%=sizes.get(0).getSize()%></label>

                                                        <input class="size" type="radio" name="size<%=p.getId()%>" id="l_size<%=p.getId()%>" value="<%=sizes.get(1).getSize()%>" >
                                                        <label class="size-radio" for="l_size<%=p.getId()%>"><%=sizes.get(1).getSize()%></label>
                                                        <%
                                                                } }
                                                        %>
                                                    </div>
                                                </div>
                                                <div class="product-modal-option">
                                                    <h6 class="title">Số lượng:</h6>
                                                    <div class="quantity-control ">
                                                        <input type="number" name="quantity<%=p.getId()%>" class="quantity-num cart-quantity-input" min="0" value="1" id="modal-quantity<%=p.getId()%>">
                                                    </div>
                                                </div>
                                                <div class="product-modal-option align-items-start">

                                                    <h6 class="title">Topping:</h6>
                                                    <div class="product-modal-topping ">
                                                        <%
                                                            if(p.getTopping().size() > 0) {
                                                                List<Topping> toppingList = p.getTopping();
                                                                for(Topping topping : toppingList) {
                                                        %>
                                                        <div class="d-none topping_price <%=topping.getName()%>"><%=topping.getPrice()%></div>
                                                        <input class="topping-checked" type="checkbox" name="<%=topping.getId()%>" id="<%=p.getId()%><%=topping.getId()%>" value="<%=topping.getName()%>" data-id="<%=p.getId()%>"
                                                            <%=topping.getStatus()==1?"disabled":""%>>
                                                        <label class="topping-detail" for="<%=p.getId()%><%=topping.getId()%>">
                                                            <%=topping.getName()%> + <%=topping.getStatus()==1?"Hết nguyên liệu":currency.format((int) topping.getPrice())%></label>
                                                        <%
                                                            } } else {
                                                        %>
                                                        <label class="topping-detail active" for="">
                                                            Sản phẩm không hỗ trợ Topping</label>
                                                        <%
                                                            }
                                                        %>
                                                    </div>
                                                </div>

                                                <div class="product-modal-option align-items-start">
                                                    <h6 class="title">Ghi chú:</h6>
                                                    <div>
                                                        <textarea name="note" id="" cols="25" rows="3"></textarea>
                                                    </div>
                                                </div>
                                                <div class="product-modal-option">
                                                    <h6 class="title">Giá: </h6>
                                                    <h6 id="totalprice<%=p.getId()%>"><%=currency.format((int) p.getPriceSize().get(0).getPrice())%></h6>
                                                </div>
                                            </div>

                                            <div class="product-modal-footer">
                                                <%Category c = new CategoryService().getById(p.getIdCategory());
                                                    if(c.getStatus() == 0) {
                                                %>
                                                <button class="btn modal-btn" class="btn modal-btn" type="submit" >Thêm vào giỏ hàng</button>
                                                <%} else if(c.getStatus() == 1) {%>
                                                <button class="btn modal-btn" class="btn modal-btn" type="submit" disabled>Hết nguyên liệu</button>
                                                <%} else if(c.getStatus() == 2) {%>
                                                <button class="btn modal-btn" class="btn modal-btn" type="submit" disabled>Ngừng kinh doanh</button>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                            <!-- /.modal -->

                        </form>
                    </div>

                    <% }}%>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="shop__sidebar__accordion">
                    <div class="">
                        <div class="cart-product">
                            <div class="cart-heading">
                                <h4 class="cart-product-heading"><i class="fa-solid fa-cart-shopping mr-2"></i>GIỎ
                                    HÀNG</h4>
                            </div>
                            <%
                                Cart cart = (Cart) session.getAttribute("cart");
                            %>
                            <div class="cart-product-list">
                                <%
                                    if (cart != null) {
                                        List<Item> items = cart.getItems();
                                        if (items.size() > 0) {
                                            for (Item item : items) {
                                                Product p = item.getProduct();
                                                List<Product> listProductUnavaiable =(List<Product>) session.getAttribute("listProductUnavaiable")==null?null:(List<Product>) session.getAttribute("listProductUnavaiable");
                                                Product productUnavaiable = null;
                                                if (listProductUnavaiable != null){
                                                    for (Product p2:
                                                            listProductUnavaiable) {
                                                        if (p2.getId() == p.getId()){
                                                            productUnavaiable = p;
                                                        }
                                                    }
                                                }

                                %>
                                <form action="./editcart" method="get" id="form_edit_cart">
                                    <div style="position: relative;width: 100%;height: auto;">
                                        <div class="cart-product-item" id="product-item-<%=item.getId()%>">
                                            <div class="cart-product-name">
                                                <img src="<%=p.getImage().get(0).getUrl()%>" width="32" height="32">
                                                <h5><%=p.getName()%> (<%=p.getPriceSize().get(0).getSize()%>)</h5>
                                                <input class="product-modal-id" type="text" name="<%=item.getId()%>"
                                                       value="<%=item.getId()%>" checked="checked">
                                            </div>
                                            <div>
                                                <div>Giá: <p
                                                        class="cart-product-detail-price"><%= new CurrencyFormat().format((int) item.getProduct().getPriceSize().get(0).getPrice())%>
                                                </p></div>
                                            </div>
                                            <div class="cart-product-detail justify-content-between">
                                                <div class="detail">Topping:
                                                    <%
                                                        if (p.getTopping().size() > 0) {
                                                            for (Topping tp : p.getTopping()) {
                                                    %>
                                                    <p class="topping-item"><%=tp.getName()%></p>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </div>
                                                <div class="cart-product-quantity">
                                                    <input onchange="$('#form_edit_cart').submit()" name="quantityChange<%=item.getId()%>"
                                                           class="cart-quantity-input quantity" type="number"
                                                           min="0"
                                                           value="<%=item.getQuantity()%>">
                                                    <input onchange="$('#form_edit_cart').submit()" style="display: none" type="checkbox" name="removeProduct" id="remove-product<%=item.getId()%>" value="<%=item.getId()%>" />
                                                    <label for="remove-product<%=item.getId()%>"><i class="fa fa-close"></i></label>
                                                </div>
                                            </div>
                                            <div class="cart-product-price" id="totalPriceProduct<%=item.getId()%>">
                                                <%=new CurrencyFormat().format((int) item.getPrice())%>
                                            </div>
                                        </div>
                                        <%if (productUnavaiable != null ){%>
                                        <div id="overlay-cart-item" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%; background-color: rgba(0,0,0,0.5);z-index: 2;">

                                            <div id="text-overlay-cart-item" style="position: absolute;
                                            height: 40%;
                                            width: 100%;
                                            background-color: #1fa198;
                                              top: 80%;
                                              left: 50%;
                                              font-size: 14px;
                                              color: white;
                                              text-align: center;
                                              transform: translate(-50%,-50%);
                                              -ms-transform: translate(-50%,-50%);">
                                                <span >Mặt hàng không còn khả dụng</span>
                                                <a href="editcart?rpID=<%=item.getId()%>" style="color: red">Hủy</a>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>

                                    <%
                                            }
                                        }
                                    %>
                                </form>
                                <div class="cart-product-total">
                                    <div class="total">
                                        Tổng tiền: <span id="price_decreased"
                                            class="price"> <%=new CurrencyFormat().format((int) cart.getTotalMoney())%></span>
                                    </div>
                                    <a href="./checkout" class="btn-pay">Thanh toán</a>
                                </div>
                                <%
                                    } else {


                                %>
                                <div class="cart-product-total">
                                    <div class="total">
                                        Tổng tiền: <span
                                            class="price"> <%=new CurrencyFormat().format(0)%></span>
                                    </div>
                                    <a href="./checkout" class="btn-pay">Thanh toán</a>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row spad end-page">
            <div class="col-lg-12">

                <div class="product__pagination">
                    <%
                        int count = (int) request.getAttribute("endPage");
                        for (int i = 1; i <= count; i++) {
                    %>
                    <a class="<%=(int) request.getAttribute("pageIndex") == i? "active" : ""%>"
                       href="shop?index=<%=i%>"><%=i%>
                    </a>
                    <%}%>
                </div>

            </div>
        </div>
    </div>
    </div>

</section>
<!-- Shop Section End -->

<!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
<!-- Footer Section End -->


<!-- /.modal-dialog -->
<!-- /.modal -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/cart.js" defer></script>
<script src="js/modal.js" defer></script>
<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"--%>
<%--        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">--%>
<%--</script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>
    $("#form_edit_cart").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function (data) {
                let dataArr = data.split("|");
                let remove = dataArr[0];
                if(remove=="remove") {
                    $("#product-item-"+dataArr[1]).remove();
                    var priceCart = parseInt(dataArr[2]);
                    $('#price_decreased').html(priceCart.toLocaleString("vi-VN", { style: "currency", currency: "VND" }));
                } else {
                    var dataObject = JSON.parse(data);
                    for(var i = 0; i < dataObject.length; i++) {
                        var id = dataObject[i].id;
                        var price = dataObject[i].price;
                        $('#totalPriceProduct'+id).text(price.toLocaleString("vi-VN", { style: "currency", currency: "VND" }));
                    }
                    var cartPrice = dataObject[dataObject.length-1].priceCart;
                    $('#price_decreased').html(cartPrice.toLocaleString("vi-VN", { style: "currency", currency: "VND" }));
                }
            },
            error: function (data) {
                console.log('An error occurred.' + data);
            },
        });
    });

</script>
</body>

</html>