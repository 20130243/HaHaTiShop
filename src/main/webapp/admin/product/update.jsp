<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<c:set var="object" value="${requestScope['object']}" scope="request"/>


<head>
    <meta charset="utf-8"/>
    <title> ${object.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
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
            <jsp:include page="../topbar.jsp"/>
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
                                            href="<c:out value="${pageContext.request.contextPath}"/>/admin/product">S???n
                                        ph???m</a></li>
                                    <li class="breadcrumb-item active">${object.name}</li>
                                </ol>
                            </div>
                            <h4 class="page-title">S???n ph???m</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">C???p nh???t s???n ph???m</h4>
                                <form id="update_form" action="/admin/product/update" method="post"
                                      enctype="multipart/form-data">
                                    <div class="row">
                                        <input type="hidden" name="id" id="id"
                                               value="${object.id}">
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <label for="name">T??n s???n ph???m</label>
                                                <input type="text" id="name" class="form-control" name="name"
                                                       value="<c:out value="${object.name}"/> ">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="image">???nh</label>
                                                <input type="file" id="image" class="form-control" name="image"
                                                       accept="image/*" multiple>
                                                <br>
                                                <span class="help-block"><small>Gi??? ctrl ho???c shift ????? ch???n nhi???u
                                                            ???nh.</small></span>
                                            </div>
                                            <div class="form-group mb-3 row">
                                                <c:forEach var="item" items="${object.image}">
                                                    <div class=" col">
                                                        <img src="${item.url}" alt="image"
                                                             class="img-fluid avatar-lg">
                                                        <div class="row">
                                                            <input type="checkbox" id="check_delete_${item.id}"
                                                                   name="check_delete_${item.id}" class="old_image"
                                                                   checked
                                                                   data-switch="bool"/>
                                                            <label for="check_delete_${item.id}" data-on-label="Gi???"
                                                                   data-off-label="X??a"></label>
                                                        </div>
                                                        <div class="row">
                                                            <input type="radio" id="image_Radio${item.id}"
                                                                   name="thumbnail" value="${item.id}"
                                                                   class="custom-control-input" ${item.status eq 1 ? "checked" : ""}>
                                                            <label class="custom-control-label"
                                                                   for="image_Radio${item.id}">
                                                                Ch???n l??m thumbnail
                                                            </label>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="category">Ph??n lo???i</label>
                                                <select class="custom-select " id="category" name="category">
                                                    <c:forEach var="item" items="${requestScope['categoryList']}">
                                                        <option value="${item.id}"
                                                                <c:if test="${item.id eq object.idCategory}">
                                                                    <c:out value="selected"/>
                                                                </c:if>
                                                        ><c:out
                                                                value="${item.name}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <c:if test="${fn:length(object.priceSize) eq 2}">
                                            <c:set var="checkSize" value="true"/>
                                        </c:if>
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" class="custom-control-input"
                                                           id="checkSize"
                                                    ${checkSize eq true ? "checked" : ""}
                                                    >
                                                    <label class="custom-control-label" for="checkSize">C?? 2
                                                        size</label>
                                                </div>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="price-M">Gi?? size M</label>
                                                <input type="text" id="price-M" class="form-control" name="price_M"
                                                       value="<fmt:formatNumber type = "number"  pattern="###" value = "${object.priceSize[0].originalPrice}" />">
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="price-L">Gi?? size L</label>
                                                <input type="text"
                                                       id="price-L" ${checkSize eq true ? "" : "disabled"}
                                                       class="form-control"
                                                       name="price_L"
                                                       value="<c:if test="${checkSize eq true}"><fmt:formatNumber type = "number"  pattern="###" value = "${object.priceSize[1].price}"/></c:if>">
                                            </div>

                                            <div class=" form-group mb-3">
                                                <label for="status_id">Tr???ng th??i</label>
                                                <select class="custom-select mb-3" name="status" id="status_id">
                                                    <option value="0" ${object.status eq 0 ? "selected" : ""}>??ang
                                                        b??n
                                                    </option>
                                                    <option value="1"${object.status eq 1 ? "selected" : ""}>Gi???m
                                                        gi??
                                                    </option>
                                                    <option value="2"${object.status eq 2 ? "selected" : ""}>H???t
                                                        h??ng
                                                    </option>
                                                    <option value="3"${object.status eq 3 ? "selected" : ""}>Ng??ng
                                                        b??n
                                                    </option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <button id="submit" type="submit" class="btn btn-primary">C???p nh???t</button>
                                </form>
                            </div>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div> <!-- container -->

    </div> <!-- content -->


</div>
<!-- content -->

<!-- Footer Start -->
<%@include file="../footer.jsp" %>
<!-- end Footer -->
</div>

<!-- ============================================================== -->
<!-- End Page content -->
<!-- ============================================================== -->


<!-- END wrapper -->

<!-- Right Sidebar -->
<jsp:include page="../right-sidebar.jsp"/>
<!-- /Right-bar -->

<!-- bundle -->
<script src="../../assets/js/vendor.min.js"></script>
<script src="../../assets/js/app.min.js"></script>

<!-- third party js -->
<script src="../../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
<script src="../../js/check_upload_image.js"></script>
<!-- third party js ends -->
<script>
    $(document).ready(function () {
        $("#checkSize").click(function () {
            if ($("#checkSize").get(0).checked) {
                $("#price-L").val(<c:if test="${checkSize eq true}"><fmt:formatNumber type = "number"  pattern="###" value = "${object.priceSize[1].price}"/></c:if>);
                $("#price-L").prop('disabled', false);
            } else {
                $("#price-L").val('');
                $("#price-L").prop('disabled', true);
            }
        })

        var $checkbox = $('.old_image');
        var $fileInput = $('#image');

        // Khi checkbox thay ?????i gi?? tr???
        $checkbox.change(function () {
            // N???u checkbox ???????c ch???n, radio button s??? b??? v?? hi???u h??a
            if (!$(this).is(':checked')) {
                $(this).closest('.col').find('input[type=radio]').prop('disabled', true);
            }
            // Ng?????c l???i, radio button s??? ???????c b???t l???i
            else {
                $(this).closest('.col').find('input[type=radio]').prop('disabled', false);
            }
            // L???y danh s??ch checkbox ??ang ???????c check
            var $checkedBoxes = $checkbox.filter(':checked');
            // N???u kh??ng c?? checkbox n??o ???????c check ho???c c?? nhi???u h??n m???t checkbox ???????c check
            if ($checkedBoxes.length !== 0) {
                // Kh??ng ki???m tra input file
                return;
            } else if ($checkedBoxes.length >= 5) {
                alert('Ch??? ???????c upload t???i ??a 5 ???nh');
            }
            // Ki???m tra input file c?? ch???a file n??o kh??ng
            if (!$fileInput.get(0).files.length) {
                // Hi???n th??? th??ng b??o
                alert('Vui l??ng t???i l??n ??t nh???t m???t ???nh.');
                // ?????t gi?? tr??? c???a checkbox tr??? l???i "checked"
                $checkbox.prop('checked', true);
            }
        });
        // Khi inputfile thay ?????i gi?? tr???
        $fileInput.change(function () {
            var $checkedBoxes = $checkbox.filter(':checked');
            // N???u  checkbox ???????c check v?? s??? file l???n h??n 5
            if ($checkedBoxes.length + $fileInput.get(0).files.length <= 5) {
                return;
            }
            // Ki???m tra input file c?? ch???a file n??o kh??ng
            if (!$fileInput.get(0).files.length && $checkedBoxes == 0) {
                // Hi???n th??? th??ng b??o
                alert('Vui l??ng t???i l??n ??t nh???t m???t ???nh.');
            } else {
                alert('Ch??? ???????c upload t???i ??a 5 ???nh');
                $fileInput.val("");
            }
        });
        // Khi submit form
        $("#update_form").submit(function (event) {
            var $checkedBoxes = $checkbox.filter(':checked');
            if ($checkedBoxes.length + $fileInput.get(0).files.length <= 0) {
                alert('Vui l??ng t???i l??n ??t nh???t m???t ???nh.');
                return false;
            } else if ($checkedBoxes.length + $fileInput.get(0).files.length > 5) {
                alert('Ch??? ???????c upload t???i ??a 5 ???nh');
                return false;
            }
            event.preventDefault(); // Ng??n ch???n form submit b??nh th?????ng
            var form_data = new FormData($('#update_form')[0]);
            // var form_data = $('#update_form').serialize();

            $.ajax({
                url: $(this).attr('action'), // L???y URL t??? thu???c t??nh action c???a form
                type: $(this).attr('method'), // L???y method t??? thu???c t??nh method c???a form
                data: form_data, // Serialize form data ????? g???i ??i
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data == "1") {
                        window.location.href = "/admin/product";
                    } else {
                        alert(data);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        });

    });


</script>
</body>

</html>