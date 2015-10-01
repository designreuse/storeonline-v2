<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
    var countProduct = <c:out value="${purchaseOrder.purchaseOrderProductList.size()}" ></c:out>
</script>

<form:form commandName="purchaseOrder"  id="purchaseOrderForm" role="form" class="form-horizontal" action="purchaseOrder/save" method="post" >
    <form:hidden path="purchaseOrderID" ></form:hidden>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="purchaseCode" class="control-label col-md-3">purchaseCode:</label>
                <div class="col-md-9">
                    <form:input type="text" class="form-control" path="purchaseCode" id="purchaseCode"  placeholder="Enter purchaseCode" ></form:input>
                </div>
            </div>
        </div>
        <div class="col-md-6">
        <div class="form-group">
            <label for="purchaseDateText" class="control-label col-md-3">purchaseDate:</label>
            <div class="col-md-9" >
                <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                <form:input type="text" class="form-control input-datepicker" path="purchaseDateText" id="purchaseDateText"  placeholder="Enter purchaseDateText"  ></form:input>
                </div>
            </div>
        </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="purchaseCode" class="control-label col-md-3">supplierID:</label>
                <div class="col-md-9">
                    <div class="input-group">
                        <form:input type="hidden" class="form-control" path="supplier.supplierID" id="supplierID" value="${purchaseOrder.supplier.supplierID}"  placeholder="Enter supplierID" ></form:input>
                        <form:input type="text" class="form-control" path="supplier.companyName" id="companyName" value="${purchaseOrder.supplier.companyName}"  placeholder="Enter supplierID" readonly="true" ></form:input>
                        <span class="input-group-addon"
                              onclick="javascript:$('#supplierModal .modal-body').load('<c:url value="/main/supplier/view"/>',function(e){$('#supplierModal').modal('show');}); ">
                            <i class="fa fa-search"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="requiredDateText" class="control-label col-md-3">requiredDate:</label>
                <div class="col-md-9" >
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                        <form:input type="text" class="form-control input-datepicker" path="requiredDateText" id="requiredDateText"  placeholder="Enter requiredDateText"  ></form:input>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="remark" class="control-label col-md-3">remark:</label>
                <div class="col-md-9">
                    <form:textarea  class="form-control" path="remark" id="remark"  placeholder="Enter remark" ></form:textarea>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="referenceNumber" class="control-label col-md-3">referenceNumber:</label>
                <div class="col-md-9">
                    <form:input type="text" class="form-control" path="referenceNumber" id="referenceNumber"  placeholder="Enter referenceNumber" ></form:input>
                </div>
            </div>
        </div>
    </div>


    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <div class="row">
    <div class="col-md-12">
                <a  href="javascript:$('#productModal .modal-body').load('<c:url value="/main/purchaseOrder/product/view"/>',function(e){$('#productModal').modal('show');});"
                   class="btn btn-primary">เพิ่มข้อมูลสินค้า
                </a>
                <%--<input type="hidden" name="warehouseID" value="<c:out value="${warehouseID}"/>" />--%>
                <table id="datatable-product" class="table table-bordered table-hover dataTable mainDataTable table-bg-orange" role="grid" >
                    <thead>
                    <tr role="row">
                        <th>productCode</th>
                        <th>productName</th>
                        <th>catagory</th>
                        <th>brand</th>
                        <th>unit</th>
                        <th>amount</th>
                        <th>price</th>
                        <th>total price</th>
                        <th>action</th>
                    </tr>
                    </thead>
                    <c:if test="${not empty purchaseOrder.purchaseOrderProductList}">
                        <c:forEach var="listObject"  items="${purchaseOrder.purchaseOrderProductList}" varStatus="loop">
                            <tr role="row" class="odd" style="text-align: center;">
                                <td>
                                    <input type='hidden' name='purchaseOrderProductList[${loop.index}].productID' id='productID_${loop.index}' value="${listObject.product.productID}" />
                                    <input type='hidden' name='purchaseOrderProductList[${loop.index}].purchaseOrderProductID' id='purchaseOrderProductID_${loop.index}' value="${listObject.purchaseOrderProductID}" />
                                    ${listObject.product.productCode}
                                </td>
                                <td>${listObject.product.productName}</td>
                                <td>${listObject.product.catagory.catagoryName}</td>
                                <td>${listObject.product.brand.brandName}</td>
                                <td>${listObject.product.unit.unitName}</td>
                                <td><div class='form-group'><input type='text' class='form-control numberFormat' name='purchaseOrderProductList[${loop.index}].amount' id='amount_${loop.index}'  value='${listObject.amount}' onchange='calculateTotalAmount(${loop.index})' /></div></td>
                                <td><div class='form-group'><input type='text' class='form-control currencyFormat' name='purchaseOrderProductList[${loop.index}].price' id='price_${loop.index}'  value='${listObject.price}' onchange='calculateTotalAmount(${loop.index})' /></div></td>
                                <td><div class='form-group'><input type='text' class='form-control currencyFormat' id='totalPrice_${loop.index}' readonly value='0' /></div></td>
                                <td><button type='button' class='btn btn-danger btn-xs'  data-toggle='tooltip' title='' data-original-title='delete' onclick='removeProduct(this);'> <i class='fa fa-trash'></i></button></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>

    </div>
    </div>

    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <%-- ------------------------------------ calculate money --------------------------------------------------- --%>
    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <div class="row">
        <div class="col-md-12 pull-right">
            <div class="form-group">
                <label for="sumPrice" class="control-label col-md-10">จำนวนเงิน:</label>
                <div class="col-md-2">
                    <div class="input-group">
                        <input type="text" class="form-control currencyFormat" id="sumPrice" disabled="true"  />
                        <span class="input-group-addon">บาท</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 pull-right">
            <div class="form-group">
                <label for="vat" class="control-label col-md-8">ภาษีมูลค่าเพิ่ม:</label>
                  <div class="col-md-2">
                      <div class="input-group">
                           <form:input type="text" class="form-control currencyFormat" path="vat" id="vat"  onchange="calculateSumPriceVat();"></form:input>
                          <span class="input-group-addon"> %</span>
                      </div>
                  </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <input type="text" class="form-control currencyFormat" id="sumPriceVat" disabled="true"  />
                        <span class="input-group-addon">บาท</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 pull-right">
            <div class="form-group">
                <label for="sumPriceAll" class="control-label col-md-10">จำนวนเงินรวมสุทธิ:</label>
                <div class="col-md-2">
                    <div class="input-group">
                        <input type="text" class="form-control currencyFormat" id="sumPriceAll" disabled="true"  />
                        <span class="input-group-addon">บาท</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${purchaseOrder.purchaseOrderID}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'purchaseOrder');" >ยกเลิก</button>
        </c:if>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">ยกเลิก</button>
    </div>

