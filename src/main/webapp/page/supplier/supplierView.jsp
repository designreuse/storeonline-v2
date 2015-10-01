<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<section class="content">
    <div class="row">
        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

       <%-- <div class="col-md-3">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">ค้นหา</h3>
                    <div class="box-tools">
                        <button class="btn btn-box-tool modal-view-collapse" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class="box-body" style="display: block;">
                    <div class="form-group">
                        <label >companyName</label>
                        <input id="input_criteria_0" class="form-control" placeholder="Enter companyName" >
                    </div>
                    <div class="form-group">
                        <label >contractName</label>
                        <input id="input_criteria_1" class="form-control" placeholder="Enter contractName" >
                    </div>

                </div>
            </div>
        </div>--%>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-12">

                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div>
                        <div class="row"><div class="col-sm-12">
                            <table id="subDataTableView" class="table table-bordered table-hover dataTable" role="grid" >
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" >ชื่อผู้ผลิต</th>
                                        <th class="sorting" >ที่อยู่</th>
                                        <%--<th class="sorting" >ชื่อผู้ติดต่อ</th>
                                        <th class="sorting" >เบอร์ออฟฟิศ</th>
                                        <th class="sorting" >เบอร์มือถือ</th>
                                        <th class="sorting" >email</th>--%>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty supplierList}">
                                    <c:forEach var="listObject" items="${supplierList}">
                                        <tr role="row" class="odd">
                                            <td>${listObject.companyName}</td>
                                            <td>${listObject.address}</td>
                                           <%-- <td>${listObject.contractName}</td>
                                            <td>${listObject.phoneOffice}</td>
                                            <td>${listObject.phomeMobile}</td>
                                            <td>${listObject.email}</td>--%>
                                            <td align="center">
                                                <button type="button" class="btn btn-success btn-xs"  data-toggle="tooltip" title="" data-original-title="เลือก"
                                                        onclick="manageSupplier('${listObject.supplierID}','${listObject.companyName}');">
                                                    <i class="fa fa-check"></i>
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

</section>

<%@include file="/main/include/modalSubDatatableView.jsp" %>

<script type="text/javascript">
    function manageSupplier(supplierID,companyName){
        $("#supplierID").val(supplierID);
        $("#companyName").val(companyName);
        closeModal("supplierModal");
    }
</script>