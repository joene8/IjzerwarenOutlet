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
            <script type="text/javascript">
                $(document).ready(function ()
                {
                    $("#table").tablesorter();
                }
                );
            </script>

            <table id="table" class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>
                            First name <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Last Name <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Email <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                         Phone Number <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                          Permission Level <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
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
                                    <select class="form-control" id="permissionLevel${user.id}" onchange="updatePermissionLevel(${user.id})">
                                        <option value="1" <c:if test="${user.permissionLevel==1}">selected</c:if>>1. User</option>
                                        <option value="2" <c:if test="${user.permissionLevel==2}">selected</c:if>>2. Employee</option>
                                        <option value="3" <c:if test="${user.permissionLevel==3}">selected</c:if>>3. Manager</option>
                                        <option value="4" <c:if test="${user.permissionLevel==4}">selected</c:if>>4. Admin</option>
                                        </select>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/user/view/${user.id}" class="btn btn-xs btn-default">View</a>
                                    <a href="${pageContext.request.contextPath}/user/edit/${user.id}" class="btn btn-xs btn-default">Edit</a>
                                    <a href="${pageContext.request.contextPath}/user/delete/${user.id}" class="btn btn-xs btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>

                    </c:when>
                </c:choose>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="5"><a href="${pageContext.request.contextPath}/user/add" class="btn btn-sm btn-danger">Add user</a></td>
                    <td><em>Total users: ${users.size()}</em></td>       
                </tr>
            </tfoot>
        </table>

        <t:footer/>
    </jsp:body>
</t:menu>
