<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section class="content-header">
    <h1><i class="fa <c:out value="${menuHeader.images}" /> "></i> <c:out value="${menuHeader.name}" /> <small><c:out value="${menuHeader.description}" /></small></h1>
</section>

<section class="content">
    <div class="row">

        <form:form commandName="user"  id="userManageForm"  action="" method="post" >
              <form:hidden path="id" id="userId"></form:hidden>
        </form:form>

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- --------------------------------------- Search Data   -------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-3">

            <a href="javascript:$('#modalUserManage .modal-body').load('<c:url value="/main/userManagement/createUserPage"/>',function(e){$('#modalUserManage').modal('show');});"
               class="btn btn-primary btn-block margin-bottom">เพิ่มข้อมูลผู้ใช้งาน
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
                        <label >Username</label>
                        <input id="user_input_criteria_0" class="form-control" placeholder="Enter Username" >
                    </div>
                    <div class="form-group">
                        <label >Name</label>
                        <input id="user_input_criteria_1" class="form-control"  placeholder="Enter Name">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input id="user_input_criteria_2" class="form-control" placeholder="Enter Email"  >
                    </div>
                    <div class="form-group">
                        <label>Role</label>
                        <select id="user_select_criteria_3" class="form-control" >
                            <option value="">Select</option>
                            <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                            <option value="ROLE_USER">ROLE_USER</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Enable</label>
                        <select id="user_select_criteria_4" class="form-control" >
                            <option value="">Select</option>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /. box -->
        </div><!-- /.col -->

        <%-- -------------------------------------------------------------------------------------------------------- --%>
        <%-- ------------------------------------ Grid DataList ----------------------------------------------------- --%>
        <%-- -------------------------------------------------------------------------------------------------------- --%>

        <div class="col-md-9">
            <div class="box box-primary">
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
                            <table id="userDatatable" class="table table-bordered table-hover dataTable" role="grid" >
                                <thead>
                                <tr role="row">
                                    <th class="sorting" >Username</th>
                                    <th class="sorting" >Name</th>
                                    <th class="sorting" >Email</th>
                                    <th class="sorting" >Role</th>
                                    <th class="sorting" >Enable</th>
                                    <th class="">Action</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:if test="${not empty userList}">
                                    <c:forEach var="userListObject" items="${userList}">
                                        <tr role="row" class="odd">
                                            <td>${userListObject.username}</td>
                                            <td>${userListObject.name}</td>
                                            <td>${userListObject.email}</td>
                                            <td>${userListObject.role}</td>
                                            <td>${userListObject.enabled}</td>
                                            <td align="center">
                                                <button type="submit" class="btn btn-warning btn-xs" data-toggle="tooltip" title="" data-original-title="edit"
                                                        onclick="javascript:$('#modalUserManage .modal-body').load('<c:url value="/main/userManagement/updateUserPage/?id=${userListObject.id}"/>',function(e){$('#modalUserManage').modal('show');});" >
                                                        <i class="fa fa-edit"></i></button>
                                                <button type="submit" class="btn btn-danger btn-xs"  data-toggle="tooltip" title="" data-original-title="delete" onclick="deleteUser(${userListObject.id});"> <i class="fa fa-trash"></i></button>
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
    <div class="modal fade" id="modalUserManage" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header ">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">ข้อมูลผู้ใช้งาน</h4>
                </div>
                    <div class="modal-body">
                    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

</section>

<!-- page script -->
<script type="text/javascript">
    // **  add for bug ajax reload ** //
    $(document).ready(function() {
        $("[data-widget='collapse']").click(function() {
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
            $('#userDatatable').dataTable({
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


        $('[id^="user_input_criteria_"]').on( 'keyup', function () {
            var colId = this.id.split("_").pop();
            searchDatatableByInput('userDatatable',colId,this.value);
        } );

        $('[id^="user_select_criteria_"]').on( 'change', function () {
            var colId = this.id.split("_").pop();
            searchDatatableByInput('userDatatable',colId,this.value);
        } );
    } );

    function searchDatatableByInput(datatable,colId,value){
        var table = $('#'+datatable+'').DataTable();
        table
                .columns( colId )
                .search( value )
                .draw();
    }

   /*    $('body').on('hidden.bs.modal', '.modal', function () {
         $(this).removeData('bs.modal');
         $(this).find('form')[0].reset();
     });*/

   /* $(document).ready(function() {
        $('#modalUserManage').on('hidden.bs.modal', function() {
            alert("testestes");
          $('#defaultForm').formValidation('resetForm', true);
        });
    });*/

    function deleteUser(userId){
        bootbox.dialog({
            size:"small",
            message: "คุณต้องการลบข้อมูลนี้หรือไหม",
            title: "โปรดยืนยัน",
            buttons: {
                save: {
                    label: "ยืนยัน",
                    className: "btn-primary",
                    callback: function() {
                        $("#userId").val(userId);
                        $("#userManageForm").attr('action','userManagement/deleteUser');
                        subitUserManageForm();
                    }
                },
                cancel: {
                    label: 'ยกเลิก',
                    className: 'btn-default'
                }
            }
        });
    }

    function subitUserManageForm(){
        var frm = $('#userManageForm');
        var data = {};
        $.each($('#userManageForm').serializeArray(), function(i, v){
            data[v.name] = v.value;
            delete data["undefined"];
        });

        $.ajax({
            contentType : 'application/json; charset=utf-8',
            type: frm.attr('method'),
            url: frm.attr('action'),
            dataType : 'json',
            data : JSON.stringify(data),
            success : function(result){
                closeLoadingModal();
                showMessageAlert(result.icon,result.header,result.content,result.color);
                reloadPageOldAjax();
            },
            error : function(result){
                closeLoadingModal();
                showMessageAlert("fa-warning","แจ้งเตือน","เกิดข้อผิดพลาดกรุณาแจ้งผู้ดูแลระบบ","alert-danger");
            }
        });
    }

</script>



