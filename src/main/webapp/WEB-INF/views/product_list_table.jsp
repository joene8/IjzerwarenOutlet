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
                     Description <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                    </th>
                    <th>
                    </th>
                </tr>
                </thead>
                <tbody>
            <c:choose>
                <c:when test="${products.size() != 0}">
                    <!-- When there are users, the will be shown below -->

                    <c:forEach var="product" items="${products}">
                        <!-- Per product a row will be made with it's values -->
                        <tr>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td>                                        <a href="${pageContext.request.contextPath}/product/view/${product.id}" class="btn btn-xs btn-default">View</a>
                                    <a href="${pageContext.request.contextPath}/product/edit/${product.id}" class="btn btn-xs btn-default">Edit</a>
                                    <a href="${pageContext.request.contextPath}/product/delete/${product.id}" class="btn btn-xs btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>

                </c:when>
            </c:choose>
                </tbody>
                        <tfoot>
            <tr>
                <td colspan="2"><a href="${pageContext.request.contextPath}/product/add" class="btn btn-sm btn-danger">Add product</a></td>
                <td><em>Total products: ${products.size()}</em></td>       
            </tr>
            </tfoot>
        </table>
            <a href="${pageContext.request.contextPath}/product/list" class="btn btn-xs-primary">Thumbnail View</a>
                            <!--Javascript menu activator-->
        <script>activeMenu("products");</script>
        <t:footer/>
    </jsp:body>
</t:menu>
