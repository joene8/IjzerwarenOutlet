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
                </tr>
            <c:choose>
                <c:when test="${establishments.size() != 0}">
                    <!-- When there are establishment, the will be shown below -->

                    <c:forEach var="establishment" items="${establishments}">
                        <!-- Per product a row will be made with it's values -->
                        <tr>
                            <td>${establishment.name}</td>
                            <td>${establishment.streetName} ${establishment.streetNumber} ${establishment.streetNumberSuffix}</td>
                            <td>${establishment.postalCode}</td>
                            <td>${establishment.city}</td>
                            <td>${establishment.phoneNumber}</td>
                        </tr>
                    </c:forEach>

                </c:when>
            </c:choose>
            <tr>
                <td colspan="7"><strong>Total establishments: ${establishments.size()}</stong></td>
            </tr>
        </table>
        <t:footer/>
    </jsp:body>
</t:menu>
