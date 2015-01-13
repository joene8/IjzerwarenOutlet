<%-- 
    Document   : itemOrder_view
    Created on : Jan 11, 2015, 9:43:16 PM
    Author     : Erik
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:menu>
    <jsp:body>
        <t:title_and_message/>
        <div class="panel panel-default">
            <div class="panel-body">
                <form:form method="POST" class="form-horizontal" role="form" commandName="itemOrder" action="${pageContext.request.contextPath}/itemOrder/view">

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

                    <!--date start-->
                    <div id="field_date" class="form-group">
                        <label for="date" class="col-sm-3 control-label">Date and Time</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.date}</p>
                        </div>
                    </div>
                    <!--date end-->

                    <!--delivery start-->
                    <div id="field_delivery" class="form-group">
                        <label for="delivery" class="col-sm-3 control-label">Send/Pickup</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.delivery}</p>
                        </div>
                    </div>
                    <!--delivery end-->

                    <!--destination start-->
                    <div id="field_destination" class="form-group">
                        <label for="destination" class="col-sm-3 control-label">Destination</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.destination}</p>
                        </div>
                    </div>
                    <!--destination end-->

                    <!--shippingCosts start-->
                    <div id="field_shippingCosts" class="form-group">
                        <label for="shippingCosts" class="col-sm-3 control-label">Shipping Costs</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.shippingCosts}</p>
                        </div>
                    </div>
                    <!--shippingCosts end-->

                    <!--totalPrice start-->
                    <div id="field_totalPrice" class="form-group">
                        <label for="totalPrice" class="col-sm-3 control-label">Total Price</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.totalPrice}</p>
                        </div>
                    </div>
                    <!--totalPrice end-->
                    
                    <!--ready start-->
                    <div id="field_ready" class="form-group">
                        <label for="ready" class="col-sm-3 control-label">Ready?</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.ready}</p>
                        </div>
                    </div>
                    <!--ready end-->
                    
                    <!--handledBy start-->
                    <div id="field_handledBy" class="form-group">
                        <label for="handledBy" class="col-sm-3 control-label">Handled By</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.handledBy}</p>
                        </div>
                    </div>
                    <!--handledBy end-->

                </form:form>
            </div>
        </div>
        <t:footer/>
    </jsp:body>
</t:menu>
