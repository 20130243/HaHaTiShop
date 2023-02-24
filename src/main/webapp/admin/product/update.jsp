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
                                            href="<c:out value="${pageContext.request.contextPath}"/>/admin/product">Sản
                                        phẩm</a></li>
                                    <li class="breadcrumb-item active">${object.name}</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Sản phẩm</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Cập nhật sản phẩm</h4>
                                <form id="update_form" action="/admin/product/update" method="post"
                                      enctype='multipart/form-data' class=""
                                      data-plugin="dropzone" data-previews-container="#file-previews"
                                      data-upload-preview-template="#uploadPreviewTemplate">
                                    <input type="text" name="id" id="id" value="${object.id}"
                                           class="d-none ">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                <label for="name">Tên sản phẩm</label>
                                                <input type="text" id="name" class="form-control" name="name"
                                                       value="<c:out value="${object.name}"/> ">
                                            </div>
                                            <div class="form-group mb-3 myAwesomeDropzone dropzone">
                                                <!-- File Upload -->
                                                <div class="fallback">
                                                    <input name="image" type="file" multiple/>
                                                </div>

                                                <div class="dz-message needsclick">
                                                    <i class="h1 text-muted dripicons-cloud-upload"></i>
                                                    <h3>Drop files here or click to upload.</h3>
                                                    </span>
                                                </div>

                                                <!-- Preview -->
                                                <div class="dropzone-previews mt-3" id="file-previews"></div>

                                                <!-- file preview template -->
                                                <div class="d-none" id="uploadPreviewTemplate">
                                                    <div class="card mt-1 mb-0 shadow-none border">
                                                        <div class="p-2">
                                                            <div class="row align-items-center">
                                                                <div class="col-auto">
                                                                    <img data-dz-thumbnail src="#"
                                                                         class="avatar-sm rounded bg-light" alt="">
                                                                </div>
                                                                <div class="col pl-0">
                                                                    <a href="javascript:void(0);"
                                                                       class="text-muted font-weight-bold"
                                                                       data-dz-name></a>
                                                                    <p class="mb-0" data-dz-size></p>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <!-- Button -->
                                                                    <a href="" class="btn btn-link btn-lg text-muted"
                                                                       data-dz-remove>
                                                                        <i class="dripicons-cross"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <c:forEach var="item" items="${object.image}">
                                                    <div class="">
                                                        <img src="${item.url}" alt="image"
                                                             class="img-fluid avatar-lg">
                                                        <p>Xóa ảnh</p>
                                                        <input type="checkbox" id="switch1" name="check_delete${item.id}" checked data-switch="bool"/>
                                                        <label for="switch1" data-on-label="Giữ"
                                                               data-off-label="Xóa"></label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="category">Phân loại</label>
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
                                                    <label class="custom-control-label" for="checkSize">Có 2
                                                        size</label>
                                                </div>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="price-M">Giá size M</label>
                                                <input type="text" id="price-M" class="form-control" name="price_M"
                                                       value="<fmt:formatNumber type = "number"  pattern="###" value = "${object.priceSize[0].originalPrice}" />">
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="price-L">Giá size L</label>
                                                <input type="text" id="price-L" ${checkSize eq true ? "" : "disabled"}
                                                       class="form-control"
                                                       name="price_L"
                                                       value="<c:if test="${checkSize eq true}"><fmt:formatNumber type = "number"  pattern="###" value = "${object.priceSize[1].price}"/></c:if>">
                                            </div>

                                            <div class=" form-group mb-3">
                                                <label for="status_id">Trạng thái</label>
                                                <select class="custom-select mb-3" name="status" id="status_id">
                                                    <option value="0" ${object.status eq 0 ? "selected" : ""}>Đang bán
                                                    </option>
                                                    <option value="1"${object.status eq 1 ? "selected" : ""}>Giảm giá
                                                    </option>
                                                    <option value="2"${object.status eq 2 ? "selected" : ""}>Hết hàng
                                                    </option>
                                                    <option value="3"${object.status eq 3 ? "selected" : ""}>Ngưng bán
                                                    </option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <button id="submit" type="submit" class="btn btn-primary">Cập nhật</button>
                                </form>
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
<script src="../../assets/js/vendor/dropzone.min.js"></script>
<script src="../../assets/js/ui/component.fileupload.js"></script>
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


        $("#submit").click(function () {
            if ($("#image").get(0).files.length !== 0) {
                $("#check_input_file").val("true");
            }
        })

    })
</script>
</body>

</html>