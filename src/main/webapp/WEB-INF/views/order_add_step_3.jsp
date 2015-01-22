<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<t:menu>
    <jsp:body>
        <t:title_and_message/>
        <div class="panel panel-default">
            <div class="panel-body">           
                <form:form method="POST" class="form-horizontal" role="form" commandName="itemOrder" action="${pageContext.request.contextPath}/itemOrder/add_step_3">  
                    <!--productName start-->
                    
                        <div id="field_productName" class="form-group">
                            <label for="productName" class="col-sm-3 control-label">Product Name:</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${itemOrder.item.product.name}</p>
                            </div>
                        </div>
                        <br>    
                    <!--productName end-->

                    <!--date start-->
                    <div id="field_date" class="form-group">
                        <label for="date" class="col-sm-3 control-label">Date:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.date}</p>
                        </div>
                    </div>
                    <br>    
                    <!--date end-->

                    <!--delivery start-->
                    <div id="field_delivery" class="form-group">
                        <label for="delivery" class="col-sm-3 control-label">Pickup or delivery:</label>
                        <div class="col-sm-3">
                            
                    <c:choose>
                        <c:when test="${itemOrder.delivery == true}">
                            <p class="form-control-static">Delivery</p>
                            </c:when>
                            <c:otherwise> 
                            <p class="form-control-static">Pickup</p>
                            </c:otherwise>
                            </c:choose>
                        
                        </div>
                    </div>
                    <br>    
                    <!--delivery end-->
                    <c:choose>
                        <c:when test="${itemOrder.delivery == true}">
                    <!--destination start-->
                    <div id="field_destination" class="form-group">
                        <label for="destination" class="col-sm-3 control-label">Address:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${currentUser.streetName} ${currentUser.streetNumber} ${currentUser.streetNumberSuffix}</p>
                        </div>
                    </div>
                    <br>    
                    <!--destination end-->
                        </c:when>
                        <c:otherwise>
                    <!--establishment start-->
                    <div id="field_establishment" class="form-group">
                        <label for="establishment" class="col-sm-3 control-label">Establishment:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.item.establishment.name}</p>
                        </div>
                    </div>
                    <br>    
                    <!--establishment end-->
                    </c:otherwise>
                    </c:choose>
                    <!--shippingCosts start-->
                    <div id="field_ActualPrice" class="form-group">
                        <label for="ActualPrice" class="col-sm-3 control-label">Price per product:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.item.getActualPrice()}"/></p>
                        </div>
                    </div>
                    <br>    
                    <!--shippingCosts end-->
                    
                    <!--amount start-->
                    <div id="field_amount" class="form-group">
                        <label for="" class="col-sm-3 control-label">Amount:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.amount}</p>
                        </div>
                    </div>
                    <br>    
                    <!--amount end-->
                    <!--shippingCosts start-->
                    <div id="field_shippingCosts" class="form-group">
                        <label for="shippingCosts" class="col-sm-3 control-label">Shipping costs:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.shippingCosts}"/></p>
                        </div>
                    </div>
                    <br>    
                    <!--shippingCosts end-->                    
                    <!--totalPrice start-->
                    <div id="field_totalPrice" class="form-group">
                        <label for="totalPrice" class="col-sm-3 control-label">Total price:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.item.getBulkPrice() + itemOrder.shippingCosts}"/></p>
                        </div>
                    </div>
                    <br>    
                    <!--totalPrice end-->
                    
                    <div class="col-sm-3">
                        <button type="submit" class="btn btn-primary">Confirm Order</button>
                    </div>
            </div>
        </div>
                        </form:form>
                        <!--Javascript menu activator-->
        <!--<script>activeMenu("NAME_OF_THE_ACTIVE_TAB_GOES_HERE");</script>-->
        <t:footer/>
    </jsp:body>
</t:menu>
