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
    <link href="css/edit-style.css" rel="stylesheet">

</head>

<body>
<jsp:include page="header.jsp"/>


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Checkout</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Checkout Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <form id="checkout-form" class="form-horizontal d-flex" method="post" action="order">
        <div class="col-lg-8">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Th??ng tin giao h??ng</span></h5>
            <div class="bg-light p-30 mb-5">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>H??? v?? t??n</label>
                        <input id="fullname" name="fullname" class="form-control" type="text" placeholder="eg: L?? V??n A">
                        <span class="form-message"></span>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>S??? ??i???n tho???i</label>
                        <input id="phone_number" name="phone_number" class="form-control" type="text" placeholder="eg: 0325784458">
                        <span class="form-message"></span>
                    </div>
                    <div class="col-md-12 form-group">
                        <label>Email</label>
                        <input class="form-control" disabled type="text" placeholder="" value="${email}">
                    </div>
                    <div class="col-md-12 form-group">
                        <label>?????a ch???</label>
                        <input id="address" name="address" class="form-control" type="text" placeholder="eg: 123 Street">
                        <span class="form-message"></span>
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="newaccount" required>
                            <label class="custom-control-label" for="newaccount">T??i ?????ng ?? v???i c??c ??i???u kho???n v?? ??i???u ki???n c???a trang web khi mua h??ng</label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-lg-4">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">T??m t???t ????n h??ng</span></h5>
            <div class="bg-light p-30 mb-5">
                <div class="border-bottom">
                    <h6 class="mb-3">C??c S???n ph???m</h6>
                        <c:set var="list" value="${cart.data}"/>
                        <c:forEach items="${list}" var="item" >
                            <div class="d-flex justify-content-between">
                                <p style="width: 200px">${item.name}</p>
                                <p>X${item.quantitySold}</p>
                                <p>${item.total()}</p>
                            </div>
                        </c:forEach>

                </div>
                <div class="border-bottom pt-3 pb-2">
                    <div class="d-flex justify-content-between mb-3">
                        <h6>T???ng ti???n s???n ph???m</h6>
                        <h6>${cart.total()}</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Ph?? v???n chuy???n</h6>
                        <h6 class="font-weight-medium">0??</h6>
                    </div>
                </div>
                <div class="pt-2">
                    <div class="d-flex justify-content-between mt-2">
                        <h5>T???ng c???ng</h5>
                        <h5>${cart.total()}</h5>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thanh to??n</span></h5>
                <div class="bg-light p-30">
                    <div class="form-group mb-4">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="banktransfer" required>
                            <label class="custom-control-label" for="banktransfer">Thanh to??n khi nh???n h??ng</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-block btn-primary font-weight-bold py-3">?????t h??ng</button>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- Checkout End -->

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

<script src="js/validate.js"></script>
<%--Checkout--%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        Validator({
            form: '#checkout-form',
            formGroupSelector: '.form-group',
            errorSelector: '.form-message',
            rules: [
                Validator.isRequired('#fullname', 'Vui l??ng nh???p ?????y ????? t??n c???a ng?????i nh???n h??ng'),
                Validator.isRequired('#phone_number', 'Vui l??ng nh???p s??? ??i???n tho???i c???a ng?????i nh???n h??ng'),
                Validator.minLength('#phone_number',10,'Please enter least 10 number'),
                Validator.isRequired('#address', 'Vui l??ng nh???p ?????y ????? ?????a ch??? nh???n h??ng')

            ]
        });

    });
</script>
</body>

</html>
