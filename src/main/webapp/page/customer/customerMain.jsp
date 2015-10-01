<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/main/include/headerContent.jsp" %>

<section class="content">
    <div class="row">

        <form:form commandName="customer"  id="mainForm"  action="" method="post" >
            <form:hidden path="customerID" id="mainId"></form:hidden>
        </form:form>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-3">

            <a href="javascript:$('#manageModal .modal-body').load('<c:url value="/main/customer/manage"/>',function(e){$('#manageModal').modal('show');});"
               class="btn btn-primary btn-block margin-bottom">เพิ่มข้อมูลลูกค้า
            </a>

            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">ค้นหา</h3>
                    <div class="box-tools">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class="box-body" style="display: block;">
                    <div class="form-group">
                        <label><spring:message code="customer.customerCode"/></label>
                        <input id="input_criteria_0" class="form-control" placeholder="Enter Code" >
                    </div>
                    <div class="form-group">
                        <label><spring:message code="customer.customerName"/></label>
                        <input id="input_criteria_1" class="form-control" placeholder="Enter Name" >
                    </div>
                    <div class="form-group">
                        <label><spring:message code="search.status"/></label>
                        <select id="user_select_criteria_2" class="form-control" >
                            <option value="">Select</option>
                            <option value="yes"><spring:message code="search.status.active"/></option>
                            <option value="no"><spring:message code="search.status.inactive"/></option>
                        </select>
                    </div>

                </div>
            </div>
        </div>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-9">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">ผลการค้นหา</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" ><i class="fa fa-minus"></i></button>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body">

                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div>
                        <div class="row"><div class="col-sm-12">
                            <table id="customerMainDataTable" class="table table-bordered table-hover dataTable" role="grid" >
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" ><spring:message code="customer.customerCode"/></th>
                                        <th class="sorting" ><spring:message code="customer.customerName"/></th>
                                        <th class="sorting" ><spring:message code="datatable.colume.status"/></th>
                                        <th class="sorting" ><spring:message code="datatable.colume.action"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty customerList}">
                                    <c:forEach var="listObject" items="${customerList}">
                                        <tr role="row" class="odd">
                                            <td>${listObject.customerCode}</td>
                                            <td>${listObject.name}</td>
                                            <td>${listObject.enabled}</td>
                                            <td align="center">
                                                <button type="submit" class="btn btn-warning btn-xs" data-toggle="tooltip" title="" data-original-title="edit"
                                                        onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/customer/manage/?id=${listObject.customerID}"/>',function(e){$('#manageModal').modal('show');});" >
                                                    <i class="fa fa-edit"></i></button>
                                                <button type="submit" class="btn btn-danger btn-xs"  data-toggle="tooltip" title="" data-original-title="delete" onclick="manageDelete(${listObject.customerID});"> <i class="fa fa-trash"></i></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>

                            </table>
                        </div>
                        </div>
                    </div>
                    </form>

                </div>
            </div>
        </div>
    </div>


    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <%-- --------------------------------------- Modal Dialog   ------------------------------------------------- --%>
    <%-- -------------------------------------------------------------------------------------------------------- --%>

    <%-- ----------------------------------------- Modal Add User------------------------------------------------ --%>
    <div class="modal modal-wide fade" id="manageModal" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header ">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">ข้อมูลลูกค้า</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>

</section>

<%--<%@include file="/main/include/headerJavascript.jsp" %>--%>

<script src="<c:url value='/main/js/editBug.js'/>"></script>

<script type="text/javascript">
    // **  add thai language ** //
    $(document).ready(function() {
        $(function () {
           datatable("customerMainDataTable");
        });
    });

    function datatable(id){
        $('#'+id).dataTable({
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": true,
            "lengthMenu": [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, "All"]
            ],
            "language": {
                "sProcessing": "กำลังดำเนินการ...",
                "sLengthMenu": "แสดง _MENU_ แถว",
                "sZeroRecords": "ไม่พบข้อมูล",
                "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
                "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
                "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
                "sInfoPostFix": "",
                "sSearch": "ค้นหา:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "เริ่มต้น",
                    "sPrevious": "ก่อนหน้า",
                    "sNext": "ถัดไป",
                    "sLast": "สุดท้าย"
                }
            }
        });
    }
</script>