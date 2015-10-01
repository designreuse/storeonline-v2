<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="supplier"  id="manageForm" role="form" class="form-horizontal" action="supplier/save" method="post" >
    <form:hidden path="supplierID" ></form:hidden>

    <div class="form-group">
        <label for="companyName" class="control-label col-md-3">companyName:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="companyName" id="companyName"  placeholder="Enter companyName" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="contractName" class="control-label col-md-3">contractName:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="contractName" id="contractName"  placeholder="Enter contractName" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="phoneOffice" class="control-label col-md-3">phoneOffice:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="phoneOffice" id="phoneOffice"  placeholder="Enter phoneOffice" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="phomeMobile" class="control-label col-md-3">phomeMobile:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="phomeMobile" id="phomeMobile"  placeholder="Enter phomeMobile" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="fax" class="control-label col-md-3">fax:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="fax" id="fax"  placeholder="Enter fax" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="control-label col-md-3">email:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="email" id="email"  placeholder="Enter email" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="control-label col-md-3">address:</label>
        <div class="col-md-9">
            <form:textarea class="form-control" path="address" id="address"  placeholder="Enter address" ></form:textarea>
        </div>
    </div>
    <div class="form-group">
            <label for="provinceID" class="control-label col-md-3">จังหวัด:</label>
            <div class="col-md-9">
            <form:select id="provinceID" path="provinceID" class="form-control" >
                <form:option value="0">-- Select --</form:option>
                <c:if test="${not empty provinceList}">
                    <c:forEach var="listObject" items="${provinceList}">
                        <form:option value="${listObject.provinceID}">${listObject.provinceName}</form:option>
                    </c:forEach>
                </c:if>
            </form:select>
            </div>
    </div>
    <div class="form-group">
            <label for="provinceID" class="control-label col-md-3">อำเภท:</label>
            <div class="col-md-9">
                <form:select id="amphurID" path="amphurID" class="form-control" >
                    <form:option value="0">-- Select --</form:option>
                    <c:if test="${not empty amphurList}">
                        <c:forEach var="listObject" items="${amphurList}">
                            <form:option value="${listObject.amphurID}">${listObject.amphurName}</form:option>
                        </c:forEach>
                    </c:if>
                </form:select>
            </div>
    </div>
    <div class="form-group">
        <label for="provinceID" class="control-label col-md-3">ตำบล:</label>
        <div class="col-md-9">
            <form:select id="districtID" path="districtID" class="form-control" >
                <form:option value="0">-- Select --</form:option>
                <c:if test="${not empty districtList}">
                    <c:forEach var="listObject" items="${districtList}">
                        <form:option value="${listObject.districtID}">${listObject.districtName}</form:option>
                    </c:forEach>
                </c:if>
            </form:select>
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="control-label col-md-3">รหัสไปรษณีย์:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="zipcode" id="zipcode"  placeholder="Enter zipcode" ></form:input>
        </div>
    </div>

    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${supplier.supplierID}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'supplier');" >ยกเลิก</button>
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
                companyName: {
                    validators: {
                        notEmpty: {
                            message: 'The companyName is required'
                        },
                        stringLength: {
                            max: 100,
                            message: 'The companyName must  less than 100 characters long'
                        }
                    }
                },
                contractName: {
                    validators: {
                        stringLength: {
                            max: 100,
                            message: 'The companyName must  less than 100 characters long'
                        }
                    }
                },
                phoneOffice: {
                    validators: {
                        stringLength: {
                            max: 30,
                            message: 'The phoneOffice must  less than 30 characters long'
                        }
                    }
                },
                phomeMobile: {
                    validators: {
                        stringLength: {
                            max: 30,
                            message: 'The phomeMobile must  less than 30 characters long'
                        }
                    }
                },
                fax: {
                    validators: {
                        stringLength: {
                            max: 30,
                            message: 'The fax must  less than 30 characters long'
                        }
                    }
                },
                email: {
                    validators: {
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        },
                        stringLength: {
                            max: 50,
                            message: 'The fax must  less than 50 characters long'
                        }
                    }
                },
                zipcode: {
                    validators: {
                        stringLength: {
                            max: 10,
                            message: 'The zipcode must  less than 10 characters long'
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


<script type="text/javascript">
    $(document).ready(function(){
        $( "#provinceID" ).change(function() {
            $.ajax({
                url: "<c:url value="/main/amphur/findAllAjax" ></c:url>" ,
                type: 'POST',
                datatype:'json',
                data: {
                    provinceID: $("#provinceID").val()
                },
                success: function(data){
                    $('#amphurID').html('');// to clear the previous option
                    $('#amphurID').append($('<option>').text('-- Select --').attr('value', '0'));
                    $.each(data, function(index, amphur) {
                        $('#amphurID').append($('<option>').text(amphur.amphurName).attr('value', amphur.amphurID));
                    });
                }
            });
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $( "#amphurID" ).change(function() {
            $.ajax({
                url: "<c:url value="/main/district/findAllAjax" ></c:url>" ,
                type: 'POST',
                datatype:'json',
                data: {
                    provinceID: $("#provinceID").val(),amphurID: $("#amphurID").val()
                },
                success: function(data){
                    $('#districtID').html('');// to clear the previous option
                    $('#districtID').append($('<option>').text('-- Select --').attr('value', '0'));
                    $.each(data, function(index, district) {
                        $('#districtID').append($('<option>').text(district.districtName).attr('value', district.districtID));
                    });
                }
            });
        });
    });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        $( "#districtID" ).change(function() {
            $.ajax({
                url: "<c:url value="/main/zipcode/findOneAjax" ></c:url>" ,
                type: 'POST',
                datatype:'json',
                data: {
                    districtID: $("#districtID").val()
                },
                success: function(data){
                    $("#zipcode").val(data.zipcode);
                }
            });
        });
    });
</script>