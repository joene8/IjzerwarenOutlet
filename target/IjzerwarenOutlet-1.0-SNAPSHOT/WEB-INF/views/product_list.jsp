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
                        <strong>Id</strong>
                    </td>
                    <td>
                        <strong>Name</strong>
                    </td>
                    <td>
                        <strong>Price</strong>
                    </td>
                    <td>
                        <strong>Location</strong>
                    </td>
                    <td>
                        <strong>Weight</strong>
                    </td>
                    <td>
                        <strong>Description</strong>
                    </td>
                    <td>
                    </td>


                </tr>
            <c:choose>
                <c:when test="${products.size() != 0}">
                    <!-- Wanneer er gebruikers opgeslagen zijn, worden ze hier getoond -->

                    <c:forEach var="product" items="${products}">
                        <!-- Per gebruiker wordt nu een rij aangemaakt met daarin zijn gegevens -->
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.location}</td>
                            <td>${product.weight}</td>
                            <td>${product.description}</td>

                            <td><a href="${pageContext.request.contextPath}/product/edit/${product.id}">Edit</a> |
                                <a href="${pageContext.request.contextPath}/product/remove/${product.id}">Remove</a>
                            </td>
                        </tr>
                    </c:forEach>

                </c:when>
            </c:choose>
            <tr>
                <td colspan="7"><strong>Total products: ${products.size()}</stong></td>
            </tr>
        </table>
        <p>
            <a href="${pageContext.request.contextPath}/product/add">Add a new product</a>
        </p>
        <t:footer/>
    </jsp:body>
</t:menu>
