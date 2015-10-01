<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/main/include/headerContent.jsp" %>

<section class="content">
    <div class="row">

        <form:form commandName="supplier"  id="mainForm"  action="" method="post" >
            <form:hidden path="supplierID" id="mainId"></form:hidden>
        </form:form>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-3">

            <a href="javascript:$('#manageModal .modal-body').load('<c:url value="/main/supplier/manage"/>',function(e){$('#manageModal').modal('show');});"
               class="btn btn-primary btn-block margin-bottom">เพิ่มข้อมูลผู้ผลิต
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
                        <label >companyName</label>
                        <input id="input_criteria_0" class="form-control" placeholder="Enter companyName" >
                    </div>
                    <div class="form-group">
                        <label >contractName</label>
                        <input id="input_criteria_1" class="form-control" placeholder="Enter contractName" >
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
                            <table id="mainDataTable" class="table table-bordered table-hover dataTable" role="grid" >
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" >ชื่อผู้ผลิต</th>
                                        <th class="sorting" >ที่อยู่</th>
                                        <%--<th class="sorting" >ชื่อผู้ติดต่อ</th>--%>
                                        <%--<th class="sorting" >เบอร์ออฟฟิศ</th>--%>
                                        <%--<th class="sorting" >เบอร์มือถือ</th>--%>
                                        <%--<th class="sorting" >email</th>--%>
                                        <th class="">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty supplierList}">
                                    <c:forEach var="listObject" items="${supplierList}">
                                        <tr role="row" class="odd">
                                            <td>${listObject.companyName}</td>
                                            <td>${listObject.address}</td>
                                            <%--<td>${listObject.contractName}</td>--%>
                                            <%--<td>${listObject.phoneOffice}</td>--%>
                                            <%--<td>${listObject.phomeMobile}</td>--%>
                                            <%--<td>${listObject.email}</td>--%>
                                            <td align="center">
                                                <button type="submit" class="btn btn-success btn-xs" data-toggle="tooltip" title="" data-original-title="add"
                                                        onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/supplier/manage/?id=${listObject.supplierID}&action=add"/>',function(e){$('#manageModal').modal('show');});" >
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                                <button type="submit" class="btn btn-warning btn-xs" data-toggle="tooltip" title="" data-original-title="edit"
                                                        onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/supplier/manage/?id=${listObject.supplierID}"/>',function(e){$('#manageModal').modal('show');});" >
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <button type="submit" class="btn btn-danger btn-xs"  data-toggle="tooltip" title="" data-original-title="delete" onclick="manageDelete(${listObject.supplierID},'supplier');"> <i class="fa fa-trash"></i></button>
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
    <div class="modal fade" id="manageModal" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header ">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">ข้อมูลผู้ผลิต</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>

</section>

<%@include file="/main/include/headerJavascript.jsp" %>