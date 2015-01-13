<%-- 
    Document   : productList
    Created on : Nov 11, 2014, 12:25:25 PM
    Author     : jaron
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<% String s = (String) request.getAttribute("message"); %>
<% request.setAttribute("succes", s);%>


<t:menu>
    <jsp:body>
        <h1>${paginaTitel}</h1>
        <c:if test="${not empty succes}"><font color="green"><b>${succes}</b></font></c:if>

                <c:choose>
                    <c:when test="${cart != null}">
                <!-- Wanneer er gebruikers opgeslagen zijn, worden ze hier getoond -->

                
                <table class="table table-striped">
                    <tr>
                       
                        <td>
                            <strong>Name</strong>
                        </td>
                        <td>
                            <strong>Price P.P</strong>
                        </td>
                        <td>
                            <strong>Location</strong>
                        </td>
                        <td>
                            <strong>Total Price</strong>
                        </td>
                        
                    </tr>
                    <c:forEach var="item" items="${cart.getItemList()}">
                        <!-- Per gebruiker wordt nu een rij aangemaakt met daarin zijn gegevens -->
                        <tr>
                            
                            <td><a href="${pageContext.request.contextPath}/item/info/${item.id}">${item.product.name}</a></td>
                            <td>${item.chosenPrice}</td>
                            <td>${item.establishment.name}</td>
                            <td> 
                                <a href="${pageContext.request.contextPath}/itemOrder/add_step_1/${item.id}">Order</a>
                            </td>
                            
                            <td>
                                <a href="${pageContext.request.contextPath}/cart/remove/${item.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td colspan="3"> </td>
                            <td>${cart.getTotalPrice()}</td>
                        </tr>
                </table>
            </c:when>
            <c:otherwise>
                <!-- Als er geen gebruikers zijn, wordt deze melding getoond -->
                Your shopping cart is empty
            </c:otherwise>
        </c:choose>
        <p>
            <a href="${pageContext.request.contextPath}/index">Return to index</a>
        </p>

    </jsp:body>
</t:menu>

