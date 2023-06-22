<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="object" value="${requestScope['object']}" scope="request"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>${object.name}</title>
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
                                            href="${pageContext.request.contextPath}/admin/staff">Nhân viên</a></li>
                                    <li class="breadcrumb-item active"> ${object.name}</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Nhân viên</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">Cập nhật tài khoản nhân viên</h4>
                                <form id="create_staff" action="${pageContext.request.contextPath}/admin/staff/update" method="post"
                                      enctype='multipart/form-data'>
                                    <input type="hidden" name="id" id="id"
                                           value="${object.id}">
                                    <div class="form-group mb-3">
                                        <label for="name">Tên </label>
                                        <input type="text" id="name" name="name" required class="form-control"
                                               value="${object.name}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="username">Tên đăng nhập<span class="text-danger"
                                                                                 id="username_error"></span></label>
                                        <input type="text" id="username" name="username" required class="form-control"
                                               value="${object.username}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="email">Email<span class="text-danger"
                                                                      id="email_error"></span></label>
                                        <input type="text" id="email" name="email" required class="form-control"
                                               value="${object.email}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="phone">Số điện thoại<span class="text-danger"
                                                                              id="phone_error"></span></label>
                                        <input type="text" id="phone" name="phone" required class="form-control"
                                               value="${object.phone}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="level">Cấp bậc</label>
                                        <select class="custom-select mb-3" id="level" name="level">
                                            <option value="0" ${object.level eq 0 ? "selected" : ""}>Nhân viên</option>
                                            <option value="1" ${object.level eq 1 ? "selected" : ""}>Quản lí</option>
                                            <option value="2" ${object.level eq 2 ? "selected" : ""}>Super Admin
                                            </option>
                                            <option value="-1" ${object.level eq -1 ? "selected" : ""}>Vô hiệu hóa
                                            </option>
                                        </select>
                                    </div>


                                    <button type="submit" class="btn btn-primary">Cập nhật nhân viên</button>
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
<!-- third party js ends -->

<script type="text/javascript">
    $("#create_staff").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function (data) {
                if (data == 1) {
                    window.location.href = "${pageContext.request.contextPath}/admin/staff";
                } else {
                    for (var i = 0; i < data.length; i++) {
                        var errorMessage = data[i];
                        switch (errorMessage) {
                            case "1":
                                $('#username_error').text('  *Tên đăng nhập đã tồn tại.');
                                break;
                            case "2":
                                $('#email_error').text('  *Email đã được sử dụng.');
                                break;
                            case "3":
                                $('#phone_error').text('  *Số điện thoại đã được sử dụng.');
                                break;
                            default:
                                break;
                        }
                    }
                    console.log('Submission was successful.');
                }
                ;
            },
            error: function (data) {
                console.log('An error occurred.');
            },
        });
    });
</script>
</body>

</html>