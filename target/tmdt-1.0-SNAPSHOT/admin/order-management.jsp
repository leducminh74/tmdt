<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="oStatus" scope="request" class="com.example.tmdt.dao.OrderStatusDao"/>
<jsp:useBean id="pay" scope="request" class="com.example.tmdt.dao.PaymentDao"/>
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

    <title>Admin - Order</title>

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
                    <h1 class="h3 mb-4 text-gray-800">Quản lý đơn hàng</h1>
                </div>


                <!-- start table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Danh sách đơn hàng</h6>
                    </div>
                    <c:if test="${sessionScope.acc.role == 1}">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th style="width: 5%">STT.</th>
                                    <th style="width: 5%">Mã ĐH</th>
                                    <th style="width: 5%">Mã KH</th>
                                    <th style="width: 20%">Họ Và Tên</th>
                                    <th style="width: 20%">Số Điện Thoại</th>
                                    <th style="width: 12%">Ngày Đặt Hàng</th>
                                    <th style="width: 15%">Tổng Tiền</th>
                                    <th style="width: 10%">Thanh toán</th>
                                    <th style="width: 15%">Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="o" items="${listOrder}" varStatus="number">
                                    <tr class="${o.status == 4 ? "table-active":""} ${o.status == 5 ? "table-danger":""}  ${o.status == 1 ? "table-warning" : ""}">
                                        <td>${number.count}</td>
                                        <td>${o.id}</td>
                                        <td>${o.account.userId}</td>
                                        <td>${o.fullName}</td>
                                        <td>${o.phoneNumber}</td>
                                        <td>${o.createAt}</td>
                                        <td>$${o.total}</td>
                                        <td>${pay.getPaymentByPaymentId(o.payment).paymentName}</td>
                                        <td class="status-text">${oStatus.getStatusByStatusId(o.status).statusName}</td>
                                        <td class="text-center ">
                                            <div class="dropdown no-arrow">
                                                <a class="dropdown-toggle" href="javascript:" role="button" id="dropdownMenuLink1"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="icon-another fas fa-ellipsis-v fa-sm fa-fw ${o.status >= 4 ? "text-gray-700":"text-gray-400"}"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink">
                                                    <div class="dropdown-header">Hành động</div>
                                                    <!-- Divider -->
                                                    <hr class="sidebar-divider my-0">
                                                    <a class="details-order dropdown-item" href="javascript:"  oId="${o.id}" total="${o.total}">Chi tiết đơn hàng</a>
                                                        <a class="accept-order dropdown-item ${o.status == 1 ? "" : "disabled"}" href="javascript:"  oId="${o.id}">Xác nhận đơn hàng</a>
                                                        <a class="next-step-order dropdown-item ${o.status < 4 ? "" : "disabled" } ${o.status == 1 ? "disabled" : ""}" href="javascript:" oId="${o.id}" oStatus="${o.status}">Chuyển sang giai đoạn tiếp theo</a>
                                                        <a class="cancel-order dropdown-item ${o.status < 4 ? "" : "disabled" }" href="javascript:" oId="${o.id}">Hủy bỏ đơn hàng</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    </c:if>


                    <c:if test="${sessionScope.acc.role == 2}">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th style="width: 5%">STT.</th>
                                        <th style="width: 5%">Mã ĐH</th>
                                        <th style="width: 20%">Tên Sản Phẩm</th>
                                        <th style="width: 12%">Giá</th>
                                        <th style="width: 15%">Số Lượng</th>
                                        <th style="width: 10%">Ngày Đặt Hàng</th>
                                        <th style="width: 15%">Trạng thái</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="oD" items="${listOrderDetail}" varStatus="count">
                                        <tr class="${oD.status == 4 ? "table-active":""} ${oD.status == 5 ? "table-danger":""} ${oD.status == 1 ? "table-warning" : ""}">
                                            <td>${count.count}</td>
                                            <td>${oD.orderId}</td>
                                            <td>${oD.product.name}</td>
                                            <td>${oD.price}</td>
                                            <td>${oD.quantity}</td>
                                            <td>${oD.createAt}</td>
                                            <td>${oStatus.getStatusByStatusId(oD.status).statusName}</td>

                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>

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


<!-- modal order detail -->
<div id="order-detail-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header border-0">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <table class="table table-hover table-striped" >
                    <thead>
                    <tr>
                        <th scope="col">STT.</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Số lượng</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer border-0">
                <h3 class="modal-total"></h3>
            </div>
        </div>

    </div>
</div>

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


