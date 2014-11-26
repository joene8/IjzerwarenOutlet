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
                        <strong>Description</strong>
                    </td>
                    <td>
                    </td>
                </tr>
            <c:choose>
                <c:when test="${products.size() != 0}">
                    <!-- When there are users, the will be shown below -->

                    <c:forEach var="product" items="${products}">
                        <!-- Per product a row will be made with it's values -->
                        <tr>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td><a href="${pageContext.request.contextPath}/product/edit/${product.id}">Edit</a> |
                              <a href="${pageContext.request.contextPath}/product/delete/${product.id}">Delete</a>
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
