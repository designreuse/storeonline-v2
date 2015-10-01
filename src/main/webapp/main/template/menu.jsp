<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
  var urlTemp;
  var menuIdTem;

  function reloadPageAjax(actionUrl,menuId) {
      if(actionUrl != "#"){
          urlTemp = actionUrl;
          menuIdTem = menuId;
          // get the form values
            //    var name = $('#name').val();
            //    var education = $('#education').val();

          openLoadingModal();
          $.ajax({
              type: "POST",
              url: actionUrl,
              data: "menuId="+menuId,
              success: function (response) {
                  closeLoadingModal();
                  $("#content-main").html(response);
              },
              error: function (e) {
                  closeLoadingModal();
                  alert('Error : ' + e);
              }
          });
      }
  }

  function reloadPageOldAjax(){
      reloadPageAjax(urlTemp,menuIdTem);
  }

  function reloadPageByActiotOldAjax(urlAction){
      reloadPageAjax(urlAction,menuIdTem);
  }

  function reloadPageAjaxTab(actionUrl,menuId,icon,tabName) {
      if(actionUrl != "#"){
          urlTemp = actionUrl;
          menuIdTem = menuId;
          // get the form values
          //    var name = $('#name').val();
          //    var education = $('#education').val();
          openLoadingModal();
          $.ajax({
              type: "POST",
              url: actionUrl,
              data: "menuId="+menuId,
              success: function (response) {
                  closeLoadingModal();
                 // $("#content-main").html(response);
                  addTabMain(icon,tabName,response);
              },
              error: function (e) {
                  closeLoadingModal();
                  alert('Error : ' + e);
              }
          });
      }
  }
</script>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">

    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">

      <c:if test="${not empty menuList}">

          <c:forEach var="listValue" items="${menuList}">
            <li class="header">${listValue.menu.name}</li>

            <c:if test="${not empty listValue.menuList}">
              <c:forEach var="listSub1Value" items="${listValue.menuList}">
                <li class="treeview">
                  <%--<a href="${listSub1Value.menu.action}">--%>
                   <%-- <a href="#" onclick="reloadPageAjaxTab('<c:url value='${listSub1Value.menu.action}'/>','${listSub1Value.menu.id}','${listSub1Value.menu.images}','${listSub1Value.menu.name}');">--%>
                    <a href="#" onclick="reloadPageAjax('<c:url value='${listSub1Value.menu.action}'/>','${listSub1Value.menu.id}');">
                    <i class="fa ${listSub1Value.menu.images}"></i>
                    <span>${listSub1Value.menu.name}</span>

                    <c:if test="${not empty listSub1Value.menuList}">
                      <i class="fa fa-angle-left pull-right"></i>
                    </c:if>
                  </a>

                  <c:if test="${not empty listSub1Value.menuList}">
                    <ul class="treeview-menu">
                        <c:forEach var="listSub2Value" items="${listSub1Value.menuList}">
                          <li>
                             <a href="#" onclick="reloadPageAjax('<c:url value='${listSub2Value.menu.action}'/>','${listSub2Value.menu.id}');">
                           <%--  <a href="#" onclick="reloadPageAjaxTab('<c:url value='${listSub2Value.menu.action}'/>','${listSub2Value.menu.id}','${listSub2Value.menu.images}','${listSub2Value.menu.name}');">--%>
                             <i class="fa ${listSub2Value.menu.images}"></i> ${listSub2Value.menu.name}
                            </a>
                          </li>
                        </c:forEach>
                    </ul>
                  </c:if>

                </li>
              </c:forEach>
            </c:if>

          </c:forEach>
      </c:if>

    </ul>
  </section>
  <!-- /.sidebar -->
</aside>

