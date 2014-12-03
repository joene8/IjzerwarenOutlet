<%-- 
    Document   : genericPage
    Created on : Oct 13, 2014, 12:51:56 PM
    Author     : dervos
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@tag description="menu" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<div class="panel panel-gray" id="title">
  <div class="panel-heading">
    <span class="pageTitle">${pageTitle}</span>
  </div>
  <div class="panel-body">
      <span class="pageDescription">${pageDescription}</span>
            <!--Start alert-->
        <c:if test="${not empty message}">
            <div class="alert alert-${type} col-sm-4 alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                ${message}
            </div> 
        </c:if>
        <!--End alert-->
  </div>
</div>

                        