/**
 * Created by YeamGood on 8/18/2015 AD.
 */
function setDatatable(id){
    $('#'+id).dataTable({
        "sAjaxSource" :"/main/user/datatable",
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
        },
        "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
        "order": [[ 1, 'asc' ]]
    });

    var datatableShow = $('#'+id+'').DataTable();
    datatableShow.on( 'order.dt search.dt', function () {
        datatableShow.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
}

function searchDatatableByInput(datatable,colId,value){
    var table = $('#'+datatable+'').DataTable();
    table
        .columns( colId )
        .search( value )
        .draw();
}

