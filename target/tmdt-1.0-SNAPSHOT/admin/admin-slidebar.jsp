<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="revenue-management">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <c:if test="${sessionScope.acc.role == 1}">
            <div class="sidebar-brand-text mx-3">Box Admin</div>
        </c:if>
        <c:if test="${sessionScope.acc.role == 2}">
            <div class="sidebar-brand-text mx-3">Box Seller</div>
        </c:if>

    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item ${sessionScope.URL.contains("revenue-management") ? "active":""}">
            <a class="nav-link" href="revenue-management">
            <i class="fas fa-comment-dollar"></i>
            <span>Quản lý daonh thu</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item ${sessionScope.URL.contains("product-management") ? "active":""}">
            <a class="nav-link collapsed" href="product-management">
            <i class="fas fa-air-freshener"></i>
            <span>Quản lý sản phẩm</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <c:if test="${sessionScope.acc.role == 1}">
        <li class="nav-item ${sessionScope.URL.contains("user-management") ? "active":""}">
            <a class="nav-link collapsed" href="user-management">
                <i class="fas fa-users"></i>
                <span>Quản lý tài khoản</span></a>
        </li>
    </c:if>


    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item ${sessionScope.URL.contains("order-management") ? "active":""}">
            <a class="nav-link collapsed" href="order-management">
            <i class="fas fa-shipping-fast"></i>
            <span>Quản lý đơn hàng</span></a>
    </li>

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->