<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Perfume Shop - Register</title>
    <!--favicon -->
    <link href="images/faviconn.PNG" rel="icon">
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="fonts/fontawesome-5.15.4/css/all.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style-form.css">
    <link rel="stylesheet" href="css/edit-style.css">
</head>
<body>
<div class="main">
<!-- Register form -->
    <section class="signup">
        <div class="container">
            <a href="index" class="back-home" title="Back to home"><i class="fas fa-home"></i></a>
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Cập nhật thông tin</h2>

                    <form method="post" class="register-form" id="register-form" action="info">
                        <div class="input-line">
                            <div class="form-group">
                                <label > <i class="fas fa-user"></i></label>
                                <input type="text" value="${name}" name="name" id="name" class="styled-input" placeholder="Họ và tên"/>
                            </div>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-line">
                            <div class="form-group">
                                <label ><i class="fas fa-envelope"></i></label>
                                <input type="text" value="${address}" name="address" id="address" class="styled-input" placeholder="Địa chỉ"/>
                            </div>
                            <span class="form-message"></span>
                        </div>
                        <h4>${error}</h4>

                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Cập nhật"/>
                        </div>

                    </form>

                </div>

            </div>
        </div>
    </section>
</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>

<%--Validate Form--%>
<script src="js/validate.js"></script>
<%--Register--%>

</body>
</html>
