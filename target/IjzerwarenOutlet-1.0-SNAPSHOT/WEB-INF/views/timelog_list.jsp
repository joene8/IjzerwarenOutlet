<%--
Document : timelog_list
Created on : 01-Dec-2014, 23:07:51
Author : How Fei Zheng
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:menu>
    <jsp:body>
        <t:title_and_message/>
                        <div class="panel panel-default">
            <div class="panel-body">
        <table class="table table-striped">
            <tr>
                <td>
                    <strong>Id</strong>
                </td>
                <td>
                    <strong>Login</strong>
                </td>
                <td>
                    <strong>Logout</strong>
                </td>
                <td>
                    <strong>Duration</strong>
                </td>
                <td>
                    <strong>UserID</strong>
                </td> </tr>
            <c:choose>
                <c:when test="${timelogs.size() != 0}">
                    <!-- Wanneer er gebruikers opgeslagen zijn, worden ze hier getoond -->
                    <c:forEach var="timelog" items="${timelogs}">
                        <!-- Per gebruiker wordt nu een rij aangemaakt met daarin zijn gegevens -->
                        <tr>
                            <td>${timelog.id}</td>
                            <td>${timelog.login}</td>
                            <td>${timelog.logout}</td>
                            <td>${timelog.duration}</td>
                            <td>${timelog.userID}</td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            <tr>
                <td colspan="7"><strong>Total logs ${timelogs.size()}</stong></td>
            </tr>
        </table>
            </div>
                        </div>
                            <!--Javascript menu activator-->
        <script>activeMenu("timelogs");</script>
        <t:footer/>
    </jsp:body>
</t:menu>