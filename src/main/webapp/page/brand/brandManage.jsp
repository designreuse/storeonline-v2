<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="brand"  id="manageForm" role="form" class="form-horizontal" action="brand/save" method="post" >
    <form:hidden path="brandID" ></form:hidden>

    <div class="form-group">
        <label for="brandName" class="control-label col-md-3">brandName:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="brandName" id="brandName"  placeholder="Enter Code" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="description" class="control-label col-md-3">description:</label>
        <div class="col-md-9">
            <form:textarea type="text" class="form-control" path="description" id="description"  placeholder="Enter description" ></form:textarea>
        </div>
    </div>
 <%--   <div class="form-group">
        <label for="picture" class="control-label col-md-3">picture:</label>
        <div class="col-md-9">
            <form:input type="file" class="form-control" path="picture" id="picture"  placeholder="Enter picture" ></form:input>
        </div>
    </div>--%>
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
        <c:set var="manageId" value="${brand.brandID}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'brand');" >ยกเลิก</button>
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
                brandName: {
                    message: 'The brandName is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The brandName is required'
                        },
                        stringLength: {
                            max: 100,
                            message: 'The brandName must  less than 100 characters long'
                        }
                    }
                },
                description: {
                    message: 'The description is not valid',
                    validators: {
                        stringLength: {
                            max: 250,
                            message: 'The description must  less than 250 characters long'
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