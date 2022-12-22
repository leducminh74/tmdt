<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="orderStatus" scope="request" class="com.example.tmdt.dao.OrderStatusDao"/>
<jsp:useBean id="payment" scope="request" class="com.example.tmdt.dao.PaymentDao"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/edit-style.css" rel="stylesheet">

</head>

<body>
<jsp:include page="header.jsp"/>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Trang chủ</a>
                <span class="breadcrumb-item active">Lịch sử đặt hàng</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<div class="privacy">
    <div id="container" class="container py-xl-4 py-lg-2">

        <c:if test="${oList.size() == 0}">
            <div id="empty-cart">
                <h2 class="text-center m-8 "><strong>Bạn chưa có đơn hàng nào?</strong></h2>
                <button style="display: block; margin: 0 auto" type="button" class="btn btn-lg btn-primary mt-2" onclick="location.href ='index'">Đặt hàng ngay</button>
            </div>
        </c:if>

        <c:if test="${oList.size() > 0}">
            <div>
                <h2 class="text-center mb-8"><strong>Lịch sử đặt hàng</strong></h2>
            </div>
            <div class="row justify-content-center">
                <div style="width: 100%" class="col-auto">
                    <table id="orderhistory-table" class="table table-hover" border="1" frame="void" rules="rows">
                        <thead>
                        <tr>
                            <th scope="col">Mã đơn hàng</th>
                            <th scope="col">Thanh toán</th>
                            <th scope="col">Ngày đặt hàng</th>
                            <th scope="col">Tổng giá</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="o" items="${oList}">

                            <tr orderid="${o.id}" data>
                                <td>${o.id}</td>
                                <td>${payment.getPaymentByPaymentId(o.payment).paymentName}</td>
                                <td>${o.createAt}</td>
                                <td>$${o.total}</td>
                                <td>${orderStatus.getStatusByStatusId(o.status).statusName}</td>
                                <td><a class="detail-order" href="javascript:" orderid="${o.id}" status="${o.status}">Chi tiết</a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>

        </c:if>


        <%--        --%>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<jsp:include page="modal-detailOrder.jsp"/>
<jsp:include page="modalToSeller.jsp"/>


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<script>
    $(document).ready(function() {
        $('.detail-order').click(function () {
            var orderId = $(this).attr("orderid");
            var statusOrder = $(this).attr("status");
            $.ajax({
                type: "GET",
                url: "/tmdt_war_exploded/orderdetailshistory",
                data: {
                    orderId: orderId
                },
                success: function(data)
                {
                    $('#order-detail-modal').find('.modal-title').html('Chi tiết đơn hàng (Mã đơn hàng: ' + orderId + ')');
                    $('#order-detail-modal').find('tbody').html(data);
                    if(statusOrder == 1){
                        $('#order-detail-modal').find('.modal-footer').html(
                            '<button type="button" onclick="cancelOrder(this)" class="btn btn-danger" orderId='+orderId+' >Hủy đơn hàng</button>'+
                            '<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>'
                        );
                    }else{
                        $('#order-detail-modal').find('.modal-footer').html(
                            '<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>'
                        );
                    }
                    $('#order-detail-modal').modal('show');
                }
            });

        })
    })
</script>


<script>
    function cancelOrder(order) {
        var orderId = $(order).attr("orderId");
        tr = $('#orderhistory-table tr[orderid=' + orderId + ']');

        if(confirm("Are you sure you want to cancel this order?")){
            $.ajax({
                url: "/tmdt_war_exploded/cancelOrder",
                method: "POST",
                data: {
                    orderId: orderId
                },
                success: function (data){
                    $('#order-detail-modal').modal('hide');
                    tr.remove();
                    var rowCount = $("#orderhistory-table tr").length;
                    if(rowCount == 1){
                        $("#container").html(data);
                    }

                },
                error: function (data){
                    alert("Order not exist")
                }
            });

        }
    }

</script>



</body>

</html>

