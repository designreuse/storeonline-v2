<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_1" data-toggle="tab">รายละเอียด</a></li>
            <c:if test="${not empty warehouseProductList}">
                <li><a href="#tab_2" data-toggle="tab">คลังสินค้า</a></li>
            </c:if>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab_1">


            <form:form commandName="product" id="manageForm" role="form" class="form-horizontal" action="product/save"  method="post">
                <form:hidden path="productID"></form:hidden>
                <div class="row">
                    <div class="col-md-9">

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="productCode" class="control-label col-md-4">รหัสสินค้า:</label>

                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" path="productCode" id="productCode"
                                                    placeholder="Enter productCode"></form:input>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <c:if test="${not empty catagoryList}">
                                        <label for="catagoryID" class="control-label col-md-4">ประเภท:</label>
                                        <div class="col-md-8">
                                            <form:select id="catagoryID" path="catagoryID" class="form-control">
                                                <form:option value="">-- select --</form:option>
                                                <c:forEach var="listValue" items="${catagoryList}">
                                                    <form:option
                                                            value="${listValue.catagoryID}">${listValue.catagoryName}</form:option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </c:if>
                                </div>
                             </div>
                         </div>


                        <div class="form-group">
                            <label for="productName" class="control-label col-md-2">ชื่อสินค้า:</label>

                            <div class="col-md-10">
                                <form:input type="text" class="form-control" path="productName" id="productName"
                                            placeholder="Enter Code"></form:input>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="brandID" class="control-label col-md-4">ยี่หอ:</label>
                                    <div class="col-md-8">
                                        <form:select id="brandID" path="brandID" class="form-control">
                                            <form:option value="">-- select --</form:option>
                                            <c:forEach var="listValue" items="${brandList}">
                                                <form:option
                                                        value="${listValue.brandID}">${listValue.brandName}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <c:if test="${not empty catagoryList}">
                                        <label for="catagoryID" class="control-label col-md-4">หน่วยนับ:</label>
                                        <div class="col-md-8">
                                            <form:select id="unitID" path="unitID" class="form-control">
                                                <form:option value="">-- select --</form:option>
                                                <c:forEach var="listValue" items="${unitList}">
                                                    <form:option value="${listValue.unitID}">${listValue.unitName}</form:option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="unitsInStock" class="control-label col-md-4">จำนวน:</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control numberFormat" path="unitsInStock" id="unitsInStock"
                                                    placeholder="Enter unitsInStock"></form:input>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="unitCost" class="control-label col-md-4">ราคาทุน:</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control currencyFormat" path="unitCost" id="unitCost"
                                                    placeholder="Enter unitCost"></form:input>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="unitsOnOrder" class="control-label col-md-4">ซื้อครั้งละ:</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control numberFormat" path="unitsOnOrder" id="unitsOnOrder"
                                                    placeholder="Enter unitsOnOrder"></form:input>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="unitPrice" class="control-label col-md-4">ราคาขาย:</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control currencyFormat" path="unitPrice" id="unitPrice"
                                                    placeholder="Enter unitPrice"></form:input>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="pointOfOrder" class="control-label col-md-4">จุดสั่งซื้อ:</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control numberFormat" path="pointOfOrder" id="pointOfOrder"
                                                    placeholder="Enter pointOfOrder"></form:input>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="active" class="control-label col-md-4">ใช้งาน:</label>
                                    <div class="col-md-8">
                                        <form:select id="active" path="active" class="form-control">
                                            <form:option value="yes">Yes</form:option>
                                            <form:option value="no">No</form:option>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="description" class="control-label col-md-2">รายละเอียด:</label>

                            <div class="col-md-10">
                                <form:textarea type="text" class="form-control" path="description" id="description"
                                               placeholder="Enter description"></form:textarea>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="col-md-12">
                                <img id="picture" src="<c:url value='/dist/img/images_no_image.jpg'/>"
                                     class="img-thumbnail" style="width: 180;height: 180px;">
                            </div>
                        </div>

                    </div>
                </div>
            </form:form>


            </div>
            <c:if test="${not empty warehouseProductList}">
                <div class="tab-pane" id="tab_2">
                    <%@include file="/page/product/warehouseProductView.jsp" %>
                </div>
            </c:if>
        </div>
    </div>


    <div class="modal-footer modal-footer-modify">
        <button type="button" class="btn btn-primary " id="submit" onclick="$('#manageForm').submit();">บันทึก</button>
        <c:set var="manageId" value="${product.productID}"/>
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'product');">ยกเลิก</button>
        </c:if>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">ยกเลิก</button>
    </div>

