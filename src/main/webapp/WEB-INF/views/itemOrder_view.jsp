<%-- 
    Document   : itemOrder_view
    Created on : Jan 11, 2015, 9:43:16 PM
    Author     : Erik
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:menu>
    <jsp:body>
        <t:title_and_message/>
        <div class="panel panel-default">
            <div class="panel-body">
                <form:form method="POST" class="form-horizontal" role="form" commandName="itemOrder" action="${pageContext.request.contextPath}/itemOrder/view">

                    <c:choose>
                        <c:when test="${currentUser.permissionLevel == 1}">

                            <!--orderID start-->
                            <div id="field_orderID" class="form-group">
                                <label for="orderID" class="col-sm-3 control-label">Order ID</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.id}</p>
                                </div>
                            </div>
                            <!--orderID end-->

                            <!--amount start-->
                            <div id="field_amount" class="form-group">
                                <label for="" class="col-sm-3 control-label">Amount</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.amount}</p>
                                </div>
                            </div>
                            <!--amount end-->

                            <!--productName start-->
                            <div id="field_productName" class="form-group">
                                <label for="productName" class="col-sm-3 control-label">Product Name</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.item.product.name}</p>
                                </div>
                            </div>
                            <!--productName end-->

                            <!--date start-->
                            <div id="field_date" class="form-group">
                                <label for="date" class="col-sm-3 control-label">Date</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.date}</p>
                                </div>
                            </div>
                            <!--date end-->

                            <!--delivery start-->
                            <div id="field_delivery" class="form-group">
                                <label for="delivery" class="col-sm-3 control-label">Send/Pickup</label>
                                <div class="col-sm-3">
                                    <c:choose>
                                        <c:when test="${itemOrder.delivery == true}">
                                            <p class="form-control-static">Send</p>
                                        </c:when>
                                        <c:when test="${itemOrder.delivery == false}">
                                            <p class="form-control-static">Pickup</p>
                                        </c:when> 
                                    </c:choose>
                                </div>
                            </div>
                            <!--delivery end-->

                            <!--ready start-->
                            <div id="field_ready" class="form-group">
                                <label for="ready" class="col-sm-3 control-label">Ready</label>
                                <div class="col-sm-3">
                                    <c:choose>
                                        <c:when test="${itemOrder.ready == true}">
                                            <p class="form-control-static">Yes</p>
                                        </c:when>
                                        <c:when test="${itemOrder.ready == false}">
                                            <p class="form-control-static">No</p>
                                        </c:when> 
                                    </c:choose>
                                </div>
                            </div>
                            <!--ready end-->

                            <!--destination start-->
                            <div id="field_destination" class="form-group">
                                <label for="destination" class="col-sm-3 control-label">Destination Address</label>
                                <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${itemOrder.delivery == true}">
                                                ${currentUser.streetName} ${currentUser.streetNumber} ${currentUser.streetNumberSuffix}
                                                </c:when>
                                                <c:when test="${itemOrder.delivery == false}">
                                                ${itemOrder.item.establishment.name}
                                            </c:when> 
                                        </c:choose>
                                </div>
                            </div>
                            <!--destination end-->

                            <!--handledby start-->
