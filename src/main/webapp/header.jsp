<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="index" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form action="search" method="get">
                <div class="input-group">
                    <input type="search" name="search" class="form-control" placeholder="Tìm kiếm sản phẩm" value="${result}">
                    <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <c:if test="${sessionScope.acc == null}">
                <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-light dropdown-toggle category-btn" data-toggle="dropdown">Tài khoản của bạn</button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a href="login" class="dropdown-item" type="button" >Đăng nhập</a>
                        <a href="register" class="dropdown-item" type="button">Đăng ký</a>
                        <a href="forgotpassword" class="dropdown-item" type="button">Quên mật khẩu</a>
                    </div>
                </div>
            </c:if>

            <c:if test="${sessionScope.acc != null}">
                <c:if test="${sessionScope.acc.role == 1}">
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.acc.username}</button>
                        <a href="admin" type="button" class="btn btn-sm btn-light" >Đi đến trang Admin</a>
                        <a href="changepassword" class="dropdown-item" type="button">Đổi mật khẩu</a>
                        <a href="logout" class="dropdown-item" type="button">Đăng xuất</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.acc.role == 2}">
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.acc.username}</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="admin" type="button" class="dropdown-item" >Đi đến trang người bán hàng</a>
                            <a href="info" type="button" class="dropdown-item">Cập nhật thông tin</a>
                            <a href="orderhistory" class="dropdown-item" type="button">Lịch sử đặt hàng</a>
                            <a href="changepassword" class="dropdown-item" type="button">Đổi mật khẩu</a>
                            <a href="logout" class="dropdown-item" type="button">Đăng xuất</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.acc.role == 0}">
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.acc.username}</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="orderhistory" class="dropdown-item" type="button">Lịch sử đặt hàng</a>
                            <a href="info" type="button" class="dropdown-item" >Cập nhật thông tin</a>
                            <a href="changepassword" class="dropdown-item" type="button">Đổi mật khẩu</a>
                            <a href="javascript:" class="dropdown-item" type="button" data-toggle="modal" data-target="#toSellerModal">Đăng ký trở thành người bán hàng</a>
                            <a href="logout" class="dropdown-item" type="button">Đăng xuất</a>
                        </div>
                    </div>
                </c:if>
            </c:if>

        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Danh mục</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div id="list-category" class="navbar-nav w-100">
                    <c:forEach var="c" items="${listC}">
                        <a href="shop?cId=${c.cId}" class="nav-item nav-link">${c.cName}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                    <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="index" class="nav-item nav-link active">Trang chủ</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <a href="cart" class="btn px-0 ml-3">
                            <i class="fas fa-shopping-cart text-primary"></i>
                            <span id="count-product" class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">${sessionScope.cart.countNumberOfItem()}</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->
