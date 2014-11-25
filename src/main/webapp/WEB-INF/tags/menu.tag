<%-- 
    Document   : Menu.tag
    Created on : Oct 13, 2014, 12:51:56 PM
    Author     : Deva
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:choose>
    <c:when test="${currentUser == null}"><t:menu_guest/></c:when>
    <c:when test="${currentUser.permissionLevel == 1}"><t:menu_customer/></c:when>
    <c:when test="${currentUser.permissionLevel == 2}"><t:menu_employee/></c:when>
    <c:when test="${currentUser.permissionLevel == 3}"><t:menu_manager/></c:when>
    <c:when test="${currentUser.permissionLevel == 4}"><t:menu_admin/></c:when>
</c:choose>
<div id="body">
    <div class="container">
        <jsp:doBody/>
    </div>
</div>