<!--                            <div id="field_handledBy" class="form-group">
                                <label for="handledBy" class="col-sm-3 control-label">Handled By</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.handledBy}</p>
                                </div>
                            </div>-->
                            <!--handledby end-->

                            <!--shippingCosts start-->
                            <div id="field_shippingCosts" class="form-group">
                                <label for="shippingCosts" class="col-sm-3 control-label">Shipping Costs</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.shippingCosts}" /></p>
                                </div>
                            </div>
                            <!--shippingCosts end-->

                            <!--totalPrice start-->
                            <div id="field_totalPrice" class="form-group">
                                <label for="totalPrice" class="col-sm-3 control-label">Total Price</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.totalPrice}" /></p>
                                </div>
                            </div>
                            <!--totalPrice end-->

                            <!--back and print start-->
                            <div id="button_backAndPrint" class="form-group">
                                <div class="col-sm-3">                            
                                    <a href="${pageContext.request.contextPath}/itemOrder/history" class="btn btn-xs btn-default">Back</a>
                                    <a href="${pageContext.request.contextPath}/itemOrder/history" class="btn btn-xs btn-default" onClick="window.print()">Print</a> 
                                </div>
                            </div>
                            <!--back and print end-->

                        </c:when>
                    </c:choose>

                    <c:choose>
                        <c:when test="${currentUser.permissionLevel == 2}">

                            <!--orderID start-->
                            <div id="field_orderID" class="form-group">
                                <label for="orderID" class="col-sm-3 control-label">Order ID</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.id}</p>
                                </div>
                            </div>
                            <!--orderID end-->

                            <!--amount start-->
                            <div id="field_amount" class="form-group">
                                <label for="" class="col-sm-3 control-label">Amount</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.amount}</p>
                                </div>
                            </div>
                            <!--amount end-->

                            <!--productName start-->
                            <div id="field_productName" class="form-group">
                                <label for="productName" class="col-sm-3 control-label">Product Name</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.item.product.name}</p>
                                </div>
                            </div>
                            <!--productName end-->

                            <!--productId start-->
                            <div id="field_productId" class="form-group">
                                <label for="productName" class="col-sm-3 control-label">Product Id</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.item.product.id}</p>
                                </div>
                            </div>
                            <!--productId end-->

                            <!--date start-->
                            <div id="field_date" class="form-group">
                                <label for="date" class="col-sm-3 control-label">Date</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">${itemOrder.date}</p>
                                </div>
                            </div>
                            <!--date end-->

                            <!--delivery start-->
                            <div id="field_delivery" class="form-group">
                                <label for="delivery" class="col-sm-3 control-label">Send/Pickup</label>
                                <div class="col-sm-3">
                                    <c:choose>
                                        <c:when test="${itemOrder.delivery == true}">
                                            <p class="form-control-static">Send</p>
                                        </c:when>
                                        <c:when test="${itemOrder.delivery == false}">
                                            <p class="form-control-static">Pickup</p>
                                        </c:when> 
                                    </c:choose>
                                </div>
                            </div>
                            <!--delivery end-->

                            <!--ready start-->
                            <div id="field_ready" class="form-group">
                                <label for="ready" class="col-sm-3 control-label">Ready</label>
                                <div class="col-sm-3">
                                    <c:choose>
                                        <c:when test="${itemOrder.ready == true}">
                                            <p class="form-control-static">Yes</p>
                                        </c:when>
                                        <c:when test="${itemOrder.ready == false}">
                                            <p class="form-control-static">No</p>
                                        </c:when> 
                                    </c:choose>
                                </div>
                            </div>
                            <!--ready end-->

                            <!--destination start-->
                            <div id="field_destination" class="form-group">
                                <label for="destination" class="col-sm-3 control-label">Destination Address</label>
                                <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${itemOrder.delivery == true}">
                                                ${currentUser.streetName} ${currentUser.streetNumber} ${currentUser.streetNumberSuffix}
                                                </c:when>
                                                <c:when test="${itemOrder.delivery == false}">
                                                ${itemOrder.item.establishment.name}
                                            </c:when> 
                                        </c:choose>
                                </div>
                            </div>
                            <!--destination end-->

                            <!--shippingCosts start-->
                            <div id="field_shippingCosts" class="form-group">
                                <label for="shippingCosts" class="col-sm-3 control-label">Shipping Costs</label>
                                <div class="col-sm-3">
                                    <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.shippingCosts}" /></p>
                                </div>
                            </div>
                            <!--shippingCosts end-->

                            <!--totalPrice start-->
                            <div id="field_totalPrice" class="form-group">
                                <label for="totalPrice" class="col-sm-3 control-label">Total Price</label>
                                <div class="col-sm-3"> 
                                    <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.totalPrice}" /></p>
                                </div>
                            </div>
                            <!--totalPrice end-->

                            <!--back and print start-->
                            <div id="button_backAndPrint" class="form-group">
                                <div class="col-sm-3"> 
                                    <a href="${pageContext.request.contextPath}/itemOrder/list" class="btn btn-xs btn-default">Back</a>
                                    <a href="${pageContext.request.contextPath}/itemOrder/list" class="btn btn-xs btn-default" onClick="window.print()">Print</a>
                                    <a href="${pageContext.request.contextPath}/itemOrder/ready/${itemOrder.id}" class="btn btn-xs btn-default">Ready</a>
                                    <a href="${pageContext.request.contextPath}/itemOrder/unready/${itemOrder.id}" class="btn btn-xs btn-default">Unready</a>
                                </div>
                            </div>
                            <!--back and print end-->

                        </c:when>
                    </c:choose>

                </form:form>
            </div>
        </div>
        <t:footer/>
    </jsp:body>
</t:menu>
