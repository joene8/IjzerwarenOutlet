<%-- 
    Document   : productList
    Created on : Nov 11, 2014, 12:25:25 PM
    Author     : jaron
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<% String s = (String) request.getAttribute("message"); %>
<% request.setAttribute("succes", s);%>


<t:menu>
    <jsp:body>
        <h1>${paginaTitel}</h1>
        <c:if test="${not empty succes}"><font color="green"><b>${succes}</b></font></c:if>

                <c:choose>
                    <c:when test="${products.size() != 0}">
                <!-- Wanneer er gebruikers opgeslagen zijn, worden ze hier getoond -->

                <table class="table table-striped">
                    <tr>
                       
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
                            <strong>Cart</strong>
                        </td>
                    </tr>
                    
                        <!-- Per gebruiker wordt nu een rij aangemaakt met daarin zijn gegevens -->
                        <tr>
                           <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.location}</td>
                            <td>${product.weight}</td>
                            <td>${product.description}</td>
                            
                            <td>
                                <a href="${pageContext.request.contextPath}/cart/add/${product.id}">Add To Cart</a>
                            </td>
                        </tr>
                    
                </table>
            </c:when>
            <c:otherwise>
                <!-- Als er geen gebruikers zijn, wordt deze melding getoond -->
                Er zijn geen producten gevonden.
            </c:otherwise>
        </c:choose>
        <p>
            <a href="${pageContext.request.contextPath}/product/list">Back to list</a>
        </p>

    </jsp:body>
</t:menu>

