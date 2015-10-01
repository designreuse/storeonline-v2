<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="warehouseProduct"  id="manageForm" role="form" class="form-horizontal" action="warehouse/product/saveFindOne" method="post" >
    <form:hidden path="warehouseProductID" ></form:hidden>

    <div class="form-group">
        <label class="col-md-3 control-label">productCode:</label>
        <div class="col-md-9">
            <p class="form-control-static">${warehouseProduct.product.productCode}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">productName:</label>
        <div class="col-md-9">
            <p class="form-control-static">${warehouseProduct.product.productName}</p>
        </div>

    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">brandName:</label>
        <div class="col-md-9">
            <p class="form-control-static">${warehouseProduct.product.brand.brandName}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">catagoryName:</label>
        <div class="col-md-9">
            <p class="form-control-static">${warehouseProduct.product.catagory.catagoryName}</p>
        </div>
    </div>

    <div class="form-group">
        <label for="unitsInStock" class="control-label col-md-3">unitsInStock:</label>
        <div class="col-md-4">
            <form:input type="text" class="form-control numberFormat" path="unitsInStock" id="unitsInStock" placeholder="Enter unitsInStock" ></form:input>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-3 control-label">unitName:</label>
        <div class="col-md-9">
            <p class="form-control-static">${warehouseProduct.product.unit.unitName}</p>
        </div>
    </div>



    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${warehouseProduct.warehouseProductID}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'warehouse/product');" >ยกเลิก</button>
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
                unitsInStock: {
                    validators: {
                        integer: {
                            message: 'The value is not an integer'
                        },
                        stringLength: {
                            max: 10,
                            message: 'The amount must  less than 10 long'
                        }
                    }
                }
            }
        }) .on('success.form.fv', function(e) {

                $( ".numberFormat").each(function( index ) {
                    numberFormatKey(this);
                });

                var frm = $('#manageForm');
                e.preventDefault();

                var data = {};

                //Gather Data also remove undefined keys(buttons)
                $.each(this, function(i, v){
                    var input = $(v);
                    data[input.attr("name")] = input.val();
                    delete data["undefined"];
                });
                openLoadingModal
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
                            closeModal("modalManageFindOne");
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
        $( ".numberFormat").each(function( index ) {
            numberFormat(this);
        });

        $('.numberFormat').change(function(){
            numberFormat(this);
        });

        $('.numberFormat').focus(function(){
            numberFormatKey(this);
        });

        $('.numberFormat').blur(function(){
            numberFormat(this);
        });

    });
</script>