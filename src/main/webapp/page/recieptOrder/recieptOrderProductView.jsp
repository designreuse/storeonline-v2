<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<section class="content">
    <div class="row">

     <%--   <form:form commandName="product"  id="mainFormtest"  action="" method="post" >
            <form:hidden path="productID" id="mainIdtest"></form:hidden>
        </form:form>--%>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

         <div class="col-md-2">
            <div class="box box-solid box-primary ">
                <div class="box-header  with-border">
                    <h3 class="box-title">ค้นหา</h3>
                    <div class="box-tools">
                        <button class="btn btn-box-tool fix-collapse" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class="box-body" style="display: block;">
                    <form class="form-horizotal" role="form">
                    <div class="form-group">
                        <label >productCode</label>
                        <input id="input_criteria_0" class="form-control" placeholder="Enter productCode" >
                    </div>
                    <div class="form-group">
                        <label >productName</label>
                        <input id="input_criteria_1" class="form-control" placeholder="Enter productName" >
                    </div>
                    <div class="form-group">
                        <label >description</label>
                        <input id="input_criteria_2" class="form-control" placeholder="Enter description" >
                    </div>
                    <div class="form-group">
                        <c:if test="${not empty catagoryList}">
                            <label>ประเภท:</label>
                            <select id="select_criteria_3" class="form-control" >
                                <option value="">Select</option>
                                <c:forEach var="listObject" items="${catagoryList}">
                                    <option value="${listObject.catagoryName}">${listObject.catagoryName}</option>
                                </c:forEach>
                            </select>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <c:if test="${not empty brandList}">
                            <label>ยี่หอ:</label>
                            <select id="select_criteria_4" class="form-control" >
                                <option value="">Select</option>
                                <c:forEach var="listObject" items="${brandList}">
                                    <option value="${listObject.brandName}">${listObject.brandName}</option>
                                </c:forEach>
                            </select>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <c:if test="${not empty unitList}">
                            <label>หน่วย:</label>
                            <select id="select_criteria_5" class="form-control" >
                                <option value="">Select</option>
                                <c:forEach var="listObject" items="${unitList}">
                                    <option value="${listObject.unitName}">${listObject.unitName}</option>
                                </c:forEach>
                            </select>
                        </c:if>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

       <div class="col-md-10">
            <div class="box box-solid box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">ผลการค้นหา</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool fix-collapse" data-widget="collapse" ><i class="fa fa-minus"></i></button>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body">

                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div>
                        <div class="row"><div class="col-sm-12">
                            <table id="mainDataTableShowPopup" class="table table-bordered table-hover dataTable mainDataTable" role="grid" >
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" >productCode</th>
                                        <th class="sorting" >productName</th>
                                        <th class="sorting" >description</th>
                                        <th class="sorting" >catagory</th>
                                        <th class="sorting" >brand</th>
                                        <th class="sorting" >unit</th>
                                        <th class="sorting">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty productList}">
                                    <c:forEach var="listObject" items="${productList}">
                                        <tr role="row" class="odd">
                                            <td>${listObject.productCode}</td>
                                            <td>${listObject.productName}</td>
                                            <td>${listObject.description}</td>
                                            <td>${listObject.catagory.catagoryName}</td>
                                            <td >${listObject.brand.brandName}</td>
                                            <td>${listObject.unit.unitName}</td>
                                            <td align="center">
                                                <button type="submit" class="btn btn-success btn-xs"
                                                        onclick="addProduct('${listObject.productID}','${listObject.productCode}','${listObject.productName}','${listObject.catagory.catagoryName}','${listObject.brand.brandName}','${listObject.unit.unitName}');">
                                                    <i class="fa fa-plus"></i>
                                                </button>
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
            </div>
        </div>


    </div>
</section>

<script type="text/javascript">

    // **  add for bug ajax reload ** //
    $(document).ready(function() {
        $(".fix-collapse").click(function() {
            //Find the box parent........
            var box = $(this).parents(".box").first();
            //Find the body and the footer
            var bf = box.find(".box-body, .box-footer");
            if (!$(this).children().hasClass("fa-plus")) {
                $(this).children(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
                bf.slideUp();
            } else {
                //Convert plus into minus
                $(this).children(".fa-plus").removeClass("fa-plus").addClass("fa-minus");
                bf.slideDown();
            }
        });
    } );

    // **  add thai language ** //
    $(document).ready(function() {
        $(function () {
            $('#mainDataTableShowPopup').dataTable({
                "bPaginate": true,
                "bLengthChange": true,
                "bFilter": true,
                "bSort": true,
                "bInfo": true,
                "bAutoWidth": true,
                "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
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


        $('[id^="input_criteria_"]').on( 'keyup', function () {
            var colId = this.id.split("_").pop();
            searchDatatableByInput('mainDataTableShowPopup',colId,this.value);
        } );

        $('[id^="select_criteria_"]').on( 'change', function () {
            var colId = this.id.split("_").pop();
            searchDatatableByInput('mainDataTableShowPopup',colId,this.value);
        } );
    } );



</script>

