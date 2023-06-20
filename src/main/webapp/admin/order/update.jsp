<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<c:set var="object" value="${requestScope['object']}" scope="request"/>
<c:set var="logisticId" value="${requestScope['logisticId']}" scope="request"/>
<head>
    <meta charset="utf-8"/>
    <title>Đơn hàng #${object.id}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="../../assets/images/favicon.ico">

    <!-- third party css -->
    <link href="../../assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css"/>
    <!-- third party css end -->

    <!-- App css -->
    <link href="../../assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style"/>
    <link href="../../assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style"/>

</head>

<body class="loading"
      data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false }'>
<!-- data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}' -->
<!-- Begin page -->
<div class="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <%@include file="../left-menu.jsp" %>
    <!-- Left Sidebar End -->
    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">
            <!-- Topbar Start -->
            <%@include file="../topbar.jsp" %>
            <!-- end Topbar -->

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a
                                            href="${pageContext.request.contextPath}/admin/product/create">Đơn hàng</a>
                                    </li>
                                    <li class="breadcrumb-item active">#${object.id}</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Chi tiết đơn hàng</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row justify-content-center">
                    <div class="col-lg-7 col-md-10 col-sm-11">
                        <div class="horizontal-steps mt-4 mb-4 pb-5">
                            <div class="horizontal-steps-content" id="step">
                                <div class="step-item ${object.status eq 0 ?"current" : ""}">
                                    <span data-toggle="tooltip" data-placement="bottom" title="">Đã tiếp nhận</span>
                                </div>
                                <c:if test="${object.status eq 4}">
                                    <div id="step-0" class="step-item ${object.status eq 4 ?"current" : ""}">
                                        <span>Đã hủy</span>
                                    </div>
                                </c:if>
                                <c:if test="${object.status ne 4}">
                                    <div id="step-1" class="step-item ${object.status eq 1 ?"current" : ""}">
                                        <span>Đang chuẩn bị</span>
                                    </div>
                                    <div id="step-2" class="step-item ${object.status eq 2 ?"current" : ""}">
                                        <span>Đang vận chuyển</span>
                                    </div>
                                    <div id="step-3" class="step-item ${object.status eq 3 ?"current" : ""}">
                                        <span>Thành công</span>
                                    </div>
                                </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${object.status eq 0}">
                                    <c:set var="line" value="0"/>
                                </c:when>
                                <c:when test="${object.status eq 1}">
                                    <c:set var="line" value="33.33"/>
                                </c:when>
                                <c:when test="${object.status eq 2}">
                                    <c:set var="line" value="66.66"/>
                                </c:when>
                                <c:when test="${object.status eq 3}">
                                    <c:set var="line" value="100"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="line" value="100"/>
                                </c:otherwise>
                            </c:choose>
                            <div id="process-line" class="process-line" style="width: ${line}%;"></div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-4">
                    <form method="post" id="update_status" action="UpdateStatusController">
                        <input type="hidden" name="id" id="id" value="${object.id}">
                        <input type="hidden" name="status" id="status" value="${object.status +1}">
                        <input type="hidden" name="logisticId" id="logisticId" value="">

                        <button type="submit" id="status-1" class="btn btn-info ${object.status eq 0 ? "" :"d-none"}">
                            Bắt đầu chuẩn bị
                        </button>
                        <button type="button" id="status-2" class="btn btn-info ${object.status eq 1 ? "" :"d-none"}">
                            Bàn giao cho bên vận chuyển
                        </button>
                        <button type="submit" id="status-3"
                                class="btn btn-success ${object.status eq 2 ? "" :"d-none"}">Hoàn tất
                        </button>
                        <c:if test="${object.status ne 4 && object.status ne 3}">
                            <button type="button" id="delete_order" class="btn btn-danger ">
                                Hủy đơn hàng
                            </button>
                        </c:if>
                    </form>
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-3">Các sản phẩm của #${item.id}</h4>

                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead class="thead-light">
                                        <tr>
                                            <th>Tên</th>
                                            <th>Size</th>
                                            <th>Số lượng</th>
                                            <th>Giá</th>
                                            <th>Topping</th>
                                            <th>Tổng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:set var="priceProductTotal" value="${0}" scope="request"/>

                                        <c:forEach items="${object.listItems}" var="item">
                                            <tr class="tr">


                                                <td>${item.product.name}</td>
                                                <td>${item.product.priceSize[0].size}</td>
                                                <td>${item.quantity}</td>
                                                <td>
                                                    <fmt:formatNumber type="currency"
                                                                      value="${item.product.priceSize[0].price}"
                                                                      currencySymbol="đ"/>
                                                </td>
                                                <td>

                                                    <c:forEach var="topping" items="${item.product.topping}">
                                                        ${topping.name} | <fmt:formatNumber type="currency"
                                                                                            value="${topping.price}"
                                                                                            currencySymbol="đ"/> <br>
                                                    </c:forEach>

                                                </td>
                                                <td><fmt:formatNumber type="currency"
                                                                      value="${item.price}"
                                                                      currencySymbol="đ"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->

                            </div>
                            <div class="card-body">
                                <h4 class="header-title mb-3">Ghi chú</h4>

                                <p class="text-primary">
                                    ${object.note}
                                </p>
                                <!-- end table-responsive -->

                            </div>
                        </div>
                    </div> <!-- end col -->

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-3">Tổng đơn hàng</h4>
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead class="thead-light">
                                        <tr>
                                            <th>Mục</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>

                                            <td>Tổng giá sản phẩm</td>
                                            <td><fmt:formatNumber type="currency"
                                                                  value="${object.total}"
                                                                  currencySymbol="đ"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  >Phí vận chuyển</td>
                                            <td id="moneyLogisticTD">---</td>
                                        </tr>
                                        <tr>
                                            <th>Tổng:</th>
                                            <th><fmt:formatNumber type="currency"
                                                                  value="${object.total}"
                                                                  currencySymbol="đ"/></th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->

                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-3">Thông tin vận chuyển</h4>

                                <h5>${object.name}</h5>

                                <address class="mb-0 font-14 address-lg">
                                    <span id="orderAddress">${object.address}</span> <br>
                                    <abbr title="Phone">Số điện thoại: </abbr>${object.phone}
                                </address>

                            </div>
                        </div>
                    </div> <!-- end col -->

                </div>
                <!-- end row -->
            </div> <!-- container -->
        </div>
        <!-- content -->

        <!-- Footer Start -->
        <%@include file="../footer.jsp" %>
        <!-- end Footer -->

    </div>
    `

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<%@include file="../right-sidebar.jsp" %>
<!-- /Right-bar -->

<!-- bundle -->
<script src="../../assets/js/vendor.min.js"></script>
<script src="../../assets/js/app.min.js"></script>

<!-- third party js -->
<script src="../../assets/js/vendor/apexcharts.min.js"></script>
<script src="../../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
<script src="../js/alert.js"></script>
<!-- third party js ends -->
<script type="text/javascript">
    $("#delete_order").click(function () {
        if (confirm("Bạn muốn hủy đơn hàng")) {
            $('#status').val(4)
            $("#update_status").submit();
        }
    })
    $("#update_status").submit(function (e) {
        e.preventDefault();

        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function (data) {
                $("#step").children().removeClass("current");
                if (1 == data) {
                    $("#process-line").css("width", "33.33%");
                    $("#step-1").addClass("current");
                    $("#status-1").remove();
                    $("#status-2").removeClass("d-none");
                    $("#status").val("2");
                    alert_popup("info", "Đơn hàng đang chuẩn bị");
                } else if (2 == data) {
                    $("#process-line").css("width", "66.66%");
                    $("#step-2").addClass("current");
                    $("#status-2").remove();
                    $("#status-3").removeClass("d-none");
                    $("#status").val("3");
                    alert_popup("info", "Đơn hàng đang được gửi đi");
                } else if (3 == data) {
                    $("#process-line").css("width", "100%");
                    $("#status-3").remove();
                    $("#delete_order").remove();
                    $("#step-3").addClass("current");
                    alert_popup("success", "Đơn hàng thành công");
                } else if (4 == data) {
                    alert_popup("danger", "Đơn hàng đã hủy");
                }
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data);
            },
        });
    });

    <c:if test="${logisticId.toString().length() ne 0}">
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


                })
        }
        callAPI()


    })
    </c:if>
    <c:if test="${logisticId.toString().length() eq 0}">
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
            const sizeText = tr.getElementsByTagName("td")[1];
            const quantityText =  tr.getElementsByTagName("td")[2];


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
        const addressText=  orderAddress[0].childNodes[0].textContent;
        const districtText = addressText.split('-')[2]
        const wardText = addressText.split('-')[3]
        console.log(wardText + districtText)
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
           await $("#status-2").click(function () {
                // logisticId

                const registerLogistic = async ()=>{
                    await fetch('http://140.238.54.136/api/registerTransport', {
                        method: "POST", // *GET, POST, PUT, DELETE, etc.
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                            "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                        },body: formBody
                    })
                        .then((response) => {
                            return response.json()
                        })
                        .then((datas) => {
                            let logistic =  datas.Transport;
                            const inputLogistic = document.getElementById('logisticId')
                            inputLogistic.value =  logistic.id
                            console.log( logistic.id)
                        })

                    await $("#update_status").submit();

                }
                registerLogistic()

            })
        }

        callAPI()

    })
    </c:if>



</script>
</body>

</html>