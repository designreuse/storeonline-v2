<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="user"  id="manageForm" role="form" class="form-horizontal" action="user/save" method="post" >
    <form:hidden path="id" ></form:hidden>
    <div class="form-group">
        <label for="username" class="control-label col-md-3"><spring:message code="user.username"/>:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="username" id="username"  ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="control-label col-md-3"><spring:message code="user.password"/>:</label>
        <div class="col-md-9">
            <form:input type="password" class="form-control" path="password"  id="password" ></form:input>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="control-label col-md-3"><spring:message code="user.name"/>:</label>
        <div class="col-md-9">
            <form:input type="text" class="form-control" path="name"  id="name"  ></form:input>
        </div>
    </div>
  <%-- <div class="form-group">
        <label for="confirmPassword" class="control-label col-md-3">Password Confirm:</label>
        <div class="col-md-9">
            <input type="password" class="form-control" name="confirmPassword"  id="confirmPassword"  placeholder="Enter Password Confirm" />
        </div>
    </div>--%>
    <div class="form-group">
         <label for="email" class="control-label col-md-3"><spring:message code="user.email"/>:</label>
         <div class="col-md-9">
             <form:input type="email" class="form-control" path="email"  id="email" ></form:input>
         </div>
     </div>
     <div class="form-group">
         <label for="role" class="control-label col-md-3"><spring:message code="user.role"/>:</label>
         <div class="col-md-9">
             <form:select id="role" path="role" class="form-control" >
                 <form:option value=""><spring:message code="search.select"/></form:option>
                 <form:option value="ROLE_ADMIN">ROLE_ADMIN</form:option>
                 <form:option value="ROLE_USER">ROLE_USER</form:option>
             </form:select>
         </div>
     </div>
    <%-- <div class="form-group">
         <label  class="control-label col-md-3">Enable:</label>
         <div class="col-md-9">
             <div class="form-group">
                 <div class="radio">
                     <label>
                         <form:radiobutton  path="enabled" value="yes" /> Yes
                     </label>
                 </div>
                 <div class="radio">
                     <label>
                         <form:radiobutton path="enabled"  value="no" /> No
                     </label>
                 </div>
             </div>
         </div>
     </div>--%>
    <div class="form-group">
        <label for="enabled" class="control-label col-md-3"><spring:message code="user.enabled"/>:</label>
        <div class="col-md-9">
            <form:select id="enabled" path="enabled" class="form-control" >
                <form:option value=""><spring:message code="search.select"/></form:option>
                <form:option value="yes"><spring:message code="search.status.active"/></form:option>
                <form:option value="no"><spring:message code="search.status.inactive"/></form:option>
            </form:select>
        </div>
    </div>

    <div class="modal-footer modal-footer-modify">
        <button type="submit" class="btn btn-primary " id="submit"  >บันทึก</button>
        <c:set var="manageId" value="${user.id}" />
        <c:if test="${manageId gt 0}">
            <button type="button" class="btn btn-danger " onclick="manageDelete(${manageId},'user');" >ยกเลิก</button>
        </c:if>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">ยกเลิก</button>
    </div>

</form:form>

<script type="text/javascript">


    $(document).ready(function() {

        $('#manageForm').formValidation({
            message: 'This value is not valid',
            fields: {
                username: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.input.notEmpty"/>'
                        },
                        stringLength: {
                            max: 30,
                            message: '<spring:message code="form.validation.stringLength.30"/>'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '<spring:message code="form.validation.alphabetical"/>'
                        }
                    }
                },
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
                password: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.input.notEmpty"/>'
                        }
                    }
                },
               /* confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: 'The confirm password is required and can\'t be empty'
                        },
                        identical: {
                            field: 'password',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                },*/
                email: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.input.notEmpty"/>'
                        },
                        emailAddress: {
                            message: '<spring:message code="form.validation.email"/>'
                        }
                    }
                },
                role: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.input.notEmpty"/>'
                        }
                    }
                },
                enabled: {
                    validators: {
                        notEmpty: {
                            message: '<spring:message code="form.validation.input.notEmpty"/>'
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
                    contentType : 'application/json; charset=utf-8',
                    type: frm.attr('method'),
                    url: frm.attr('action'),
                    dataType : 'json',
                    data : JSON.stringify(data),
                    success : function(result){
                        closeLoadingModal();
                        showMessageAlert(result.icon,result.header,result.content,result.color);

                        if(result.color != "alert-info"){
                            closeModal("manageModal");
                            reloadPageOldAjax();
                        }
                    },
                    error : function(result){
                        closeLoadingModal();
                        showMessageAlert("fa-warning","<spring:message code="message.header.warning"/>","<spring:message code="message.save.error"/>","alert-danger");
                    }
                });

        });


    });
</script>