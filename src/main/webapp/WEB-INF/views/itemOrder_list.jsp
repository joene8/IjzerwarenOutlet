<%-- 
    Document   : itemOrder_history
    Created on : Dec 8, 2014, 8:07:11 PM
    Author     : Erik
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:menu>
    <jsp:body>
        <t:title_and_message/>

        <script type="text/javascript">
            $(document).ready(function ()
            {
                $("#table").tablesorter();
            }
            );
        </script>

        <div class="panel panel-default">
            <div class="panel-body">
                <table  id="table" class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                Order ID <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Date <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Send/Pickup <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Destination Address <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Ready <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:choose>
                            <c:when test="${itemOrders.size() != 0}">
                                <c:forEach var="itemOrder" items="${itemOrders}">

                                    <tr>
                                        <td>${itemOrder.id}</td>
                                        <td>${itemOrder.date}</td>
                                        <c:choose>
                                            <c:when test="${itemOrder.delivery == true}">
                                                <td>Delivery</td>
                                                <td>${itemOrder.destination}</td>
                                            </c:when>
                                            <c:when test="${itemOrder.delivery == false}">
                                                <td>Pickup</td> 
                                                <td></td>
                                            </c:when> 
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${itemOrder.ready == true}">
                                                <td>Yes</td>
                                            </c:when>
                                            <c:when test="${itemOrder.ready == false}">
                                                <td>No</td> 
                                            </c:when> 
                                        </c:choose>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/itemOrder/view/${itemOrder.id}" class="btn btn-xs btn-default">View</a> 
                                        </td>
                                    </tr>

                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </tbody>

                    <tfoot>
                        <tr>
                            <td>${itemOrders.size()}</td>
                            <td colspan="5"></td>
                        </tr>
                    </tfoot>
                </table> 
            </div>
        </div>
        <t:footer/>
    </jsp:body>
</t:menu>
