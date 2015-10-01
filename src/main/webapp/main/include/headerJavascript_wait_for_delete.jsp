<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script src="<c:url value='/main/js/editBug.js'/>"></script>

<!-- page script -->
<script type="text/javascript">


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

</script>