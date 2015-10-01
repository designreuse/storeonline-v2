<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="warehouse"  id="manageForm" role="form" class="form-horizontal" action="warehouse/save" method="post" >
    <form:hidden path="warehouseID" ></form:hidden>


    <div class="form-group">
        <label for="warehouseName" class="control-label col-md-3">Name:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="warehouseName" id="warehouseName"  placeholder="Enter warehouseName" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="dealer" class="control-label col-md-3">Dealer:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="dealer" id="dealer"  placeholder="Enter Dealer" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="telephone" class="control-label col-md-3">telephone:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="telephone" id="telephone"  placeholder="Enter telephone" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="control-label col-md-3">address:</label>
        <div class="col-md-9">
            <form:textarea type="text" class="form-control" path="address" id="address"  placeholder="Enter address" ></form:textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="description" class="control-label col-md-3">description:</label>
        <div class="col-md-9">
            <form:textarea type="text" class="form-control" path="description" id="description"  placeholder="Enter description" ></form:textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="active" class="control-label col-md-3">ใช้งาน:</label>
        <div class="col-md-9">
            <form:select id="active" path="active" class="form-control">
                <form:option value="yes">Yes</form:option>
                <form:option value="no">No</form:option>
            </form:select>
        </div>
    </div>

    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${warehouse.warehouseID}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'warehouse');" >ยกเลิก</button>
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
                warehouseName: {
                    message: 'The name is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The warehouseName is required'
                        },
                        stringLength: {
                            max: 100,
                            message: 'The warehouseName must  less than 10 characters long'
                        }
                    }
                },
                dealer: {
                    message: 'The dealer is not valid',
                    validators: {
                        stringLength: {
                            max: 100,
                            message: 'The dealer must  less than 100 characters long'
                        }
                    }
                },
                telephone: {
                    message: 'The telephone is not valid',
                    validators: {
                        stringLength: {
                            max: 20,
                            message: 'The telephone must  less than 20 characters long'
                        }
                    }
                },
                address: {
                    message: 'The address is not valid',
                    validators: {
                        stringLength: {
                            max: 250,
                            message: 'The address must  less than 250 characters long'
                        }
                    }
                },
                description: {
                    message: 'The description is not valid',
                    validators: {
                        stringLength: {
                            max: 200,
                            message: 'The description must  less than 200 characters long'
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