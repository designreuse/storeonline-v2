<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<section class="content">
    <div class="row">
        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <div class="col-md-12">
                <div class="form-group form-horizontal">
                    <table id="mainDataTableView" class="table table-bordered table-hover  mainDataTable" role="grid" >
                        <thead>
                        <tr role="row">
                            <th class="sorting" >warehouseName</th>
                            <th class="sorting" >productCode</th>
                            <th class="sorting" >productName</th>
                            <th class="sorting" >brandID</th>
                            <th class="sorting" >catagoryID</th>
                            <th class="sorting" >จำนวน</th>
                            <th class="sorting" >unitID</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty warehouseProductList}">
                            <c:forEach var="listObject" items="${warehouseProductList}">
                                <tr role="row" class="odd">
                                    <td>${listObject.warehouse.warehouseName}</td>
                                    <td align="center">${listObject.product.productCode}</td>
                                    <td>${listObject.product.productName}</td>
                                    <td align="center">${listObject.product.brand.brandName}</td>
                                    <td align="center">${listObject.product.catagory.catagoryName}</td>
                                    <td align="right">${listObject.unitsInStockText}</td>
                                    <td align="center">${listObject.product.unit.unitName}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>
        </div>

    </div>
</section>

<script type="text/javascript">
    // **  add thai language ** //
    $(document).ready(function() {
        $(function () {
            $('#mainDataTableView').dataTable({
                "bPaginate": true,
                "bLengthChange": true,
                "bFilter": true,
                "bSort": true,
                "bInfo": true,
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
    });
</script>