<%--order details--%>
<script>
    $(document).ready(function() {
        $('.details-order').click(function () {
            var orderId = $(this).attr("oId");
            var total = $(this).attr("total");
            $.ajax({
                method: "POST",
                url: "/tmdt_war_exploded/admin/orderDetails",
                data: {
                    orderId: orderId
                },
                success: function(data)
                {
                    $('#order-detail-modal').find('.modal-title').html('Chi tiết đơn hàng (Mã đơn hàng: ' + orderId + ')');
                    $('#order-detail-modal').find('tbody').html(data);
                    $('#order-detail-modal').find('.modal-total').html('Tổng cộng: $' + total);
                    $('#order-detail-modal').modal('show');
                }
            });

        })
    })
</script>

<%--//--%>


<%--accept order--%>
<script>
    $(document).ready(function () {
        $(".accept-order").click(function (){
            var id = $(this).attr("oId");
            var status_text = $(this).closest("tr").find(".status-text");
            var accept_btn = $(this).closest("tr").find(".accept-order");
            var cancel_btn = $(this).closest("tr").find(".cancel-order");
            var nextStep_btn = $(this).closest("tr").find(".next-step-order");
            var tr = $(this).closest("tr");
            if(confirm("Bạn có chắc chắn muốn xác nhận đơn hàng này?")){
                $.ajax({
                    url: '/tmdt_war_exploded/admin/acceptOrder',
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        status_text.html("Collected");
                        nextStep_btn.attr("oStatus","2");
                        setTimeout(function(){
                            accept_btn.addClass("disabled");
                            nextStep_btn.removeClass("disabled");
                            cancel_btn.removeClass("disabled");
                            tr.removeClass("table-warning");
                        },10)
                    },
                    error: function (data){
                        if(data.status == 404){
                            alert("Accept fail!");
                        }
                    }

                });

            }
        });

    });

</script>
<%--//--%>

<%--next step order--%>
<script>
    $(document).ready(function () {
        $(".next-step-order").click(function (){
            var id = $(this).attr("oId");
            var nextStep = $(this);
            var status = $(this).attr("oStatus");
            var previousStatus = parseInt(status);
            var status_text = $(this).closest("tr").find(".status-text");
            var cancel_btn = $(this).closest("tr").find(".cancel-order");
            var nextStep_btn = $(this).closest("tr").find(".next-step-order");
            var tr = $(this).closest("tr");
            var icon = $(this).closest("tr").find(".icon-another");
            if(confirm("Bạn có chắc chắn muốn chuyển sang giai đoạn kế tiếp?")){
                $.ajax({
                    url: '/tmdt_war_exploded/admin/nextStepOrder',
                    method: "POST",
                    data: {
                        id: id,
                        status: status
                    },
                    success: function (data){
                        if(status == 2){
                            status_text.html("Đang vận chuyển");
                        }else if (status == 3){
                            status_text.html("Đã giao hàng");
                        }
                        nextStep.attr("oStatus",previousStatus + 1);
                        setTimeout(function(){
                            if(status == 3){
                                nextStep_btn.addClass("disabled");
                                cancel_btn.addClass("disabled");
                                tr.addClass("table-active");
                                icon.removeClass("text-gray-400").addClass("text-gray-700");
                            }
                        },10)
                    },
                    error: function (data){
                        if(data.status == 404){
                            alert("Next step fail!");

                        }
                    }

                });

            }
        });

    });

</script>
<%--//--%>

<%--cancel order--%>
<script>
    $(document).ready(function () {
        $(".cancel-order").click(function (){
            var id = $(this).attr("oId");
            var status_text = $(this).closest("tr").find(".status-text");
            var accept_btn = $(this).closest("tr").find(".accept-order");
            var nextStep_btn = $(this).closest("tr").find(".next-step-order");
            var cancel_btn = $(this).closest("tr").find(".cancel-order");
            var ordersDetail_btn = $(this).closest("tr").find(".details-order");
            var tr = $(this).closest("tr");
            var icon = $(this).closest("tr").find(".icon-another");
            if(confirm("Bạn có chắc chắn muốn hủy đơn hàng này?")){
                $.ajax({
                    url: '/tmdt_war_exploded/admin/cancelOrder',
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        status_text.html("Đã hủy");
                        setTimeout(function(){
                            accept_btn.addClass("disabled");
                            nextStep_btn.addClass("disabled");
                            cancel_btn.addClass("disabled");
                            tr.addClass("table-danger");
                            icon.addClass("text-gray-700").removeClass("text-gray-400");
                        },10)
                    },
                    error: function (data){
                        if(data.status == 404){
                            alert("Cancel order fail!");
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
