<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="role" scope="request" class="com.example.tmdt.dao.RoleDao"/>
<jsp:useBean id="accountStatus" scope="request" class="com.example.tmdt.dao.AccountStatusDao"/>
<!DOCTYPE html>
<html >

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--favicon -->
    <link href="./img/undraw_profile.svg" rel="icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - User</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="admin-slidebar.jsp"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="admin-topbar.jsp"/>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-2">
                    <h1 class="h3 mb-4 text-gray-800">Quản lý tài khoản</h1>
                </div>

                <div class="mb-2">
                    <a href="javascript:" class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#addUserModal">
                            <span class="icon text-white-50">
                                <i class="fas fa-plus"></i>
                            </span>
                        <span class="text">Thêm mới</span>
                    </a>
                </div>


                <!-- start table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Danh sách tài khoản</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th style="width: 5%">STT.</th>
                                    <th style="width: 5%">Mã tk</th>
                                    <th style="width: 20%">Tài khoản</th>
                                    <th style="width: 35%;">Email</th>
                                    <th style="width: 12%">Vai trò</th>
                                    <th style="width: 15%;">Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="a" items="${listA}" varStatus="count">
                                    <tr class="${a.status == 2 ? "table-active":""}">
                                        <td>${count.count}</td>
                                        <td>${a.userId}</td>
                                        <td>${a.username}</td>
                                        <td>${a.email}</td>
                                        <td>${role.getRoleByRoleId(a.role).role_name}</td>
                                        <td class="status-text">${accountStatus.getStatusAccountByStatusAccountId(a.status).sa_name}</td>
                                        <td class="text-center d-flex justify-content-center">
                                            <div class="dropdown no-arrow">
                                                <a class="dropdown-toggle" href="javascript:" role="button" id="dropdownMenuLink1"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-another fas fa-ellipsis-v fa-sm fa-fw ${a.status == 2 ? "text-gray-700":"text-gray-400"}"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink">
                                                    <div class="dropdown-header">Hành động</div>
                                                    <!-- Divider -->
                                                    <hr class="sidebar-divider my-0">
                                                    <a class="active-account dropdown-item ${a.status == 0 ? "": "disabled"}" href="javascript:" uid="${a.userId}" >Xác nhận tài khoản</a>
                                                    <a class="enable-account dropdown-item ${a.status == 2 ? "":"disabled"}" href="javascript:" uid="${a.userId}">Kích hoạt tài khoản</a>
                                                    <a class="disable-account dropdown-item ${a.status == 1 ? "":"disabled"}" href="javascript:" uid="${a.userId}">Vô hiệu hóa tài khoản</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- end table -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<jsp:include page="admin-logout-modal.jsp"/>

<!-- modal add user-->
<div id="addUserModal" class="modal fade" role="dialog">
    <div class="modal-dialog ">

        <!-- Modal content-->
        <div class="modal-content">
            <form style="margin: 0" action="addUser" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Thêm tài khoản</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username"><Strong>Tài khoản</Strong></label>
                        <input type="text" name="username" class="form-control" id="username"  placeholder="Nhập tài khoản">
                    </div>
                    <div class="form-group">
                        <label for="password"><Strong>Mật khẩu</Strong></label>
                        <input type="text" name="password" class="form-control" id="password"  placeholder="Nhập mật khẩu">
                    </div>
                    <div class="form-group">
                        <label for="email"><Strong>Email</Strong></label>
                        <input type="text" name="email" class="form-control" id="email"  placeholder="Nhập email của người dùng">
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber"><Strong>Số điện thoại</Strong></label>
                        <input type="text" name="phoneNumber" class="form-control" id="phoneNumber"  placeholder="Nhập sdt">
                    </div>
                    <div class="form-group">
                        <label for="role"><Strong>Vai trò</Strong></label>
                        <select name="role" id="role" class="form-control">
                            <option value="0">Khách hàng</option>
                            <option value="1">Admin</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-success" >Thêm</button>
                </div>
            </form>
        </div>

    </div>
</div>
<!--//-->

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>

<%--active account--%>
<script>
    $(document).ready(function () {
        $(".active-account").click(function (){
            var id = $(this).attr("uid");
            var status_text = $(this).closest("tr").find(".status-text");
            var active_btn = $(this).closest("tr").find(".active-account");
            var disable_btn = $(this).closest("tr").find(".disable-account");
            if(confirm("Bạn có chắc chắn muốn xác nhận tài khoản này?")){
                $.ajax({
                    url: '/tmdt_war_exploded/admin/activeAccount',
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        status_text.html("Đã kích hoạt");
                        setTimeout(function(){
                            active_btn.addClass("disabled");
                            disable_btn.removeClass("disabled");
                        },10)
                    },
                    error: function (data){
                        if(data.status == 404){
                            alert("Active fail!");
                        }
                    }

                });

            }
        });

    });

</script>
<%--//--%>

<%--disable account--%>
<script>
    $(document).ready(function () {
        $(".disable-account").click(function (){
            var id = $(this).attr("uid");
            var status_text = $(this).closest("tr").find(".status-text");
            var disable_btn = $(this).closest("tr").find(".disable-account");
            var enable_btn = $(this).closest("tr").find(".enable-account");
            var active_btn = $(this).closest("tr").find(".active-account");
            var tr = $(this).closest("tr");
            var icon = $(this).closest("tr").find(".icon-another");
            if(confirm("Bạn có chắc chắn muốn vô hiệu hóa tài khoản này?")){
                $.ajax({
                    url: '/tmdt_war_exploded/admin/disableAccount',
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        status_text.html("Vô hiệu hóa");
                        setTimeout(function(){
                            enable_btn.removeClass("disabled");
                            disable_btn.addClass("disabled");
                            active_btn.addClass("disabled")
                            tr.addClass("table-active");
                            icon.removeClass("text-gray-400").addClass("text-gray-700");
                        },10)
                    },
                    error: function (data){
                        if(data.status == 404){
                            alert("Disable account fail!");

                        }
                    }

                });

            }
        });

    });

</script>
<%--//--%>

<%--enable account--%>
<script>
    $(document).ready(function () {
        $(".enable-account").click(function (){
            var id = $(this).attr("uid");
            var status_text = $(this).closest("tr").find(".status-text");
            var disable_btn = $(this).closest("tr").find(".disable-account");
            var enable_btn = $(this).closest("tr").find(".enable-account");
            var active_btn = $(this).closest("tr").find(".active-account");
            var tr = $(this).closest("tr");
            var icon = $(this).closest("tr").find(".icon-another");
            if(confirm("Bạn có chắc chắn muốn kích hoạt tài khoản này?")){
                $.ajax({
                    url: '/tmdt_war_exploded/admin/enableAccount',
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        status_text.html("Đã kích hoạt");
                        setTimeout(function(){
                            enable_btn.addClass("disabled");
                            disable_btn.removeClass("disabled");
                            active_btn.addClass("disabled")
                            tr.removeClass("table-active");
                            icon.removeClass("text-gray-700").addClass("text-gray-400");
                        },10)
                    },
                    error: function (data){
                        if(data.status == 404){
                            alert("Enable account fail!");
                        }
                    }

                });

            }
        });

    });

</script>
<%--//--%>



</body>

</html>