<script type="text/javascript">

    $(document).ready(function(){

        $( ".currencyFormat" ).each(function( index ) {
            currencyFormat(this);
        });

        $('.currencyFormat').change(function(){
            currencyFormat(this);
        });

        $('.currencyFormat').focus(function(){
            currencyFormatKey(this);
        });

        $('.currencyFormat').blur(function(){
            currencyFormat(this);
        });


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

    $(document).ready(function () {
        $('#manageForm').formValidation({
            message: 'This value is not valid',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                productCode: {
                    message: 'The productCode is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The productCode is required'
                        },
                        stringLength: {
                            max: 50,
                            message: 'The productCode must  less than 50 characters long'
                        }
                    }
                },
                productName: {
                    message: 'The productName is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The productName is required'
                        },
                        stringLength: {
                            max: 100,
                            message: 'The productName must  less than 100 characters long'
                        }
                    }
                },
                catagoryID: {
                    message: 'The catagoryID is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The catagoryID is required'
                        }
                    }
                },
                brandID: {
                    message: 'The brandID is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The brandID is required'
                        }
                    }
                },
                unitID: {
                    message: 'The unitID is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The unitID is required'
                        }
                    }
                },
                unitsInStock: {
                    message: 'The unitsInStock is not valid',
                    validators: {
                        stringLength: {
                            max: 10,
                            message: 'The unitCost must  less than 10 long'
                        }
                    }
                },
                unitsOnOrder: {
                    message: 'The unitsInStock is not valid',
                    validators: {
                        stringLength: {
                            max: 10,
                            message: 'The unitCost must  less than 10 long'
                        }
                    }
                },
                pointOfOrder: {
                    message: 'The unitsInStock is not valid',
                    validators: {
                        stringLength: {
                            max: 10,
                            message: 'The unitCost must  less than 10 long'
                        }
                    }
                },
                unitCost: {
                    message: 'The unitsInStock is not valid',
                    validators: {
                        stringLength: {
                            max: 20,
                            message: 'The unitCost must  less than 20 long'
                        }
                       /* regexp: {
                            regexp: /^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,} (\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/,
                            message: 'The username can only consist of alphabetical, number, dot and underscore'
                        }*/
                    }
                },
                unitPrice: {
                    message: 'The unitsInStock is not valid',
                    validators: {
                        stringLength: {
                            max: 20,
                            message: 'The unitCost must  less than 20 long'
                        }
                       /* regexp: {
                            regexp: /^\$?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,} (\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/,
                            message: 'The username can only consist of alphabetical, number, dot and underscore'
                        }*/
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
        }).on('success.form.fv', function (e) {

            $( ".currencyFormat" ).each(function( index ) {
                currencyFormatKey(this);
            });
            $( ".numberFormat" ).each(function( index ) {
                numberFormatKey(this);
            });

            var frm = $('#manageForm');
            e.preventDefault();

            var data = {};

            //Gather Data also remove undefined keys(buttons)
            $.each(this, function (i, v) {
                var input = $(v);
                data[input.attr("name")] = input.val();
                delete data["undefined"];
            });
            $.ajax({
                contentType: 'application/json; charset=utf-8',
                type: frm.attr('method'),
                url: frm.attr('action'),
                dataType: 'json',
                data: JSON.stringify(data),
                success: function (result) {
                    closeLoadingModal();
                    showMessageAlert(result.icon, result.header, result.content, result.color);
                    if (result.color != "alert-info") {
                        closeModal("modalUserManage");
                        reloadPageOldAjax();
                    }
                },
                error: function (result) {
                    closeLoadingModal();
                    showMessageAlert("fa-warning", "แจ้งเตือน", "เกิดข้อผิดพลาดกรุณาแจ้งผู้ดูแลระบบ", "alert-danger");
                }
            });

        });


    });
</script>