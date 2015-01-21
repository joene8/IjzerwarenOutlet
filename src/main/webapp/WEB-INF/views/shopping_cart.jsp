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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String s = (String) request.getAttribute("message"); %>
<% request.setAttribute("succes", s);%>


<t:menu>
    <jsp:body>
        <t:title_and_message />
        <c:if test="${not empty succes}"><font color="green"><b>${succes}</b></font></c:if>
            
                <c:choose>
                    <c:when test="${getCartAmount != 0}">
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
                            <strong>Remove</strong>
                        </td>
                        
                    </tr>
                    <c:forEach var="item" items="${cart.getItemList()}">
                        <!-- Per gebruiker wordt nu een rij aangemaakt met daarin zijn gegevens -->
                        <tr>
                            
                            <td><a>${item.product.name}</a></td>
                            <td><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${item.getActualPrice()}" /></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/cart/remove/${item.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td><strong>Total Price</strong></td>
                            <td><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${cart.getTotalPrice()}" /></td>
                            <td><a href="${pageContext.request.contextPath}/itemOrder/add_step_1">Place order</a></td>
                        </tr>
                </table>
            </c:when>
            <c:otherwise>
                <!-- Als er geen gebruikers zijn, wordt deze melding getoond -->
<table class="table table-striped">
                    <tr>
                       
                        <td>
                            <strong>Name</strong>
                        </td>
                        <td>
                            <strong>Price P.P</strong>
                        </td>
                        <td>
                            <strong>Remove</strong>
                        </td>
                        
                    </tr>
                    <c:forEach var="item" items="${cart.getItemList()}">
                        <!-- Per gebruiker wordt nu een rij aangemaakt met daarin zijn gegevens -->
                        <tr>
                            
                            <td><a>${item.product.name}</a></td>
                            <td><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${item.getActualPrice()}" /></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/cart/remove/${item.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td><strong>Total Price</strong></td>
                            <td><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${cart.getTotalPrice()}" /></td>
                            <td colspan="1" />
                        </tr>
                </table>
            </c:otherwise>
        </c:choose>

    </jsp:body>
</t:menu>

