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

        <div class="panel panel-default">
            <div class="panel-body">

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
                                OrderID <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Date <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Send/Pickup <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Adress <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${itemOrders.size() != 0}">
                                <c:forEach var="itemOrder" items="${itemOrders}">
                                    <c:if test="${itemOrder.user.id == currentUser.id}">
                                        <tr>
                                            <td>${itemOrder.id}</td>
                                            <td>${itemOrder.date}</td>
                                            <td>${itemOrder.delivery}</td>
                                            <td>${itemOrder.destination}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/itemOrder/view/${itemOrder.id}" class="btn btn-xs btn-default">View</a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5"><em>Total orders: ${itemOrders.size()}</em></td>       
                        </tr>
                    </tfoot>
                </table> 

            </div>
        </div>

        <t:footer/>
    </jsp:body>
</t:menu>
