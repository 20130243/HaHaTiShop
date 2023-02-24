

<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/3/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html >

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
    <style>
        .active{
            background-color: #0acf97;
        }
        .display-hide{
            display: none;
        }
        .page-item-index{
            width: 50px;
            height: 40px;
        }
        .pagination-style-one .page-item {
            margin-right: 20px
        }

        .pagination-style-one .page-item:last-child {
            margin-right: 0
        }

        .pagination-style-one .page-item .page-link:hover {
            background-color: #0acf97;
            color: #fff
        }

        .pagination-style-one .page-item.page-arrow a {
            border-radius: 50%;
            height: 40px;
            width: 40px;
            background: #0acf97;
            color: #fff;
            border-color:#0acf97
        }

        .pagination-style-one .page-item.active a {
            background: #0acf97;
            color: #fff;
            border-color:#0acf97
        }

        .pagination-style-one .page-item a {
            border: 1px solid #0acf97;
            box-sizing: border-box;
            border-radius: 5px;
            font-weight: 700;
            font-size: 16px;
            letter-spacing: .05em;
            color: #2d373c;
            padding: 7px 10px;
            min-height: 40px;
            min-width: 40px
        }

        .pagination-style-one .page-item a:focus {
            box-shadow: none
        }

    </style>
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
<% int pagi = 1 ;%>
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
                        <form action="SearchController" method="get">
                            <input name="search" type="text" placeholder="Tìm kiếm sản phẩm"
                                   style="padding-right:42px ;">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4" style="z-index: 99;">
                        <ul class="menu-drop">
                            <%
                                List<Category> listCategories = (List<Category>) request.getAttribute("listCategories");
                                for (Category category : listCategories) {
                            %>
                            <li class="menu-item <%=(int) request.getAttribute("tagCate") == category.getId() ? "active":""%>">
                                <a href="category?cid=<%=category.getId()%>"><%=category.getName()%> <%=category.getStatus()==1?" (Hết nguyên liệu)" : category.getStatus()==2?" (Ngừng kinh doanh)" : ""%>
                                </a>
                            </li>

                            <%}%>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4" style="z-index: 99;">


                            <select id="filter-sort-tour" style="border: 1px solid #0acf97;">

                                <option selected>Lựa chọn lọc</option>
                                <option value="price-asc">Sắp xếp theo giá tiền tăng dần</option>
                                <option value="price-desc">Sắp xếp theo giá tiền giảm dần</option>
