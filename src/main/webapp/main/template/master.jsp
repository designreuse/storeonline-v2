<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html  id="ng-app" ng-app="">
<head>
  <%--<meta charset="UTF-8">--%>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>StoreOnline</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <!-- Bootstrap 3.3.4 -->
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'  />" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <%--  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="<c:url value='/dist/css/font-awesome.min.css'  />" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <%--<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="<c:url value='/dist/css/ionicons.min.css'  />" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <%--<link href="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.css'/>" rel="stylesheet" type="text/css" />--%>
    <!-- DATA TABLES -->
    <link href="<c:url value='/plugins/datatables/dataTables.bootstrap.css'/>" rel="stylesheet" type="text/css" />
    <!-- Bootstrap time Picker -->
    <%--<link href="<c:url value='/plugins/timepicker/bootstrap-timepicker.min.css'/>" rel="stylesheet" type="text/css" />--%>
    <!-- Bootstrap Date Picker -->
    <link href="<c:url value='/plugins/datepicker/datepicker3.css'/>" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="<c:url value='/dist/css/AdminLTE.css'  />" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="<c:url value='/dist/css/skins/_all-skins.min.css'  />" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- FORM VALIDATE -->
    <link href="<c:url value='/dist/css/formValidation.min.css'  />" rel="stylesheet" type="text/css" />

    <link href="<c:url value='/main/css/storeonline.css'  />" rel="stylesheet" type="text/css" />

</head>
<body class="skin-blue">
<div class="wrapper">

    <div class="row">
        <div class="col-md-4 col-md-offset-5">
                    <div  id="msgAlertColor" class="alert alert-dismissable message-alert " >
                        <i id="msgAlertIcon"  class="icon fa "></i>
                        <span id="msgHeader"></span>
                        <span id="msgContent"></span>
                    </div>
        </div><!-- /.col -->
    </div>

  <tiles:insertAttribute name="header" />

  <tiles:insertAttribute name="menu" />

  <div class="content-wrapper" id="content-main">
    <tiles:insertAttribute name="body" />
  </div>

  <%--<tiles:insertAttribute name="footer" />--%>


    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <%-- --------------------------------------- Modal Dialog   ------------------------------------------------- --%>
    <%-- -------------------------------------------------------------------------------------------------------- --%>

    <%-- ----------------------------------------- Modal loading ------------------------------------------------ --%>
    <div class="modal modal-center" id="loadingModal" data-backdrop="static" data-keyboard="false"   >
        <div class="modal-dialog" style="width: 250px">
            <div class="modal-content">
                <div class="modal-header ">
                    <h4 class="modal-title">ระบบกำลังดำเนินการ</h4>
                </div>
                <div class="modal-body">
                    <div class="progress active">
                        <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" style="width: 100%">
                            <span class="sr-only">20% Complete</span>
                        </div>
                    </div>


                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>


    <div class="modal modal-center" id="confirmModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">โปรดยืนยัน</h4>
                </div>
                <form id="confirmModalForm">
                    <div class="modal-body">
                        <p id="confirmMessage">แน่ใจหรือไหม! ที่จะลบข้อมูลนี้?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">ยืนยัน</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</div><!-- ./wrapper -->


<!-- jQuery 2.1.4 -->
<script src="<c:url value='/plugins/jQuery/jQuery-2.1.4.min.js'/>"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<%--<script src="<c:url value='/bootstrap/js/validator.js'/>" type="text/javascript"></script>--%>
<!-- FORM VALIDATE -->
<script src="<c:url value='/dist/js/formValidation.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/dist/js/framework/bootstrap.min.js'/>" type="text/javascript"></script>

<!-- NumberFormat -->
<script src="<c:url value='/dist/js/NumberFormat154.js'/>" type="text/javascript"></script>

<!-- BOOTBOX -->
<script src="<c:url value='/plugins/bootbox/bootbox.min.js'/>"></script>

<!-- DATA TABES SCRIPT -->
<script src="<c:url value='/plugins/datatables/jquery.dataTables.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/plugins/datatables/dataTables.bootstrap.min.js'/>" type="text/javascript"></script>
<!-- SlimScroll -->
<%--<script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js'/>" type="text/javascript"></script>
<!-- FastClick -->
<script src="<c:url value='/plugins/fastclick/fastclick.min.js'/>" ></script>--%>

