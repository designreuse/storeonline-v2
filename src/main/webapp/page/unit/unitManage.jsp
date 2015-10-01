<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="unit"  id="manageForm" role="form" class="form-horizontal" action="unit/save" method="post" >
    <form:hidden path="unitID" ></form:hidden>

    <div class="form-group">
        <label for="unitCode" class="control-label col-md-3">Code:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="unitCode" id="unitCode"  placeholder="Enter Code" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="unitName" class="control-label col-md-3">Name:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="unitName" id="unitName"  placeholder="Enter Code" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="active" class="control-label col-md-3">active:</label>
        <div class="col-md-9">
            <form:select id="active" path="active" class="form-control" >
                <form:option value="yes">Yes</form:option>
                <form:option value="no">No</form:option>
            </form:select>
        </div>
    </div>

    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${unit.unitID}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'unit');" >ยกเลิก</button>
        </c:if>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">ยกเลิก</button>
    </div>

</form:form>

<script type="text/javascript">

    $(document).ready(function() {
        $('#manageForm').formValidation({
            message: 'This value is not valid',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                unitCode: {
                    message: 'The unitCode is not valid',
                    validators: {
                        stringLength: {
                            max: 10,
                            message: 'The unitName must  less than 10 characters long'
                        }
                    }
                },
                unitName: {
                    message: 'The unitName is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The unitName is required'
                        },
                        stringLength: {
                            max: 100,
                            message: 'The unitName must  less than 100 characters long'
                        }
                    }
                },
                active: {
                    message: 'The active is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The active is required'
                        }
                    }
                }
            }
        }) .on('success.form.fv', function(e) {
                var frm = $('#manageForm');
                e.preventDefault();

                var data = {};

                //Gather Data also remove undefined keys(buttons)
                $.each(this, function(i, v){
                    var input = $(v);
                    data[input.attr("name")] = input.val();
                    delete data["undefined"];
                });
                $.ajax({
                    contentType : 'application/json; charset=utf-8',
                    type: frm.attr('method'),
                    url: frm.attr('action'),
                    dataType : 'json',
                    data : JSON.stringify(data),
                    success : function(result){
                        closeLoadingModal();
                        showMessageAlert(result.icon,result.header,result.content,result.color);
                        if(result.color != "alert-info"){
                            closeModal("modalUserManage");
                            reloadPageOldAjax();
                        }
                    },
                    error : function(result){
                        closeLoadingModal();
                        showMessageAlert("fa-warning","แจ้งเตือน","เกิดข้อผิดพลาดกรุณาแจ้งผู้ดูแลระบบ","alert-danger");
                    }
                });

        });


    });
</script>