<%--                                <option value="new">Sắp xếp theo theo mới nhất</option>--%>
                            </select>

                    </div>

                </div>

                <div class="row" id="group-item">
                    <%
                        List<Product> list = (List<Product>) request.getAttribute("listProduct");
                        for (Product p : list) {
                    %>
                    <div class="col-lg-3 col-md-4 col-sm-4 proitem">
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
                                <h5><%=p.getName()%>
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
                                <h6><%=currency.format(price)%>
                                </h6>
                            </div>
                        </div>
                        <jsp:include page='/modal.jsp'>
                            <jsp:param name="id" value="<%=p.getId()%>"/>
                        </jsp:include>
                    </div>
                    <button type="button" class="btn btn-primary btn-lg d-none" id="btn-modal<%=p.getId()%>"
                            data-toggle="modal"
                            data-target="#myModal">
                    </button>
                    <% }%>
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
                                %>
                                <form action="/editcart" method="post" id="myForm">
                                    <div class="cart-product-item">
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
                                                <p class="topping-item"><%=tp.getName()%> x <%=item.getQuantity()%>
                                                </p>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </div>
                                            <div class="cart-product-quantity">
                                                <input name="quantityChange<%=item.getId()%>"
                                                       class="cart-quantity-input quantity" type="number"
                                                       value="<%=item.getQuantity()%>">
                                                <a href="editcart?rpID=<%=item.getId()%>" style="border: none"> <i
                                                        class="fa-solid fa-xmark remove"></i></a>
                                            </div>
                                        </div>
                                        <div class="cart-product-price">
                                            <%=new CurrencyFormat().format((int) item.getPrice())%>
                                            * <%=item.getQuantity()%>
                                            = <%=new CurrencyFormat().format((int) item.getPrice())%>
                                        </div>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>
                                </form>
                                <div class="cart-product-total">
                                    <div class="total">
                                        Tổng tiền: <span
                                            class="price"> <%=new CurrencyFormat().format((int) cart.getTotalMoney())%></span>
                                    </div>
                                    <a href="/checkout" class="btn-pay">Thanh toán</a>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row spad">
            <div class="col-lg-12">

                <nav>
                    <ul id="pagination-demo" class="pagination pagination-style-one justify-content-center pt-80">
                    </ul>
                </nav>
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
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" >
    $(document).ready(function () {
        ///start pagination
        let list = $('#group-item');
        let listProducts = list.children(".proitem");
        console.log(listProducts)
        let boundParent = $('#bound-parent');
        let productNum = listProducts.length;
        let displayProduct = 12;
        let paginationNum =  Math.ceil(productNum / displayProduct) ;
        console.log(paginationNum)
        let ulPagination = $('#pagination-demo');
        // let listIndex = ulPagination.children(".page-item-index");

        for (let index = 0; index < paginationNum; index++) {

            if (index ===0) {

                    ulPagination.append(
                        `
                    <li class="page-item page-item-index active">
                        <a class="page-link" href="#" style="text-align: center;" >\${index + 1 } </a>
                     </li>
                    `);


            }else{


                    ulPagination.append(
                        `
                    <li class="page-item page-item-index ">
                        <a class="page-link" href="#" style="text-align: center;" >\${index +1 } </a>
                    </li>
                    `);


            }

        };



        for (let j = 0; j < listProducts.length; j++) {
            listProducts[j].classList.add('display-hide');

        };
        if (ulPagination.children().length > 6) {
            for (let index = 0; index < ulPagination.children().length; index++) {
                ulPagination.children()[index].classList.add('display-hide')

            }
            ulPagination.children()[0].classList.remove('display-hide');
            ulPagination.children()[ulPagination.children().length-1].classList.remove('display-hide');
            ulPagination.children()[1].classList.remove('display-hide');
        }
        function displayItem(listProducts,list,displayProduct,page) {
            page--;
            for (let j = 0; j < listProducts.length; j++) {
                listProducts[j].classList.remove('display-hide');

            }
            for (let j = 0; j < listProducts.length; j++) {
                listProducts[j].classList.add('display-hide');

            }
            let loop_start = displayProduct * page;
            let renderItem = listProducts.slice(loop_start,loop_start+displayProduct);
            for (let index = 0; index < renderItem.length; index++) {
                renderItem[index].classList.toggle('display-hide');
            }
        };
        displayItem(listProducts,list,displayProduct,1);

        $(document).ready(function () {

            $(".page-item-index").click(function (e) {
                let len = ulPagination.children().length;
                let eIndex = 0;
                if (len > 6){
                    for (let index = 0; index < len; index++) {
                        ulPagination.children()[index].classList.add('display-hide')
                        if (ulPagination.children()[index].isEqualNode(e.currentTarget)) {
                            eIndex = index;
                        }
                    }
                    if (eIndex > 0 && eIndex < len-1) {

                        ulPagination.children()[0].classList.remove('display-hide');
                        ulPagination.children()[len-1].classList.remove('display-hide');
                        ulPagination.children()[eIndex].classList.remove('display-hide');
                        ulPagination.children()[eIndex -1].classList.remove('display-hide');
                        ulPagination.children()[eIndex+1].classList.remove('display-hide');
                    }else if(eIndex === 0 && eIndex < len-1) {
                        ulPagination.children()[eIndex+1].classList.remove('display-hide');
                        ulPagination.children()[len-1].classList.remove('display-hide');
                        ulPagination.children()[eIndex].classList.remove('display-hide');
                    }else if(eIndex > 0 && eIndex === len-1){
                        ulPagination.children()[0].classList.remove('display-hide');
                        ulPagination.children()[len-1].classList.remove('display-hide');
                        ulPagination.children()[eIndex].classList.remove('display-hide');
                        ulPagination.children()[eIndex -1].classList.remove('display-hide');

                    }
                }
                for (let k = 0; k < ulPagination.children().length; k++) {
                    ulPagination.children()[k].classList.remove('active')

                }
                e.currentTarget.classList.add('active')
                displayItem(listProducts,list,displayProduct,parseInt(e.currentTarget.innerText));
            });
        });

        //end pagination
        //filter price
        //---
        const filterSortTour = $('#filter-sort-tour');
        filterSortTour.on('change' , function (e) {
            var valueSelected = this.value;
            function convertToMoney(e) {
                var moneyNode = e.getElementsByClassName('product__item__text')[0];
                var moneyText = moneyNode.getElementsByTagName('h6')[0].innerText;
                var moneyTextList = moneyText.split(' ');
                var moneyTextString =parseInt(moneyTextList[0].split('.').join(''));
                return moneyTextString;
            }



            if (valueSelected ==='price-desc') {

                jQuery(function () {
                    const newListProducts = listProducts.sort((a,b) => convertToMoney(b) - convertToMoney(a));

                    list.children().remove()
                    for (let index = 0; index < newListProducts.length; index++) {
                        //     list.append(`${listProducts[index].outerHTML}`)
                        list.children().remove()
                    }
                    for (let i = 0; i < newListProducts.length; i++) {

                        list.append(newListProducts[i].outerHTML)

                    }
                    listProducts = list.children();
                    displayItem(listProducts,list,displayProduct,1)
                })
            }else if (valueSelected === 'price-asc') {
                jQuery(function () {
                    const newListProducts = listProducts.sort((a,b) => convertToMoney(a) - convertToMoney(b));

                    list.children().remove()
                    for (let index = 0; index < newListProducts.length; index++) {
                        //     list.append(`${listProducts[index].outerHTML}`)
                        list.children().remove()
                    }
                    for (let i = 0; i < newListProducts.length; i++) {

                        list.append(newListProducts[i].outerHTML)

                    }
                    listProducts = list.children();
                    displayItem(listProducts,list,displayProduct,1)
                })
            }



        });

        //end filter

    });
</script>
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


<script>
    $(document).ready(function () {
        $(".product__item").click(function (e) {
            var val = this.getAttribute('data-id');
            var s = '#btn-modal' + val;
            $(s).click();
        });
    });






</script>
</body>

</html>
