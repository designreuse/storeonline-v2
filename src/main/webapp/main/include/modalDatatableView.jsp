<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--<script src="<c:url value='/main/js/editBug.js'/>"></script>--%>

<!-- page script -->
<script type="text/javascript">

    $(document).ready(function() {
        $(".modal-view-collapse").click(function() {
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
            $('#mainDataTableView').dataTable({
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
            searchDatatableByInput('mainDataTable',colId,this.value);
        } );

        $('[id^="select_criteria_"]').on( 'change', function () {
            var colId = this.id.split("_").pop();
            searchDatatableByInput('mainDataTable',colId,this.value);
        } );
    } );

    function searchDatatableByInput(datatable,colId,value){
        var table = $('#'+datatable+'').DataTable();
        table
                .columns( colId )
                .search( value )
                .draw();
    }



</script>