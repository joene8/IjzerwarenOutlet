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
                            Name <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Address <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Postal code <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            City <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Phone number <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
            <c:choose>
                <c:when test="${establishments.size() != 0}">
                    <!-- When there are establishment, the will be shown below -->

                    <c:forEach var="establishment" items="${establishments}">
                        <!-- Per establishment a row will be made with it's values -->
                        <tr>
                            <td>${establishment.name}</td>
                            <td>${establishment.streetName} ${establishment.streetNumber} ${establishment.streetNumberSuffix}</td>
                            <td>${establishment.postalCode}</td>
                            <td>${establishment.city}</td>
                            <td>${establishment.phoneNumber}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/establishment/view/${establishment.id}" class="btn btn-xs btn-default">View</a>
                                <a href="${pageContext.request.contextPath}/establishment/edit/${establishment.id}" class="btn btn-xs btn-default">Edit</a>
                                <a href="${pageContext.request.contextPath}/establishment/delete/${establishment.id}" class="btn btn-xs btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>

                </c:when>
            </c:choose>
            </tbody>
                        <tfoot>
            <tr>
                <td colspan="5"><a href="${pageContext.request.contextPath}/establishment/add" class="btn btn-sm btn-danger">Add establishment</a></td>
                <td><em>Total establishments: ${establishments.size()}</em></td>       
            </tr>
            </tfoot>
        </table>
        <t:footer/>
    </jsp:body>
</t:menu>
