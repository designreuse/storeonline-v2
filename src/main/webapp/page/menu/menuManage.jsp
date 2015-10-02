<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="menu"  id="manageForm" role="form" class="form-horizontal" action="menu/save" method="post" >
    <form:hidden path="id" ></form:hidden>

    <spring:message code="search.select" var="textSelect"/>

    <div class="form-group">
        <label for="name" class="control-label col-md-3"><spring:message code="menu.name"/>:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="name" id="name"   ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="description" class="control-label col-md-3"><spring:message code="menu.description"/>:</label>
        <div class="col-md-9">
            <form:textarea type="text" class="form-control" path="description" id="description"   ></form:textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="seq" class="control-label col-md-3"><spring:message code="menu.seq"/>:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="seq" id="seq"   ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="layerLevel" class="control-label col-md-3"><spring:message code="menu.layerLevel"/>:</label>
        <div class="col-md-9">
            <form:select id="layerLevel" path="layerLevel" class="form-control" >
                <form:option value="">${textSelect}</form:option>
                <form:option value="main">main</form:option>
                <form:option value="sub1">sub1</form:option>
                <form:option value="sub2">sub2</form:option>
            </form:select>
        </div>
    </div>
    <div class="form-group">
        <label for="parentId" class="control-label col-md-3"><spring:message code="menu.parentId"/>:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="parentId" id="parentId"   ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="action" class="control-label col-md-3"><spring:message code="menu.action"/>:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="action" id="action"   ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="images" class="control-label col-md-3"><spring:message code="menu.images"/>:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="images" id="images"   ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="active" class="control-label col-md-3"><spring:message code="menu.active"/>:</label>
        <div class="col-md-9">
            <form:select id="active" path="active" class="form-control" >
                <form:option value="">${textSelect}</form:option>
                <form:option value="yes">Yes</form:option>
                <form:option value="no">No</form:option>
            </form:select>
        </div>
    </div>
    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${menu.id}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'menu');" >ยกเลิก</button>
        </c:if>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">ยกเลิก</button>
    </div>
</form:form>



<script type="text/javascript">

    $(document).ready(function() {
        $('#manageForm').formValidation({
            message: 'This value is not valid',
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.input.notEmpty"/>'
                        },
                        stringLength: {
                            max: 100,
                            message: '<spring:message code="form.validation.stringLength.100"/>'
                        }
                    }
                },
                description: {
                    validators: {
                        stringLength: {
                            max: 200,
                            message: '<spring:message code="form.validation.stringLength.200"/>'
                        }
                    }
                },
                seq: {
                    validators: {
                        stringLength: {
                            max: 10,
                            message: '<spring:message code="form.validation.stringLength.10"/>'
                        }
                    }
                },
                layerLevel: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.select.notEmpty"/>'
                        }
                    }
                },
                parentId: {
                    validators: {
                        stringLength: {
                            max: 10,
                            message: '<spring:message code="form.validation.stringLength.10"/>'
                        }
                    }
                },
                action: {
                    validators: {
                        stringLength: {
                            max: 100,
                            message: '<spring:message code="form.validation.stringLength.100"/>'
                        }
                    }
                },
                images: {
                    validators: {
                        stringLength: {
                            max: 100,
                            message: '<spring:message code="form.validation.stringLength.100"/>'
                        }
                    }
                },
                active: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.select.notEmpty"/>'
                        }
                    }
                }
            }
        }) .on('success.form.fv', function(e) {
                var frm = $('#manageForm');
                e.preventDefault();

                var data = {};

                //Gather Data also remove undefined keys(buttons)
                $.each(this, function(i, v){
                    var input = $(v);
                    data[input.attr("name")] = input.val();
                    delete data["undefined"];
                });
                $.ajax({
                    contentType: 'application/json; charset=utf-8',
                    type: frm.attr('method'),
                    url: frm.attr('action'),
                    dataType: 'json',
                    data: JSON.stringify(data),
                    success: function(result){
                        closeLoadingModal();
                        showMessageAlert(result.icon,result.header,result.content,result.color);

                        closeModal("menuManageModal");
                        /*reloadPageOldAjax();*/

                    },
                    error: function(result){
                        closeLoadingModal();
                        showMessageAlert("fa-warning","<spring:message code="message.header.warning"/>","<spring:message code="message.save.error"/>","alert-danger");
                    }
                });

        });
    });

</script>