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
                        <strong>Name</strong>
                    </td>
                    <td>
                        <strong>Address</strong>
                    </td>
                    <td>
                        <strong>Postal code</strong>
                    </td>
                    <td>
                        <strong>City</strong>
                    </td>
                    <td>
                        <strong>Phone number</strong>
                    </td>
                    <td></td>
                </tr>
            <c:choose>
                <c:when test="${establishments.size() != 0}">
                    <!-- When there are establishment, the will be shown below -->

                    <c:forEach var="establishment" items="${establishments}">
                        <!-- Per establishment a row will be made with it's values -->
                        <tr>
                            <td><a href="${pageContext.request.contextPath}/establishment/view/${establishment.id}">${establishment.name}</a></td>
                            <td>${establishment.streetName} ${establishment.streetNumber} ${establishment.streetNumberSuffix}</td>
                            <td>${establishment.postalCode}</td>
                            <td>${establishment.city}</td>
                            <td>${establishment.phoneNumber}</td>
                              <td>
                                    <a href="${pageContext.request.contextPath}/establishment/view/${establishment.id}" class="btn btn-default">View</a>
                                <a href="${pageContext.request.contextPath}/establishment/edit/${establishment.id}" class="btn btn-primary">Edit</a>
                                <a href="${pageContext.request.contextPath}/establishment/delete/${establishment.id}" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>

                </c:when>
            </c:choose>
            <tr>
                <td colspan="5"><a href="${pageContext.request.contextPath}/establishment/add" class="btn btn-primary">Add establishment</a></td>
                <td><em>Total establishments: ${establishments.size()}</em></td>       
            </tr>
        </table>
        <t:footer/>
    </jsp:body>
</t:menu>
