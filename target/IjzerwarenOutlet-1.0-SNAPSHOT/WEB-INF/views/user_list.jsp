<script>
    function updatePermissionLevel(id) {
        window.location.assign("${pageContext.request.contextPath}/user/update_permission_level/" + id + "/" + document.getElementById("permissionLevel" + id).value + "");
    }
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
            <table class="table table-striped">
                <tr>
                    <td>
                        <strong>First name</strong>
                    </td>
                    <td>
                        <strong>Last name</strong>
                    </td>
                    <td>
                        <strong>Email</strong>
                    </td>
                    <td>
                        <strong>Phone nmber</strong>
                    </td>
                    <td>
                        <strong>Permission level</strong>
                    </td>

                </tr>
            <c:choose>
                <c:when test="${users.size() != 0}">
                    <!-- for each user a new row is added-->
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.email}</td>
                            <td>${user.phoneNumber}</td>
                            <td>
                                <select class="form-control" id="permissionLevel${user.id}" onchange="updatePermissionLevel(1)">
                                    <option value="1" <c:if test="${user.permissionLevel==1}">selected</c:if>>1. User</option>
                                    <option value="2" <c:if test="${user.permissionLevel==2}">selected</c:if>>2. Employee</option>
                                    <option value="3" <c:if test="${user.permissionLevel==3}">selected</c:if>>3. Manager</option>
                                    <option value="4" <c:if test="${user.permissionLevel==4}">selected</c:if>>4. Admin</option>
                                    </select>
                                </td>
                            </tr>
                    </c:forEach>

                </c:when>
            </c:choose>
            <tr>
                <td colspan="5"><strong>Total users: ${users.size()}</strong></td>
            </tr>
        </table>
        <t:footer/>
    </jsp:body>
</t:menu>