<!-- bootstrap time picker -->
<%--<script src="<c:url value='/plugins/timepicker/bootstrap-timepicker.min.js'/>" type="text/javascript"></script>--%>
<!-- Bootstrap time Picker -->
<script src="<c:url value='/plugins/datepicker/bootstrap-datepicker.js'/>" type="text/javascript"></script>
<script src="<c:url value='/plugins/datepicker/locales/bootstrap-datepicker.th.js'/>" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/dist/js/app.min.js'/>" type="text/javascript"></script>
<%--<!-- Sparkline -->
<script src="<c:url value='/plugins/sparkline/jquery.sparkline.min.js'/>" type="text/javascript"></script>
<!-- jvectormap -->
<script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'/>" type="text/javascript"></script>--%>
<%--<!-- SlimScroll 1.3.0 -->
<script src="<c:url value='/plugins/slimScroll/jquery.slimscroll.min.js'/>" type="text/javascript"></script>
<!-- ChartJS 1.0.1 -->
<script src="<c:url value='/plugins/chartjs/Chart.min.js'/>" type="text/javascript"></script>--%>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<%--<script src="<c:url value='/dist/js/pages/dashboard2.js'/>" type="text/javascript"></script>--%>

<!-- AdminLTE for demo purposes -->
<%--<script src="<c:url value='/dist/js/demo.js'/>" type="text/javascript"></script>--%>

