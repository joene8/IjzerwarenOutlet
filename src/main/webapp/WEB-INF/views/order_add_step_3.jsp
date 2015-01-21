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
                Order information:
                    <!--orderID start-->
                        <div id="field_orderID" class="form-group">
                            <label for="orderID" class="col-sm-3 control-label">orderID</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${itemOrder.id}</p>
                            </div>
                        </div>
                        <br>    
                    <!--orderID end-->

                    <!--date start-->
                    <div id="field_date" class="form-group">
                        <label for="date" class="col-sm-3 control-label">date</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.date}</p>
                        </div>
                    </div>
                    <br>    
                    <!--date end-->

                    <!--delivery start-->
                    <div id="field_delivery" class="form-group">
                        <label for="delivery" class="col-sm-3 control-label">delivery</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.delivery}</p>
                        </div>
                    </div>
                    <br>    
                    <!--delivery end-->

                    <!--destination start-->
                    <div id="field_destination" class="form-group">
                        <label for="destination" class="col-sm-3 control-label">destination</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.destination}</p>
                        </div>
                    </div>
                    <br>    
                    <!--destination end-->

                    <!--establishment start-->
                    <div id="field_establishment" class="form-group">
                        <label for="establishment" class="col-sm-3 control-label">establishment</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.item.establishment.name}</p>
                        </div>
                    </div>
                    <br>    
                    <!--establishment end-->

                    <!--shippingCosts start-->
                    <div id="field_shippingCosts" class="form-group">
                        <label for="shippingCosts" class="col-sm-3 control-label">shippingCosts</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.shippingCosts}</p>
                        </div>
                    </div>
                    <br>    
                    <!--shippingCosts end-->
                    
                    <!--amount start-->
                    <div id="field_amount" class="form-group">
                        <label for="" class="col-sm-3 control-label">amount</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.amount}</p>
                        </div>
                    </div>
                    <br>    
                    <!--amount end-->
                    
                    <!--totalPrice start-->
                    <div id="field_totalPrice" class="form-group">
                        <label for="totalPrice" class="col-sm-3 control-label">totalPrice</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.totalPrice}</p>
                        </div>
                    </div>
                    <br>    
                    <!--totalPrice end-->
                    
                    
            </div>
        </div>
                        <!--Javascript menu activator-->
        <!--<script>activeMenu("NAME_OF_THE_ACTIVE_TAB_GOES_HERE");</script>-->
        <t:footer/>
    </jsp:body>
</t:menu>
