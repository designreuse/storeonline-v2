<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="th" id="ng-app" ng-app="">
<head>
  <meta charset="UTF-8">
  <title>StoreOnline</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <!-- Bootstrap 3.3.2 -->
  <link href="<c:url value='/bootstrap/css/bootstrap.min.css'  />" rel="stylesheet" type="text/css" />
  <!-- FontAwesome 4.3.0 -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <!-- Ionicons 2.0.0 -->
  <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
  <!-- Theme style -->
  <link href="<c:url value='/dist/css/AdminLTE.min.css'  />" rel="stylesheet" type="text/css" />
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link href="<c:url value='/dist/css/skins/_all-skins.min.css'  />" rel="stylesheet" type="text/css" />
  <!-- iCheck -->
  <link href="<c:url value='/plugins/iCheck/flat/blue.css'  />" rel="stylesheet" type="text/css" />
  <!-- Morris chart -->
  <%--<link href="<c:url value='/plugins/morris/morris.css'  />" rel="stylesheet" type="text/css" />--%>
  <!-- jvectormap -->
  <link href="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.css'  />" rel="stylesheet" type="text/css" />
  <!-- Date Picker -->
  <link href="<c:url value='/plugins/datepicker/datepicker3.css'  />" rel="stylesheet" type="text/css" />
  <!-- Daterange picker -->
  <link href="<c:url value='/plugins/daterangepicker/daterangepicker-bs3.css'  />" rel="stylesheet" type="text/css" />
  <!-- bootstrap wysihtml5 - text editor -->
  <link href="<c:url value='/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css'  />" rel="stylesheet" type="text/css" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
</head>
<body class="skin-blue">
<div class="wrapper">

  <tiles:insertAttribute name="header" />

  <tiles:insertAttribute name="menu" />

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="content-main">
    <tiles:insertAttribute name="body" />
  </div>

  <%--<tiles:insertAttribute name="footer" />--%>

</div><!-- ./wrapper -->

<!-- jQuery 2.1.3 -->
<script src="<c:url value='/plugins/jQuery/jQuery-2.1.3.min.js' />"></script>
<!-- jQuery UI 1.11.2 -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.2 JS -->
<script src="<c:url value='/bootstrap/js/bootstrap.min.js' />" type="text/javascript"></script>
<!-- Morris.js charts -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<%--<script src="<c:url value='/plugins/morris/morris.min.js' />" type="text/javascript"></script>--%>
<!-- Sparkline -->
<script src="<c:url value='/plugins/sparkline/jquery.sparkline.min.js' />" type="text/javascript"></script>
<!-- jvectormap -->
<script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js' />" type="text/javascript"></script>
<script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-world-mill-en.js' />" type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script src="<c:url value='/plugins/knob/jquery.knob.js' />" type="text/javascript"></script>
<!-- daterangepicker -->
<script src="<c:url value='/plugins/daterangepicker/daterangepicker.js' />" type="text/javascript"></script>
<!-- datepicker -->
<script src="<c:url value='/plugins/datepicker/bootstrap-datepicker.js' />" type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<c:url value='/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js' />" type="text/javascript"></script>
<!-- iCheck -->
<script src="<c:url value='/plugins/iCheck/icheck.min.js' />" type="text/javascript"></script>
<!-- Slimscroll -->
<script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js' />" type="text/javascript"></script>
<!-- FastClick -->
<script src="<c:url value='/plugins/fastclick/fastclick.min.js' />"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/dist/js/app.min.js' />" type="text/javascript"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<%--<script src="<c:url value='/dist/js/pages/dashboard.js' />" type="text/javascript"></script>--%>

</body>
</html>