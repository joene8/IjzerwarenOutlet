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
                            LWH (mm) <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Standard saleprice <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Chosen price <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                            Stock <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                        </th>
                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${items.size() != 0}">
                        <!-- When there are users, the will be shown below -->

                        <c:forEach var="item" items="${items}">
                            <!-- Per product a row will be made with it's values -->
                            <tr>
                                <td>${item.product.name}</td>
                                <td>${item.product.productLength}x${item.product.netWidth}x${item.product.netThickness}</td>
                                <td>${item.product.standardSalePrice}</td>
                                <td>${item.chosenPrice}</td>
                                <td>${item.stock}</td>
                                <td>      
                                    <a href="${pageContext.request.contextPath}/product/delete/${item.id}" class="btn btn-xs btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>

                    </c:when>
                </c:choose>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5"><a href="${pageContext.request.contextPath}/product/add_step_1" class="btn btn-sm btn-danger">Add product</a></td>
                    <td><em>Total products: ${items.size()}</em></td>       
                </tr>
            </tfoot>
        </table>
        <!--Javascript menu activator-->
        <script>activeMenu("products");</script>
        <t:footer/>
    </jsp:body>
</t:menu>
