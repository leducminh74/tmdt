<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
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
</head>

<body >

<jsp:include page="header.jsp"/>



<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Shopping Cart</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->
<div id="container">

<c:if test="${sessionScope.cart.data.size() == 0}">
    <div id="empty-cart">
        <h2 class="text-center m-8 "><strong>Giỏ hàng của bạn đang trống</strong></h2>
        <button style="display: block; margin: 0 auto" type="button" class="btn btn-lg btn-primary mt-2" onclick="location.href ='index'">Đặt hàng ngay</button>
    </div>
</c:if>

<c:if test="${sessionScope.cart.data.size() != 0}">


<!-- Cart Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table id="cart-table" class="table table-light table-borderless table-hover text-center mb-0">
                <thead class="thead-dark">
                <tr>
                    <th style="width: 10%">No</th>
                    <th style="width: 30%">Products</th>
                    <th style="width: 20%">Price</th>
                    <th style="width: 10%">Quantity</th>
                    <th style="width: 20%">Total</th>
                    <th style="width: 10%">Remove</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach items="${sessionScope.cart.data}" var="item" varStatus="count">
                <tr>
                    <td class="align-middle">${count.count}</td>
                    <td class="align-middle"><img src="img/${item.img}" alt="" style="width: 50px;">${item.name}</td>
                    <td class="align-middle">${item.sellPrice}</td>
                    <td class="align-middle">
                        <div class="input-group quantity mx-auto" style="width: 100px;">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-primary btn-minus down-quantity" pid="${item.id}" pprice="${item.sellPrice}" pquantity="${item.quantity}">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="quantity-sold form-control form-control-sm bg-secondary border-0 text-center" value="${item.quantitySold}">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-primary btn-plus up-quantity" pid="${item.id}" pprice="${item.sellPrice}" pquantity="${item.quantity}">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </td>
                    <td class="align-middle product-total">${item.total()}</td>
                    <td class="align-middle"><button class="btn btn-sm btn-danger cart-remove" pid="${item.id}"><i class="fa fa-times"></i></button></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin giỏ hàng</span></h5>
            <div class="bg-light p-30 mb-5">
                <div class="border-bottom pb-2">
                    <div class="d-flex justify-content-between mb-3">
                        <h6>Tổng tiền sản phẩm</h6>
                        <h6 id="cart-subtotal">${sessionScope.cart.total()}</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Phí vận chuyển</h6>
                        <h6 class="font-weight-medium">0đ</h6>
                    </div>
                </div>
                <div class="pt-2">
                    <div class="d-flex justify-content-between mt-2">
                        <h5>Tổng cộng</h5>
                        <h5 id="cart-total">${sessionScope.cart.total()}</h5>
                    </div>
                    <button onclick="location.href='checkout'" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Tiến hành thanh toán</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->

</c:if>

</div>

<jsp:include page="footer.jsp"/>
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

<%--remove product--%>
<script>
    $(document).ready(function () {
        $(".cart-remove").click(function (){
            var id = $(this).attr("pid");
            tr = $(this).closest("tr");
            if(confirm("Bạn có chắc chắn muốn xóa khỏi giỏ hàng?")){
                $.ajax({
                    url: "/tmdt_war_exploded/remove",
                    method: "POST",
                    data: {
                        id: id
                    },
                    success: function (data){
                        tr.remove();
                        var subTotal = document.getElementById('cart-subtotal');
                        var total = document.getElementById('cart-total');
                        var rowCount = $("#cart-table tr").length;
                        if(rowCount == 1){
                            document.getElementById('container').innerHTML = data;
                        }else{
                            subTotal.innerHTML = '$' + data;
                            total.innerHTML = '$' + data;
                        }
                    },
                    error: function (data){
                        if(data.status === 404){
                            alert("delete failed")
                        }
                    }
                });

            }
        });
    });

</script>

<%--up quantity--%>
<script>

    $(document).ready(function () {
        $(".up-quantity").click(function (){
            var id = $(this).attr("pid");
            var price = $(this).attr("pprice");
            var quantity = $(this).attr("pquantity");
            var updateQuantitySold = $(this).closest(".quantity").find('.quantity-sold');
            var getQuantitySold = parseInt($(this).closest(".quantity").find('.quantity-sold').val());
            var updatePrice = $(this).closest('tr').find('.product-total');
            $.ajax({
                url: "/tmdt_war_exploded/upQuantity",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data){
                    var upQuantitySold;
                    if(getQuantitySold >= quantity){
                        upQuantitySold = quantity;
                        updateQuantitySold.val(quantity);
                        alert("We are only " + quantity + " quantity for this item");
                    }else{
                        upQuantitySold = getQuantitySold ;
                    }
                    updateQuantitySold.html(upQuantitySold);
                    var pTotal = parseFloat(price * upQuantitySold).toFixed(2);
                    updatePrice.html("$" + pTotal);
                    var subTotal = $('#cart-subtotal');
                    var total = $('#cart-total');
                    subTotal.html("$" + data)
                    total.html("$" + data)

                },
                error: function (data){

                }
            });
        });
    });

</script>

<%--down quantity--%>
<script>

    $(document).ready(function () {
        $(".down-quantity").click(function (){
            tr = $(this).closest('tr');
            var id = $(this).attr("pid");
            var price = $(this).attr("pprice");
            var updateQuantity = $(this).closest(".quantity").find('.quantity-sold');
            var getQuantity = parseInt($(this).closest(".quantity").find('.quantity-sold').val());
            var updatePrice = $(this).closest('tr').find('.product-total');
            $.ajax({
                url: "/tmdt_war_exploded/downQuantity",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data){
                    var downQuantitySold = getQuantity;
                    if(downQuantitySold == 0){
                            tr.remove();
                            var subTotal = $('#cart-subtotal');
                            var total = $('#cart-total');
                            subTotal.html("$" + data);
                            total.html("$" + data);
                            var rowCount = $("#cart-table tr").length;
                            if(rowCount == 1){
                                $("#container").html(data);
                            }
                    }else{
                        updateQuantity.html(downQuantitySold);
                        var pTotal = parseFloat(price * downQuantitySold).toFixed(2);
                        updatePrice.html("$" + pTotal);
                        var subTotal = $('#cart-subtotal');
                        var total = $('#cart-total');
                        subTotal.html("$" + data)
                        total.html("$" + data)
                    }
                },
                error: function (data){

                }
            });
        });
    });

</script>

</body>

</html>