</form:form>

<script type="text/javascript">
    function calculateTotalAmount(indexRow){
        var amount = $("#amount_"+indexRow).val();
        var price = $("#price_"+indexRow).val();
        var totalPrice = currencyFormatKeyValue(amount)*currencyFormatKeyValue(price);
        $("#totalPrice_"+indexRow).val(currencyFormatValue(totalPrice));
        calculateSumPrice();
    }


    // Main call function calculate
    function calculateSumPrice(){
        var sumPrice = 0;
        $('[id^="totalPrice_"]').each(function(i) {
            sumPrice += parseInt(currencyFormatKeyValue($(this).val()));
        });
        $("#sumPrice").val(currencyFormatValue(sumPrice));

        calculateSumPriceVat();
    }

    function calculateSumPriceVat(){
        var sumPrice = currencyFormatKeyValue($("#sumPrice").val());
        var vat = numberFormatKeyValue($("#vat").val());
        $("#sumPriceVat").val(currencyFormatValue((sumPrice*vat)/100));

        calculateSumPriceAll();
    }

    function calculateSumPriceAll(){
        var sumPrice = parseInt(currencyFormatKeyValue($("#sumPrice").val()));
        var sumPriceVat = parseInt(currencyFormatKeyValue($("#sumPriceVat").val()));
        $("#sumPriceAll").val(currencyFormatValue(sumPrice+sumPriceVat));
    }

    function addProduct(productID,productCode,productName,catagory,brand,unit){
        var tableProduct = $('#datatable-product').DataTable();
        var btDelete = " <button type='button' class='btn btn-danger btn-xs'  data-toggle='tooltip' title='' data-original-title='delete' onclick='removeProduct(this);'> <i class='fa fa-trash'></i></button>";

        var inputProductID = "<input type='hidden' name='purchaseOrderProductList["+countProduct+"].productID' id='productID_"+countProduct+"' value="+productID+" />";
        inputProductID += "<input type='hidden' name='purchaseOrderProductList["+countProduct+"].purchaseOrderProductID' id='purchaseOrderProductID_"+countProduct+"' value='0' />"
        var inputAmount = "<div class='form-group'><input type='text' class='form-control numberFormat'   name='purchaseOrderProductList["+countProduct+"].amount' id='amount_"+countProduct+"'  value='0' onchange='calculateTotalAmount("+countProduct+")' /></div>";
        var inputPrice =  "<div class='form-group'><input type='text' class='form-control currencyFormat' name='purchaseOrderProductList["+countProduct+"].price' id='price_"+countProduct+"'  value='0.00' onchange='calculateTotalAmount("+countProduct+")' /></div>";
        var totalPrice =  "<div class='form-group'><input type='text' class='form-control currencyFormat' id='totalPrice_"+countProduct+"' readonly value='0' /></div>";
        var rowNode = tableProduct.row.add( [inputProductID+productCode,productName,catagory,brand,unit,inputAmount,inputPrice,totalPrice,btDelete] ).draw().node();

        $(rowNode).css('text-align','center');

       /* $('[name$="amount"]').each(function(i) {
            $('#purchaseOrderForm').formValidation('addField', $(this));
        });

        $('[name$="price"]').each(function(i) {
            $('#purchaseOrderForm').formValidation('addField', $(this));
        });*/

        numberFormatData();
        currencyFormatData();
        countProduct++;
        // $('#productModal').data('bs.modal').handleUpdate()
    }

    function removeProduct(obj){
        var tableProduct = $('#datatable-product').DataTable();
        tableProduct.row( $(obj).parents('tr')).remove().draw();
        calculateSumPrice();
    }

    function numberFormatData(){
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
    }

    function currencyFormatData(){
        $( ".currencyFormat").each(function( index ) {
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
    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(".input-datepicker").datepicker({language:'th',format:'dd/mm/yyyy'});

        $( ".currencyFormat").each(function( index ) {
            numberFormat(this);
        });

        $('[id^="productID_"]').each(function(i) {
            var countIndex = $(this).attr("id").replace("productID_","");
            calculateTotalAmount(countIndex);
        });

        numberFormatData();
        currencyFormatData();
    });

    $(document).ready(function() {
        $(function () {
            $('#datatable-product').dataTable({
                "bPaginate": false,
                "bLengthChange": false,
                "bFilter": false,
                "bSort": false,
                "bInfo": false,
                "bAutoWidth": true,
                "language": {
                    "sProcessing":   "กำลังดำเนินการ...",
                    "sLengthMenu":   "แสดง _MENU_ แถว",
                    "sZeroRecords":  "ไม่พบข้อมูล",
                    "sInfo":         "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
                    "sInfoEmpty":    "แสดง 0 ถึง 0 จาก 0 แถว",
                    "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
                    "sInfoPostFix":  "",
                    "sSearch":       "ค้นหา:",
                    "sUrl":          "",
                    "oPaginate": {
                        "sFirst":   "เริ่มต้น",
                        "sPrevious": "ก่อนหน้า",
                        "sNext":     "ถัดไป",
                        "sLast":     "สุดท้าย"
                    }
                }
            });
        });

    } );


    $(document).ready(function() {
        $('#purchaseOrderForm').formValidation({
            message: 'This value is not valid',
            fields: {
                purchaseCode: {
                    message: 'The purchaseCode is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The purchaseCode is required'
                        },
                        stringLength: {
                            max: 20,
                            message: 'The purchaseCode must  less than 10 characters long'
                        }
                    }
                },
                'supplier.companyName': {
                    validators: {
                        notEmpty: {
                            message: 'The supplierID is required'
                        }
                    }
                }
               /* amount: {
                    validators: {
                        integer: {
                            message: 'The value is not an integer'
                        },
                        greaterThan: {
                            value: 0,
                            inclusive: false,
                            message: 'The ages has to be greater than or equals to 10'
                        },
                        stringLength: {
                            max: 10,
                            message: 'The amount must  less than 10 long'
                        }
                    }
                },
                price: {
                    validators: {
                        greaterThan: {
                            value: 0,
                            inclusive: false,
                            message: 'The ages has to be greater than or equals to 10'
                        },
                        stringLength: {
                            max: 7,
                            message: 'The amount must  less than 10 long'
                        }
                    }
                }*/
            }
        }) .on('success.form.fv', function(e) {
                var frm = $('#purchaseOrderForm');
                e.preventDefault();

                $('.currencyFormat').focus(function(){
                    currencyFormatKey(this);
                });

                $('.numberFormat').focus(function(){
                    numberFormatKey(this);
                });

                var purchaseOrderID = <c:out value="${purchaseOrder.purchaseOrderID}"/>;
                var purchaseCode = $('[name="purchaseCode"]').val();
                var purchaseDateText = $('[name="purchaseDateText"]').val();
                var supplierID = $('[name="supplier.supplierID"]').val();
                var requiredDateText = $('[name="requiredDateText"]').val();
                var remark = $('[name="remark"]').val();
                var referenceNumber = $('[name="referenceNumber"]').val();
                var vat = currencyFormatKeyValue($('[name="vat"]').val());

                var purchaseOrderProductList = "";
                $('[id^="productID_"]').each(function(i) {
                    if(purchaseOrderProductList != ""){
                        purchaseOrderProductList += ",";
                    }else{
                        purchaseOrderProductList += "["
                    }
                    purchaseOrderProductList += "{";
                    var countIndex = $(this).attr("id").replace("productID_","");
                    purchaseOrderProductList += '"product":{"productID":"' + $("#productID_"+countIndex).val() + '"}' + ',';
                    purchaseOrderProductList += '"purchaseOrderProductID":"' + $("#purchaseOrderProductID_"+countIndex).val() + '"' + ',';
                    purchaseOrderProductList += '"price":"' + currencyFormatKeyValue($("#price_"+countIndex).val()) + '"' + ',';
                    purchaseOrderProductList += '"amount":"' + numberFormatKeyValue($("#amount_"+countIndex).val()) + '"';
                    purchaseOrderProductList += "}";
                });
                if(purchaseOrderProductList != ""){
                    purchaseOrderProductList += "]";
                }

                var purchaseOrdertext =
                '{' +
                '"purchaseOrderID":"' + purchaseOrderID + '",' +
                '"purchaseCode":"' + purchaseCode + '",' +
                '"purchaseDateText":"' + purchaseDateText + '",' +
                '"supplier":{"supplierID":"' + supplierID + '"},' +
                '"requiredDateText":"' + requiredDateText + '",' +
                '"remark":"' + remark + '",' +
                '"referenceNumber":"' + referenceNumber + '",' +
                '"vat":"' + vat + '",' +
                '"referenceNumber":"' + referenceNumber + '"';
                if(purchaseOrderProductList != ""){
                    purchaseOrdertext += ',"purchaseOrderProductList":' + purchaseOrderProductList + '' ;
                }
                purchaseOrdertext += '}' ;

                //alert(purchaseOrdertext);

                var purchaseOrderObject = JSON.parse(purchaseOrdertext);
                    $.ajax({
                        contentType : 'application/json; charset=utf-8',
                        type: frm.attr('method'),
                        url: frm.attr('action'),
                        dataType : 'json',
                        data : JSON.stringify(purchaseOrderObject),
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