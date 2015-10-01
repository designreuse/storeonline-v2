<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/main/include/headerContent.jsp" %>

<section class="content">
    <div class="row">

        <form:form commandName="unit"  id="mainForm"  action="" method="post" >
            <form:hidden path="unitID" id="mainId"></form:hidden>
        </form:form>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-3">

            <a href="javascript:$('#manageModal .modal-body').load('<c:url value="/main/unit/manage"/>',function(e){$('#manageModal').modal('show');});"
               class="btn btn-primary btn-block margin-bottom">เพิ่มข้อมูลหน่วยนับ
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
                        <label >Code</label>
                        <input id="input_criteria_0" class="form-control" placeholder="Enter Code" >
                    </div>
                    <div class="form-group">
                        <label >Name</label>
                        <input id="input_criteria_1" class="form-control" placeholder="Enter Name" >
                    </div>
                    <div class="form-group">
                        <label>Enable</label>
                        <select id="user_select_criteria_2" class="form-control" >
                            <option value="">Select</option>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
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
                            <table id="mainDataTable" class="table table-bordered table-hover dataTable" role="grid" >
                                <thead>
                                    <tr role="row">
                                        <th class="sorting" >unitCode</th>
                                        <th class="sorting" >unitName</th>
                                        <th class="sorting" >active</th>
                                        <th class="">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty unitList}">
                                    <c:forEach var="listObject" items="${unitList}">
                                        <tr role="row" class="odd">
                                            <td>${listObject.unitCode}</td>
                                            <td>${listObject.unitName}</td>
                                            <td>${listObject.active}</td>
                                            <td align="center">
                                                <button type="submit" class="btn btn-success btn-xs" data-toggle="tooltip" title="" data-original-title="add"
                                                        onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/unit/manage/?id=${listObject.unitID}&action=add"/>',function(e){$('#manageModal').modal('show');});" >
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                                <button type="submit" class="btn btn-warning btn-xs" data-toggle="tooltip" title="" data-original-title="edit"
                                                        onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/unit/manage/?id=${listObject.unitID}"/>',function(e){$('#manageModal').modal('show');});" >
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <button type="submit" class="btn btn-danger btn-xs"  data-toggle="tooltip" title="" data-original-title="delete" onclick="manageDelete(${listObject.unitID},'unit');"> <i class="fa fa-trash"></i></button>
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
                    <h4 class="modal-title">ข้อมูลหน่วยนับ</h4>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>

</section>

<%@include file="/main/include/headerJavascript.jsp" %>