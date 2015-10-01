<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="customer"  id="manageForm" role="form" class="form-horizontal" action="customer/save" method="post" >
    <form:hidden path="customerID" ></form:hidden>


    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_1" data-toggle="tab">ข้อมูลลูกค้า</a></li>
            <li><a href="#tab_2" data-toggle="tab">ข้อมูลการออกบิล</a></li>
            <li><a href="#tab_3" data-toggle="tab">ประวัติการซื้อขาย</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab_1">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="customerCode" class="control-label col-md-3">รหัสลูกค้า :</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="customerCode" id="customerCode"  placeholder="Enter customerCode" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstNameTh" class="control-label col-md-3">ชื่อ:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="firstNameTh" id="firstNameTh"  placeholder="Enter firstNameTh" ></form:input>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">เบอร์โทรศัพท์:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">ที่อยู่:</label>
                            <div class="col-md-9">
                                <form:textarea type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:textarea>
                            </div>
                        </div>


                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="firstNameTh" class="control-label col-md-3">ชื่อบริษัท:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="firstNameTh" id="firstNameTh"  placeholder="Enter firstNameTh" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">นามสกุล:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">มือถือ:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">Email:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:input>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_2">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="customerCode" class="control-label col-md-3">ชื่อผู้ติดต่อ :</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="customerCode" id="customerCode"  placeholder="Enter customerCode" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstNameTh" class="control-label col-md-3">เบอร์โทรศัพท์:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="firstNameTh" id="firstNameTh"  placeholder="Enter firstNameTh" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">แฟกส์:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:input>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">ออกในนามบริษัท:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">มือถือ:</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastNameTh" class="control-label col-md-3">ที่อยู่:</label>
                            <div class="col-md-9">
                                <form:textarea type="text" class="form-control" path="lastNameTh" id="lastNameTh"  placeholder="Enter lastNameTh" ></form:textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_3">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="customerCode" class="control-label col-md-3">ประวัติ :</label>
                            <div class="col-md-9">
                                <form:input type="text" class="form-control" path="customerCode" id="customerCode"  placeholder="Enter customerCode" ></form:input>
                            </div>
                        </div>

                    </div>
                </div>
            </div><!-- /.tab-pane -->
        </div><!-- /.tab-content -->
    </div>


    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${customer.customerID}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId});" >ยกเลิก</button>
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
                customerCode: {
                    message: 'The customerCode is not valid',
                    validators: {
                        stringLength: {
                            max: 10,
                            message: 'The name must  less than 10 characters long'
                        }
                    }
                },
                firstNameTh: {
                    message: 'The firstNameTh is not valid',
                    validators: {
                        stringLength: {
                            max: 100,
                            message: 'The firstNameTh must  less than 100 characters long'
                        }
                    }
                },
                lastNameTh: {
                    message: 'The lastNameTh is not valid',
                    validators: {
                        stringLength: {
                            max: 100,
                            message: 'The lastNameTh must  less than 100 characters long'
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