<script type="text/javascript">

    var urlConfirmAction = "";

    /* center modal */
    function centerModals(){
        $('.modal-center').each(function(i){
            var $clone = $(this).clone().css('display', 'block').appendTo('body');
            var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
            top = top > 0 ? top : 0;
            $clone.remove();
            $(this).find('.modal-content').css("margin-top", top);
        });
    }
    $('.modal-center').on('show.bs.modal', centerModals);
    $(window).on('resize', centerModals);

    // function for loadding modal
    function openLoadingModal(){
        $('#loadingModal').modal('show');
    }

    function closeLoadingModal(){
        $('#loadingModal').modal('hide');
    }


  /*  function openConfirmModal(urlAction,message){
        urlConfirmAction = urlAction;
        $("#confirmMessage").val(message);
        openLoadingModal("confirmModal");
    }*/

    function openModal(modalName){
        $('#'+modalName+'').modal('show');
    }

    function closeModal(modalName){
        $('#'+modalName+'').modal('hide');
    }


    // function messageAlert
    function messageAlertFadeIn(timeDelay){
        $("#msgAlertColor").delay(timeDelay).slideDown();
        messageAlertFadeOut(3000);
    }

    function messageAlertFadeOut(timeDelay){
        $("#msgAlertColor").delay(timeDelay).slideUp();
    }

    function setMessageAlert(icon,header,content,color){
        $("#msgAlertColor").addClass("alert alert-dismissable message-alert " + color);
        $("#msgAlertIcon").addClass("icon fa " + icon);
        $("#msgHeader").html(header);
        $("#msgContent").html(content);
    }

    function resetMessageAlert(){
        $("#msgAlertColor").removeClass();
        $("#msgAlertIcon").removeClass();
        $("#msgHeader").val("");
        $("#msgContent").val("");
    }

    function showMessageAlert(icon,header,content,color){
        resetMessageAlert();
        setMessageAlert(icon,header,content,color);
        messageAlertFadeIn(1);
    }


    /*function currencyFormat (currency) {
        currency.formatCurrency();
    }

    function currencyFormat2(currency) {
        //var regex = "^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,} (\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$";
       // $(currency).val(parseFloat($(currency).val()).toFixed(2));

        if($(currency).val() == ""){
            $(currency).val(0.00);
        }
        $(currency).val(parseFloat($(currency).val()).toFixed(2).replace(/(\d)(?=(\d{3})+\b)/g,'$1,'));

    }


    function CurrencyFormatted(currency) {
        var i = parseFloat($(currency).val());
        if(isNaN(i)) { i = 0.00; }
        var minus = '';
        if(i < 0) { minus = '-'; }
        i = Math.abs(i);
        i = parseInt((i + .005) * 100);
        i = i / 100;
        var s = new String(i);
        if(s.indexOf('.') < 0) { s += '.00'; }
        if(s.indexOf('.') == (s.length - 2)) { s += '0'; }
        s = minus + s;
        $(currency).val(s);
    }

    function currency(N){
        N=parseFloat(N);
        if(!isNaN(N))N=N.toFixed(2);
        else N='0.00';return N;
    }*/

    function currencyFormat(obj){
        obj.value = new NumberFormat(obj.value).toFormatted();
       /* ex 999,999.00*/
    }


    function currencyFormatKey(obj){
        var nf = new NumberFormat(obj.value);
        nf.setPlaces(2);
        nf.setSeparators(false);
        obj.value = nf.toFormatted();
        /* ex 999999.00*/
    }

    function currencyFormatValue(value){
        return new NumberFormat(value).toFormatted();
        /* ex 999,999.00*/
    }


    function currencyFormatKeyValue(value){
        var nf = new NumberFormat(value);
        nf.setPlaces(2);
        nf.setSeparators(false);
        return nf.toFormatted();
        /* ex 999999.00*/
    }


    function numberFormat(obj){
        var nf = new NumberFormat(obj.value);
        nf.setPlaces(0);
        obj.value = nf.toFormatted();
    }

    function numberFormatKey(obj){
        var nf = new NumberFormat(obj.value);
        nf.setPlaces(0);
        nf.setSeparators(false);
        obj.value = nf.toFormatted();
    }

    function numberFormatValue(value){
        var nf = new NumberFormat(value);
        nf.setPlaces(0);
        return nf.toFormatted();
    }

    function numberFormatKeyValue(value){
        var nf = new NumberFormat(value);
        nf.setPlaces(0);
        nf.setSeparators(false);
        return nf.toFormatted();
    }

    function manageDelete(mainId,menuName){
        bootbox.dialog({
            size:"small",
            message: "คุณต้องการลบข้อมูลนี้หรือไหม",
            title: "โปรดยืนยัน",
            buttons: {
                save: {
                    label: "ยืนยัน",
                    className: "btn-primary",
                    callback: function() {
                        $("#mainId").val(mainId);
                        var menuAction = menuName + "/delete";
                        $("#mainForm").attr('action',menuAction);
                        submitManageForm();
                    }
                },
                cancel: {
                    label: 'ยกเลิก',
                    className: 'btn-default'
                }
            }
        });
    }

    function submitManageForm(){
        var frm = $('#mainForm');
        var data = {};
        $.each($('#mainForm').serializeArray(), function(i, v){
            data[v.name] = v.value;
            delete data["undefined"];
        });
        openLoadingModal();
        $.ajax({
            contentType : 'application/json; charset=utf-8',
            type: frm.attr('method'),
            url: frm.attr('action'),
            dataType : 'json',
            data : JSON.stringify(data),
            success : function(result){
                closeLoadingModal();
                showMessageAlert(result.icon,result.header,result.content,result.color);
                reloadPageOldAjax();
            },
            error : function(result){
                closeLoadingModal();
                showMessageAlert("fa-warning","แจ้งเตือน","เกิดข้อผิดพลาดกรุณาแจ้งผู้ดูแลระบบ","alert-danger");
            }
        });
    }

    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <%-- --------------------------------------- Script Add Tab ------------------------------------------------- --%>
    <%-- -------------------------------------------------------------------------------------------------------- --%>

   /* var pageImages = [];
    var pageNum = 0;
    *//**  Reset numbering on tab buttons **//*
    function reNumberPages() {
        pageNum = 0;
        var tabCount = $('#pageTab > li').length;
        $('#pageTab > li').each(function() {
            var pageId = $(this).children('a').attr('href');
            if (pageId == "#page1") {
                return true;
            }
            pageNum++;
            //$(this).children('a').html('Page ' + pageNum + '<button class="close" type="button" ' + 'title="Remove this page">×</button>');
        });
        checkShowContent();
    }

    function checkShowContent(){
        //alert(pageNum);
        if(pageNum > 0){
            $('#content-home').hide();
            $('#tabMain').show();
        }else{
            $('#content-home').show();
            $('#tabMain').hide();
        }
    }

    function addTabMain(icon,tabName,tabContent){
        pageNum++;
        checkShowContent();

        var icontag = '<i class="fa ' + icon +' ">';
        var buttonCloseTab = '<button class="btn btn-box-tool close-tab" data-widget="remove"><i class="fa fa-times"></i></button>';

        $('#pageTab').append( $('<li><a href="#page' + pageNum + '" id="pageHead' + pageNum +'">' +  icontag + ' ' + tabName + ' ' + buttonCloseTab + '</a></li>'));
        $('#pageTabContent').append($('<div class="tab-pane" id="page' + pageNum +'">' + tabContent + '</div>'));
        $('#page' + pageNum).tab('show');
        $('#pageHead' + pageNum).trigger("click");
    }

    $(document).ready(function() {
        reNumberPages();

        *//**  Remove a Tab **//*
        $('#pageTab').on('click', ' li a .close-tab', function() {
            var tabId = $(this).parents('li').children('a').attr('href');
            $(this).parents('li').remove('li');
            $(tabId).remove();
            reNumberPages();
            $('#pageTab a:first').tab('show');
        });

        *//**  Click Tab to show its content **//*
        $("#pageTab").on("click", "a", function(e) {
            e.preventDefault();
            $(this).tab('show');
        });
    });*/

</script>

</body>
</html>