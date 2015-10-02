<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/main/include/headerContent.jsp" %>


<section class="content">
    <div class="row">

        <form:form commandName="user"  id="mainForm"  action="" method="post" >
              <form:hidden path="id" id="mainId"></form:hidden>
        </form:form>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-3">

            <a href="javascript:$('#manageModal .modal-body').load('<c:url value="/main/user/manage"/>',function(e){$('#manageModal').modal('show');});"
               class="btn btn-primary btn-block margin-bottom">เพิ่มข้อมูลผู้ใช้งาน
            </a>

            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">ค้นหา</h3>
                    <div class="box-tools">
                        <button class="btn btn-box-tool" onclick="collapseManager(this);"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class="box-body" style="display: block;">
                    <div class="form-group">
                        <label ><spring:message code="user.username"/></label>
                        <input id="input_criteria_0" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label ><spring:message code="user.name"/></label>
                        <input id="input_criteria_1" class="form-control"  />
                    </div>
                    <div class="form-group">
                        <label><spring:message code="user.email"/></label>
                        <input id="input_criteria_2" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label><spring:message code="user.role"/></label>
                        <select id="select_criteria_3" class="form-control" >
                            <option value=""><spring:message code="search.select"/></option>
                            <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                            <option value="ROLE_USER">ROLE_USER</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><spring:message code="user.enabled"/></label>
                        <select id="select_criteria_4" class="form-control" >
                            <option value=""><spring:message code="search.select"/></option>
                            <option value="yes"><spring:message code="search.status.active"/> </option>
                            <option value="no"><spring:message code="search.status.inactive"/> </option>
                        </select>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /. box -->
        </div><!-- /.col -->

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-9">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">ผลการค้นหา</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" onclick="collapseManager(this);"><i class="fa fa-minus"></i></button>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body">

                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div>
                        <div class="row"><div class="col-sm-12">
                            <table id="userMainDatatable" class="table table-bordered table-hover dataTable" role="grid" >
                                <thead>
                                <tr role="row">
                                    <th class="sorting" ><spring:message code="user.username"/></th>
                                    <th class="sorting" ><spring:message code="user.name"/></th>
                                    <th class="sorting" ><spring:message code="user.email"/></th>
                                    <th class="sorting" ><spring:message code="user.role"/></th>
                                    <th class="sorting" ><spring:message code="user.enabled"/></th>
                                    <th class="">Action</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:if test="${not empty userList}">
                                    <c:forEach var="listObject" items="${userList}">
                                        <tr role="row" class="odd">
                                            <td>${listObject.username}</td>
                                            <td>${listObject.name}</td>
                                            <td>${listObject.email}</td>
                                            <td>${listObject.role}</td>
                                            <td>${listObject.enabled}</td>
                                            <td align="center">
                                                <button type="submit" class="btn btn-success btn-xs" data-toggle="tooltip" title="" data-original-title="add"
                                                        onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/user/manage/?id=${listObject.id}&action=add"/>',function(e){$('#manageModal').modal('show');});" >
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                                <button type="submit" class="btn btn-warning btn-xs" data-toggle="tooltip" title="" data-original-title="edit"
                                                        onclick="javascript:$('#manageModal .modal-body').load('<c:url value="/main/user/manage/?id=${listObject.id}"/>',function(e){$('#manageModal').modal('show');});" >
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <button type="submit" class="btn btn-danger btn-xs"  data-toggle="tooltip" title="" data-original-title="delete" onclick="manageDelete(${listObject.id},'user');"> <i class="fa fa-trash"></i></button>
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

                </div><!-- /.box-body -->
            </div>
        </div><!-- /.col -->
    </div><!-- /.row -->

    <%-- -------------------------------------------------------------------------------------------------------- --%>
    <%-- --------------------------------------- Modal Dialog   ------------------------------------------------- --%>
    <%-- -------------------------------------------------------------------------------------------------------- --%>

    <%-- ----------------------------------------- Modal Add User------------------------------------------------ --%>
    <div class="modal fade" id="manageModal" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header ">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">เพิ่มข้อมูลผู้ใช้งาน</h4>
                </div>
                    <div class="modal-body">
                    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

</section>

<%-- -------------------------------------------------------------------------------------------------------- --%>
<%-- ---------------------------------------   JAVASCRIPT   ------------------------------------------------- --%>
<%-- -------------------------------------------------------------------------------------------------------- --%>

<script src="<c:url value='/main/js/editBug.js'/>"></script>

<script src="<c:url value='/main/js/datatable.js'/>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        var datatableID = "userMainDatatable";

        $(function () {
            setDatatable(datatableID);
        });

        $('[id^="input_criteria_"]').on( 'keyup', function () {
            var colId = this.id.split("_").pop();
            searchDatatableByInput(datatableID,colId,this.value);
        } );

        $('[id^="select_criteria_"]').on( 'change', function () {
            var colId = this.id.split("_").pop();
            searchDatatableByInput(datatableID,colId,this.value);
        } );
    } );
</script>



