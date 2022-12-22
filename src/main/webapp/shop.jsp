<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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

<body>

<jsp:include page="header.jsp"/>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="index">Home</a>
                <a class="breadcrumb-item text-dark" href="shop">Shop</a>
                <span class="breadcrumb-item active">Shop List / ${cName}</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-4">
            <!-- Price Start -->
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Lọc theo giá</span></h5>
            <div class="bg-light p-4 mb-30">
                <form name="filterByPriceForm" action="shop">
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByPrice" type="radio" class="custom-control-input" ${filterCode == 0 ? "checked": ""} id="price-all" value="0" onchange="document.filterByPriceForm.submit()">
                        <input style="display: none" name="sizepage" value="${size}">
                        <input style="display: none" name="cId" value="${cId}">
                        <input style="display: none" name="sort" value="${sortCode}">
                        <input style="display: none" name="filterByColor" value="${filterColorCode}">
                        <label class="custom-control-label" for="price-all">Tất cả</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByPrice" type="radio" class="custom-control-input" ${filterCode == 1 ? "checked": ""} id="price-1" value="1" onchange="document.filterByPriceForm.submit()">
                        <label class="custom-control-label" for="price-1">$0 - $100</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByPrice" type="radio" class="custom-control-input" ${filterCode == 2 ? "checked": ""} id="price-2" value="2" onchange="document.filterByPriceForm.submit()">
                        <label class="custom-control-label" for="price-2">$100 - $200</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByPrice" type="radio" class="custom-control-input" ${filterCode == 3 ? "checked": ""} id="price-3" value="3" onchange="document.filterByPriceForm.submit()">
                        <label class="custom-control-label" for="price-3">$200 - $300</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByPrice" type="radio" class="custom-control-input" ${filterCode == 4 ? "checked": ""} id="price-4" value="4" onchange="document.filterByPriceForm.submit()">
                        <label class="custom-control-label" for="price-4">$300 - $400</label>
                    </div>
                    <div  class="custom-control custom-radio d-flex align-items-center justify-content-between">
                        <input name="filterByPrice" type="radio" class="custom-control-input" ${filterCode == 5 ? "checked": ""} id="price-5" value="5" onchange="document.filterByPriceForm.submit()">
                        <label class="custom-control-label" for="price-5">$400 - $500</label>
                    </div>
                </form>
            </div>
            <!-- Price End -->

            <!-- Color Start -->
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Lọc theo màu sắc</span></h5>
            <div class="bg-light p-4 mb-30">
                <form name="filterByColorForm" action="shop">
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByColor" type="radio" class="custom-control-input" ${filterColorCode == 0 ? "checked": ""} id="color-0" value="0" onchange="document.filterByColorForm.submit()">
                        <input style="display: none" name="sizepage" value="${size}">
                        <input style="display: none" name="cId" value="${cId}">
                        <input style="display: none" name="sort" value="${sortCode}">
                        <input style="display: none" name="filterByPrice" value="${filterCode}">
                        <label class="custom-control-label" for="color-0">Tất cả</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByColor" type="radio" class="custom-control-input" ${filterColorCode == 1 ? "checked": ""} id="color-1" value="1" onchange="document.filterByColorForm.submit()">
                        <label class="custom-control-label" for="color-1">Đen</label>

                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByColor" type="radio" class="custom-control-input" ${filterColorCode == 2 ? "checked": ""} id="color-2" value="2" onchange="document.filterByColorForm.submit()">
                        <label class="custom-control-label" for="color-2">Trắng</label>

                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByColor" type="radio" class="custom-control-input" ${filterColorCode == 3 ? "checked": ""} id="color-3" value="3" onchange="document.filterByColorForm.submit()">
                        <label class="custom-control-label" for="color-3">Đỏ</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input name="filterByColor" type="radio" class="custom-control-input" ${filterColorCode == 4 ? "checked": ""} id="color-4" value="4" onchange="document.filterByColorForm.submit()">
                        <label class="custom-control-label" for="color-4">Xanh dương</label>

                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                        <input name="filterByColor" type="radio" class="custom-control-input" ${filterColorCode == 5 ? "checked": ""} id="color-5" value="5" onchange="document.filterByColorForm.submit()">
                        <label class="custom-control-label" for="color-5">Xanh lá</label>
                    </div>
                </form>
            </div>
            <!-- Color End -->

        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-8">
            <c:if test="${listPByC.size() == 0}">
            <div id="empty-cart">
                <h2 class="text-center m-8 "><strong>Không có sản phẩm nào phù hợp với yêu cầu của bạn</strong></h2>
            </div>
            </c:if>
            <c:if test="${listPByC.size() != 0}">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div>
                            <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
                        </div>
                        <div class="ml-2">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sắp xếp</button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="shop?cId=${cId}&sort=0&sizepage=${size}&filterByPrice=${filterCode}">Bán chạy nhất</a>
                                    <a class="dropdown-item" href="shop?cId=${cId}&sort=1&sizepage=${size}&filterByPrice=${filterCode}">Tên từ a - z</a>
                                    <a class="dropdown-item" href="shop?cId=${cId}&sort=2&sizepage=${size}&filterByPrice=${filterCode}">Tên từ z - a</a>
                                    <a class="dropdown-item" href="shop?cId=${cId}&sort=3&sizepage=${size}&filterByPrice=${filterCode}">Giá từ cao xuống thấp</a>
                                    <a class="dropdown-item" href="shop?cId=${cId}&sort=4&sizepage=${size}&filterByPrice=${filterCode}">Giá từ thấp đến cao</a>

                                </div>
                            </div>
                            <div class="btn-group ml-2">
                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Hiển thị</button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="shop?cId=${cId}&sizepage=9&sort=${sortCode}&filterByPrice=${filterCode}">9</a>
                                    <a class="dropdown-item" href="shop?cId=${cId}&sizepage=18&sort=${sortCode}&filterByPrice=${filterCode}">18</a>
                                    <a class="dropdown-item" href="shop?cId=${cId}&sizepage=27&sort=${sortCode}&filterByPrice=${filterCode}">27</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach var="p" items="${listPByC}">
                <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                    <div class="product-item bg-light mb-4">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/${p.img}" alt="">
                            <div class="product-action">
                                <a class="addToCart btn btn-outline-dark btn-square" pid="${p.id}" pname="${p.name}" pprice="${p.sellPrice}" pquantity="${p.quantity}"><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href="details?pid=${p.id}&brand=${p.brand}"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="details?pid=${p.id}&brand=${p.brand}">${p.name}</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>${p.sellPrice}</h5><h6 class="text-muted ml-2"><del>${p.price}</del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="fa fa-star text-primary mr-1"></small>
                                <small class="far fa-star text-primary mr-1"></small>
                                <small class="far fa-star text-primary mr-1"></small>
                                <small>${p.totalSold}</small>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>

                <div class="col-12">
                    <nav>
                        <ul class="pagination justify-content-center">
                            <c:if test="${tag > 1}">
                            <li class="page-item "><a class="page-link" href="shop?cId=${cId}&page=${tag-1}&sizepage=${size}&sort=${sortCode}&filterByPrice=${filterCode}">Previous</span> </a></li>
                            </c:if>
                            <c:forEach begin="1" end="${end}" var="i">
                            <li class="page-item ${tag == i ? "active" : "" }"><a class="page-link" href="shop?cId=${cId}&page=${i}&sizepage=${size}&sort=${sortCode}&filterByPrice=${filterCode}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${tag < end}">
                            <li class="page-item "><a class="page-link" href="shop?cId=${cId}&page=${tag+1}&sizepage=${size}&sort=${sortCode}&filterByPrice=${filterCode}">Next</a></li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            </c:if>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


<jsp:include page="footer.jsp"/>
<jsp:include page="modal.jsp"/>
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

<%--add to cart--%>
<script >
    $(".addToCart").click(function() {
        var id = $(this).attr("pid");
        var name =$(this).attr("pname");
        var price = "$" + $(this).attr("pprice");
        var quantity = $(this).attr("pquantity") ;
        $.ajax({
            type: "POST",
            url: "/tmdt_war_exploded/add",
            data: {
                id: id
            },
            success: function(data)
            {
                var quantitySold = data;
                if(parseFloat(quantitySold) < parseFloat(quantity)){
                    $("#detail-name").html(name);
                    $("#detail-price").html(price);
                    $("#detail-quantity").html("X" + data);
                    $("#addCartModal").modal('show');
                    console.log(id);
                    console.log(name);

                }else{
                    alert("We are only " + quantity + " quantity for this item")
                }
            }
        });

        return false;
    });

</script>

</body>

</html>