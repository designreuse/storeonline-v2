<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/main/include/headerContent.jsp" %>

<section class="content">
    <div class="row">

        <form:form commandName="warehouseProduct"  id="mainForm"  action="" method="post" >
            <form:hidden path="warehouseProductID" id="mainId"></form:hidden>
        </form:form>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-3">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">คลังสินค้า</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" ><i class="fa fa-minus"></i></button>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body">

                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row"><div class="col-md-6"></div><div class="col-md-6"></div></div>
                        <div class="row"><div class="col-md-12">
                            <table id="mainDataTable" class="table table-bordered table-hover dataTable" role="grid" >
                                <thead>
                                <tr role="row">
                                    <th class="sorting" >warehouseName</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty warehouseList}">
                                    <c:forEach var="listObject" items="${warehouseList}">
                                        <tr role="row" class="odd" style="cursor: pointer;" onclick="reloadPageByActiotOldAjax('<c:url value='/main/warehouse/product/main/?warehouseID=${listObject.warehouseID}'/>');">
                                            <td>${listObject.warehouseName}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty warehouse}">
            <c:if test="${warehouse.warehouseID ne 0}">
                <div class="col-md-9">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">ข้อมูลคลังสินค้า</h3>
                            <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse" ><i class="fa fa-minus"></i></button>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group form-horizontal">
                                <label class="col-md-1 control-label">ชื่อคลัง</label>
                                <div class="col-md-2">
                                    <p class="form-control-static"><c:out value="${warehouse.warehouseName}"/></p>
                                </div>
                                <label class="col-md-1 control-label">ที่ตั้ง</label>
                                <div class="col-md-3">
                                    <p class="form-control-static"><c:out value="${warehouse.address}"/></p>
                                </div>
                                <label class="col-md-2 control-label">รายละเอียด</label>
                                <div class="col-md-3">
                                    <p class="form-control-static"><c:out value="${warehouse.description}"/></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">จัดการข้อมูลสินค้า</h3>
                            <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse" ><i class="fa fa-minus"></i></button>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group form-horizontal">
                                <div class="margin-bottom">
                                  <button type="submit" class="btn btn-success" id="submit" onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/warehouse/product/manage?warehouseID=${warehouse.warehouseID}"/>',function(e){$('#manageModal').modal('show');});" >เพิ่มข้อมูลสินค้า</button>
                                </div>
                                <table id="productMainDataTable" class="table table-bordered table-hover  mainDataTable" role="grid" >
                                    <thead>
                                    <tr role="row">
                                    <%--     <th class="sorting" >id</th>
                                         <th class="sorting" >productID</th>--%>
                                         <th class="sorting" >productCode</th>
                                         <th class="sorting" >productName</th>
                                        <th class="sorting" >brandID</th>
                                        <th class="sorting" >catagoryID</th>
                                        <th class="sorting" >unitsInStockText</th>
                                        <th class="sorting" >unitID</th>
                                        <th class="">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty warehouseProductList}">
                                        <c:forEach var="listObject" items="${warehouseProductList}">
                                            <tr role="row" class="odd">
                                                <%--<td>${listObject.warehouseProductID}</td>
                                                <td>${listObject.product.productID}</td>--%>
                                                <td align="center">${listObject.product.productCode}</td>
                                                <td>${listObject.product.productName}</td>
                                                <td align="center">${listObject.product.brand.brandName}</td>
                                                <td align="center">${listObject.product.catagory.catagoryName}</td>
                                                <td align="right">${listObject.unitsInStockText}</td>
                                                <td align="center">${listObject.product.unit.unitName}</td>
                                                    <td align="center">
                                                        <button type="submit" class="btn btn-warning btn-xs" data-toggle="tooltip" title="" data-original-title="edit"
                                                                onclick="javascript:$('#modalManageFindOne .modal-body').load('<c:url value="/main/warehouse/product/manageFindOne/?id=${listObject.warehouseProductID}"/>',function(e){$('#modalManageFindOne').modal('show');});" >
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="submit" class="btn btn-danger btn-xs"  data-toggle="tooltip" title="" data-original-title="delete" onclick="manageDelete(${listObject.warehouseProductID},'warehouse/product');"> <i class="fa fa-trash"></i></button>
                                                    </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>
    </div>


    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <%-- --------------------------------------- Modal Dialog   ------------------------------------------------- --%>
    <%-- -------------------------------------------------------------------------------------------------------- --%>

    <%-- ------------------------------------- Modal Warehouse Product Manage ----------------------------------- --%>
    <div class="modal  modal-wide  fade" id="manageModal" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header ">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">ข้อมูลสินค้า</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>


    <%-- ------------------------- Modal Warehouse Product Manage Find One ------------------------------------- --%>
    <div class="modal  fade" id="modalManageFindOne" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header ">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">ข้อมูลสินค้า</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>


</section>


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

<%@include file="/main/include/headerJavascript.jsp" %>


