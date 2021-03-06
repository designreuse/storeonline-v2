<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>StoreOnline</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <%--<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'  />" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <%--<link href="../../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="<c:url value='/dist/css/AdminLTE.min.css'  />" rel="stylesheet"/>
    <!-- iCheck -->
    <%--<link href="../../plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />--%>
    <link href="<c:url value='/plugins/iCheck/square/blue.css'  />" rel="stylesheet"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Store</b>Online</a>
    </div><!-- /.login-logo -->

    <div class="login-box-body">
        <p class="login-box-msg">SIGN IN</p>
        <form action="j_spring_security_check" method="post">
            <div class="form-group has-feedback">
                <input name="j_username" type="text" class="form-control" placeholder="Username" value="yeamgood"/>
                <span class="glyphicon glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="j_password" type="password" class="form-control" placeholder="Password" value="1234"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <%--<div class="checkbox icheck">--%>
                        <%--<label>--%>
                            <%--<input type="checkbox"> Remember Me--%>
                        <%--</label>--%>
                    <%--</div>--%>
                </div>
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                </div><!-- /.col -->
            </div>
        </form>

    </div><!-- /.login-box-body -->
</div><!-- /.login-box -->

<!-- jQuery 2.1.3 -->
<%--<script src="../../plugins/jQuery/jQuery-2.1.3.min.js"></script>--%>
<script src="<c:url value='/plugins/jQuery/jQuery-2.1.4.min.js' />"></script>

<!-- Bootstrap 3.3.2 JS -->
<%--<script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js' />"></script>

<!-- iCheck -->
<%--<script src="../../plugins/iCheck/icheck.min.js" type="text/javascript"></script>--%>
<script src="<c:url value='/plugins/iCheck/icheck.min.js' />"></script>

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>