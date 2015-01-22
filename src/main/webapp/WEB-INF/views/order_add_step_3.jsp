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
                Order information:
                    <!--orderID start-->
                        <div id="field_orderID" class="form-group">
                            <label for="orderID" class="col-sm-3 control-label">Order ID:</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${itemOrder.id}</p>
                            </div>
                        </div>
                        <br>    
                    <!--orderID end-->
                    
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
                        <label for="delivery" class="col-sm-3 control-label">Delivery:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.delivery}</p>
                        </div>
                    </div>
                    <br>    
                    <!--delivery end-->

                    <!--destination start-->
                    <div id="field_destination" class="form-group">
                        <label for="destination" class="col-sm-3 control-label">Destination:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.destination}</p>
                        </div>
                    </div>
                    <br>    
                    <!--destination end-->

                    <!--establishment start-->
                    <div id="field_establishment" class="form-group">
                        <label for="establishment" class="col-sm-3 control-label">Establishment:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.item.establishment.name}</p>
                        </div>
                    </div>
                    <br>    
                    <!--establishment end-->

                    <!--shippingCosts start-->
                    <div id="field_shippingCosts" class="form-group">
                        <label for="shippingCosts" class="col-sm-3 control-label">Shipping costs:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.shippingCosts}"/></p>
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
                    
                    <!--totalPrice start-->
                    <div id="field_totalPrice" class="form-group">
                        <label for="totalPrice" class="col-sm-3 control-label">Total price:</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${itemOrder.totalPrice}"/></p>
                        </div>
                    </div>
                    <br>    
                    <!--totalPrice end-->
                    
                    <div class="col-sm-3">
                        <button type="submit" class="btn btn-primary">Confirm Order</button>
                    </div>
            </div>
        </div>
                        <!--Javascript menu activator-->
        <!--<script>activeMenu("NAME_OF_THE_ACTIVE_TAB_GOES_HERE");</script>-->
        <t:footer/>
    </jsp:body>
</t:menu>
