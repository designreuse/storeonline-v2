<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="commonData"  id="manageForm" role="form" class="form-horizontal" action="commonData/save" method="post" >
    <form:hidden path="id" ></form:hidden>

    <div class="form-group">
        <label for="code" class="control-label col-md-3">code:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="code" id="code"  placeholder="Enter code" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="seq" class="control-label col-md-3">seq:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="seq" id="seq"  placeholder="Enter seq" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="value" class="control-label col-md-3">value:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="value" id="value"  placeholder="Enter value" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="control-label col-md-3">name:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="name" id="name"  placeholder="Enter name" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="enabled" class="control-label col-md-3">enabled:</label>
        <div class="col-md-9">
            <form:select id="enabled" path="enabled" class="form-control" >
                <form:option value="yes">Yes</form:option>
                <form:option value="no">No</form:option>
            </form:select>
        </div>
    </div>

    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${commonData.id}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'commonData');" >ยกเลิก</button>
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
                code: {
                    message: 'The code is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The code is required'
                        },
                        stringLength: {
                            max: 30,
                            message: 'The code must  less than 30 characters long'
                        }
                    }
                },
                seq: {
                    message: 'The seq is not valid',
                    validators: {
                        stringLength: {
                            max: 10,
                            message: 'The seq must  less than 10 characters long'
                        }
                    }
                },
                value: {
                    message: 'The value is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The value is required'
                        },
                        stringLength: {
                            max: 20,
                            message: 'The value must  less than 20 characters long'
                        }
                    }
                },
                name: {
                    message: 'The name is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The name is required'
                        },
                        stringLength: {
                            max: 50,
                            message: 'The name must  less than 50 characters long'
                        }
                    }
                },
                enabled: {
                    message: 'The enabled is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The enabled is required'
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