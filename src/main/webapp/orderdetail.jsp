<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %><%--
  Created by IntelliJ IDEA.
  User: tinh
  Date: 12/15/2022
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Chi tiết đơn hàng</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet"/>

    <!-- Css Styles -->
    <%@include file="css.jsp" %>
    <link rel="stylesheet" href="css/cart.css" type="text/css">
</head>

<body>

<%
    Order order = (Order) request.getAttribute("order");
    List<Item> list = null;
    if (order != null) {
        list = order.getListItems();
    }
    String logisticId = (String) request.getAttribute("logisticId");

%>

<style>

</style>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
            <a href="login-register.html">Đăng nhập</a>
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""/></a>
        <a href="#"><img src="img/icon/heart.png" alt=""/></a>
        <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
        <div class="price">0 vnđ</div>
    </div>
    <div id="mobile-menu-wrap"></div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<div class="container">
    <div class="breadcumb">
        <h1 id="h1_title">Chi tiết đơn hàng</h1>
        <img src="assets/images/icon_tealeaves.png" width="500px" height="50px" style="object-fit: cover; scale: 0.5"/>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Order detail Section Begin -->
<section class="cart">
    <div class="container-fluid">
        <div class="container">
            <%
            if(order != null){
            %>
            <!-- Title -->
            <div class="d-flex justify-content-between align-items-center py-3">
                <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> Order #<%=order.getId()%></h2>
            </div>

            <!-- Main content -->
            <div class="row">
                <div class="col-lg-8">
                    <!-- Details -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="mb-3 d-flex justify-content-between">
                                <div>
                                    <span class="me-3"><%=order.getTime()%></span>
                                    <span class="me-3">#<%=order.getId()%></span>
                                    <span class="badge rounded-pill bg-info">
                                        <%=order.getStatus() == 0 ? "Đang chờ" : order.getStatus() == 1 ? "Đã xác nhận" : order.getStatus() == 2 ? "Đã vận chuyển" :
                                                        order.getStatus() == 3 ? "Thành công" : "Đã huỷ"%>
                                    </span>
                                </div>
                                <div class="d-flex">
                                    <button class="btn btn-link p-0 me-3 d-none d-lg-block btn-icon-text" id="print-btn"><i class="fa-solid fa-download"></i><span class="text">Xuất hoá đơn</span></button>
                                </div>
                            </div>
                            <table class="table table-borderless">
                                <tbody>
                                <%
                                    int subtotal = 0;
                                if (list!=null) {
                                    for(Item item : list) {
                                        subtotal +=(int) item.getPrice();
                                %>
                                <tr class="tr">
                                    <td>
                                        <div class="d-flex mb-2">
                                            <div class="flex-shrink-0">
                                                <img src="<%=item.getProduct().getMainImage().getUrl()%>" alt="" width="35" class="img-fluid">
                                            </div>
                                            <div class="flex-lg-grow-1 ms-3">
                                                <h6 class="small mb-0"><a href="#" class="text-reset"><%=item.getProduct().getName()%> <strong> Size: </strong>
                                                    <span ><%=item.getProduct().getPriceSize().get(0).getSize()%></span>
                                                </a></h6>
                                                <span class="small">Topping:
                                                <%
                                                    List<Topping> toppings = item.getProduct().getTopping();
                                                    if(toppings.size() > 0){
                                                   for(Topping topping : toppings){
                                               %>
                                                <%=topping.getName() + ", "%>
                                                <%}}%>
                                                    </span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><%=item.getQuantity()%></td>
                                    <td class="text-end"><%=new CurrencyFormat().format((int) item.getPrice())%></td>
                                </tr>
                                <%}}%>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="2">Tạm tính</td>
                                    <td class="text-end"><%=new CurrencyFormat().format((int) subtotal)%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Tiền vận chuyển</td>
                                    <td class="text-end" id="moneyLogisticTD" >---</td>
                                </tr>

                                <tr>
                                    <td colspan="2">Thời gian vận chuyển</td>
                                    <td class="text-end" id="timeLogisticTD" >---</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Giảm giá (Code: <%=order.getCoupon() != null ? order.getCoupon().getCode(): ""%>)</td>
                                    <td class="text-danger text-end">-<%=order.getCoupon() != null ? order.getCoupon().getPercent() + "%" : "0%"%></td>
                                </tr>
                                <tr class="fw-bold">
                                    <td colspan="2">Tổng giá</td>
                                    <td class="text-end"><%=new CurrencyFormat().format((int) order.getTotal())%></td>
                                </tr>
                                </tfoot>
                            </table>
                            <div class="progress-track" id="progress-bar">
                                <%
                                if(order.getStatus() != 4) {
                                %>
                                <ul id="progressbar">
                                    <li class="step0 <%=order.getStatus() >=0? "active" : ""%> " id="step1">Đang chờ</li>
                                    <li class="step0 <%=order.getStatus() >=1? "active" : ""%> text-center" id="step2">Đã nhận đơn</li>
                                    <li class="step0 <%=order.getStatus() >=2? "active" : ""%> text-right" id="step3">Đang giao</li>
                                    <li class="step0 <%=order.getStatus() >=3? "active" : ""%> text-right" id="step4">Thành công</li>
                                </ul>

                                <%} else {%>
                                <ul id="progressbar" style="padding-left: 170px;">
                                    <li class="step0 active " id="step5">Đã nhận</li>
                                    <li class="step0 active text-right" id="step6">Đã huỷ</li>
                                </ul>
                                <%}%>
                            </div>
                        </div>

                    </div>
                    <!-- Payment -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h3 class="h6">Phương thức thanh toán</h3>
                                    <p>Thanh toán khi nhận hàng <br>
                                        Tổng: <%=new CurrencyFormat().format((int)order.getTotal())%> <span class="badge bg-success rounded-pill">PAID</span></p>
                                </div>
                                <div class="col-lg-6">
                                    <h3 class="h6">Địa chỉ giao hàng</h3>
                                    <address>
                                        <strong><%=order.getName()%></strong><br>
                                        <%=order.getAddress()%><br>
                                        <abbr title="Phone">P:</abbr> <%=order.getPhone()%>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!-- Customer Notes -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="h6">Ghi chú của khách hàng</h3>
                            <p><%=order.getNote()%>.</p>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <!-- Shipping information -->
                        <div class="card-body">
                            <h3 class="h6">Thông tin vận chuyển</h3>
                            <strong>FedEx</strong>
                            <span><a href="#" class="text-decoration-underline" target="_blank">FF1234567890</a> <i class="bi bi-box-arrow-up-right"></i> </span>
                            <hr>
                            <h3 class="h6">Địa chỉ</h3>
                            <address>
                                <strong><%=order.getName()%></strong><br>
                               <span id="orderAddress"><%=order.getAddress()%></span> <br>
                                <abbr title="Phone">P:</abbr> <%=order.getPhone()%>
                            </address>
                        </div>

                    </div>
                    <% if (order.getStatus() == 0 || order.getStatus() == 1) { %>
                    <form method="post" action="./cancel" id="form-cancel">
                        <input hidden name="orderid" value="<%=order.getId()%>">
                        <button type="submit" class="primary-btn text-center" style="display: block;margin: 0 auto;">Hủy đơn</button>
                    </form>
                    <% }%>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>



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

<script src="js/jquery-3.6.0.min.js"></script>

<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/cart.js"></script>
<script src="js/account/bootstrap.min.js"></script>

<script>
    <% String error = (String) session.getAttribute("errorCancelOrder");
      if(error !=null){
        if(error.equals("101")) {
    %>
    alert('Đơn hàng đã đang vận chuyển, thành công, hoặc đã huỷ');
    <%} session.setAttribute("errorCancelOrder",null);}%>

    const printBtn = document.getElementById("print-btn");

    printBtn.addEventListener("click", function() {
        var header = document.getElementById("header");
        var footer = document.getElementById("footer");
        var title = document.getElementById("h1_title");
        var progress = document.getElementById("progress-bar");
        var cancel = document.getElementById("form-cancel");

         title.innerHTML = "Phiếu thanh toán";
        header.style.display = "none";
        footer.style.display = "none";
        progress.style.display = "none";
        cancel.style.display = "none";

        window.print();
        title.innerHTML = "Chi tiết đơn hàng";
        header.style.display = "block";
        footer.style.display = "block";
        progress.style.display = "block";
        cancel.style.display = "block";

    });

    // logistic script

    <%if (logisticId.length()>0){%>


    jQuery(function (){
        const callAPI = async ()=> {
            await fetch('http://140.238.54.136/api/auth/login', {
                method: "POST", // *GET, POST, PUT, DELETE, etc.
                mode: "cors", // no-cors, *cors, same-origin
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(
                    {
                        email: 'thaha8788@gmail.com',
                        password: '123456'
                    }
                )
            })
                .then((response) => {
                    return response.json()
                })
                .then((data) => {
                    const accessToken = data.access_token
                    localStorage.setItem('accessToken', accessToken)
                })
            var details = {
                'id': '${logisticId.toString()}'
            };

            var formBody = [];
            for (var property in details) {
                var encodedKey = encodeURIComponent(property);
                var encodedValue = encodeURIComponent(details[property]);
                formBody.push(encodedKey + "=" + encodedValue);
            }
            formBody = formBody.join("&");
            await fetch('http://140.238.54.136/api/getInfoTransport', {
                method: "POST", // *GET, POST, PUT, DELETE, etc.
                // mode: "cors",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                    "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                },body: formBody
            })
                .then((response) => {
                    return response.json()
                })
                .then((datas) => {
                    const moneyLogistic = datas.data[0].fee;
                    let moneyLogisticTD = $('#moneyLogisticTD')[0]
                    moneyLogisticTD.textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(moneyLogistic)


                    let timeLogistic = datas.data[0].leadTime;
                    let timeLogisticTD = $('#timeLogisticTD')[0]

                    const date = new Date(parseInt(timeLogistic) * 1000);
                    timeLogisticTD.textContent=date.toLocaleTimeString('vi-VN', {hour12: true})+", "+ date.toLocaleDateString('vi-VN');


                })
        }
        callAPI()


    })
   <%}else if(order.getStatus() <4){%>
    jQuery(function () {

        var numOfSizeM = 0;
        var numOfSizeL = 0;
        // Thông tin nơi giao hàng và size sản phẩm có thể chỉnh
        var idProvinceFrom =202;
        var idWardFrom = 90737;
        var idDistrictFrom = 3695;
        //
        var idProvinceTo =202;
        var idWardTo = 0;
        var idDistrictTo = 0;

        const sizeM = {
            size :'M',
            height: 15,
            width: 8,
            length: 8,
            weight: 55
        }
        const sizeL = {
            size :'L',
            height: 17,
            width: 10,
            length: 10,
            weight: 65
        }
        const listTR = document.getElementsByClassName('tr');
        let arrTR =Array.from(listTR)

        arrTR.map((tr,index)=>{
            const sizeText = tr.getElementsByTagName("span")[0];
            const quantityText =  tr.getElementsByTagName("td")[1];


            if (sizeText.textContent===sizeM.size){
                numOfSizeM += parseInt(quantityText.textContent);
            }else if (sizeText.textContent===sizeL.size){
                numOfSizeL += parseInt(quantityText.textContent);
            }
        })

        //--------------------------
        //--------------------------
        // What to do when the response is ready




        const orderAddress = $('#orderAddress');
        const addressText=  orderAddress[0].textContent;

        const districtText = addressText.split('-')[2]
        const wardText = addressText.split('-')[3]


        const callAPI = async ()=>{
            await fetch('http://140.238.54.136/api/auth/login', {
                method: "POST", // *GET, POST, PUT, DELETE, etc.
                mode: "cors", // no-cors, *cors, same-origin
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(
                    {
                        email: 'thaha8788@gmail.com',
                        password: '123456'
                    }
                )
            })
                .then((response) => {
                    return response.json()
                })
                .then((data) => {
                    const accessToken = data.access_token
                    localStorage.setItem('accessToken', accessToken)
                })
            await  fetch('http://140.238.54.136/api/district'+"?provinceID="+idProvinceTo, {
                method: "GET", // *GET, POST, PUT, DELETE, etc.
                mode: "cors", // no-cors, *cors, same-origin
                headers: {
                    "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                },
            })
                .then((response) => {
                    return response.json()
                })
                .then((data) => {
                    let districtDatas =  data.original.data;
                    districtDatas.map((district,index)=>{
                        if (district.DistrictName === districtText){
                            idDistrictTo = parseInt(district.DistrictID)


                        }
                    })
                })

            await fetch('http://140.238.54.136/api/ward'+"?districtID="+idDistrictTo, {
                method: "GET", // *GET, POST, PUT, DELETE, etc.
                mode: "cors", // no-cors, *cors, same-origin
                headers: {
                    "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                },
            })
                .then((response) => {
                    return response.json()
                })
                .then((data) => {
                    let wardDatas =  data.original.data;

                    wardDatas.map((ward,index)=>{
                        if (ward.WardName === wardText) {

                            idWardTo = parseInt(ward.WardCode)

                        }
                    })
                })
            var details = {
                'from_district_id': idDistrictFrom,
                'from_ward_id':idWardFrom,
                'to_district_id':idDistrictTo,
                'to_ward_id':idWardTo,
                'height':(sizeM.height*numOfSizeM)+(sizeL.height*numOfSizeL),
                'length':(sizeM.length*numOfSizeM)+(sizeL.length*numOfSizeL),
                'width':(sizeM.width*numOfSizeM)+(sizeL.width*numOfSizeL),
                'weight':(sizeM.weight*numOfSizeM)+(sizeL.weight*numOfSizeL)
            };

            var formBody = [];
            for (var property in details) {
                var encodedKey = encodeURIComponent(property);
                var encodedValue = encodeURIComponent(details[property]);
                formBody.push(encodedKey + "=" + encodedValue);
            }
            formBody = formBody.join("&");
            await fetch('http://140.238.54.136/api/calculateFee', {
                method: "POST", // *GET, POST, PUT, DELETE, etc.
                // mode: "cors",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                    "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                },body: formBody
            })
                .then((response) => {
                    return response.json()
                })
                .then((datas) => {
                    let moneyLogistic =  datas.data[0].service_fee;
                    let moneyLogisticTD = $('#moneyLogisticTD')[0]
                    moneyLogisticTD.textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(moneyLogistic)

                })

            await fetch('http://140.238.54.136/api/leadTime', {
                method: "POST", // *GET, POST, PUT, DELETE, etc.
                // mode: "cors",
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                    "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                },body: formBody
            })
                .then((response) => {
                    return response.json()
                })
                .then((datas) => {
                    let timeLogistic = datas.data[0].timestamp;
                    let timeLogisticTD = $('#timeLogisticTD')[0]

                    const date = new Date(parseInt(timeLogistic) * 1000);
                    timeLogisticTD.textContent=date.toLocaleTimeString('vi-VN', {hour12: true})+", "+ date.toLocaleDateString('vi-VN');
                })
        }

        callAPI()

    })
    <%}%>


</script>
</body>

</html>
