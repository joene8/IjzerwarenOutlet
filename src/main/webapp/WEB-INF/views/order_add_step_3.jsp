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
                Customer information:
                <!--First name start-->
                    <div id="field_firstName" class="form-group">
                            <label for="firstName" class="col-sm-3 control-label">First name</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${currentUser.firstName}</p>
                        </div>
                    </div>
                    <!--First name end-->

                    <!--Last name start-->
                    <div id="field_lastName" class="form-group">
                            <label for="lastName" class="col-sm-3 control-label">Last name</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${currentUser.lastName}</p>
                        </div>
                    </div>
                    <!--Last name end-->

                    <!--Email start-->
                    <div id="field_email" class="form-group">
                            <label for="email" class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${currentUser.email}</p>
                        </div>
                    </div>
                    <!--Email end-->
                    
                    <!--Street name start-->
                    <div id="field_streetName" class="form-group">
                            <label for="streetName" class="col-sm-3 control-label">Street name</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${currentUser.streetName}</p>
                        </div>
                    </div>
                    <!--Street name end-->

                    <!--Street number start-->
                    <div id="field_streetNumber" class="form-group">
                            <label for="streetNumber" class="col-sm-3 control-label">Street number</label>
                            <div class="col-sm-2">
                                <p class="form-control-static">${currentUser.streetNumber}</p>
                        </div>
                    </div>
                    <!--Street number end-->

                    <!--Street number suffix start-->
                    <div id="field_streetNumberSuffix" class="form-group">
                        <label for="streetNumberSuffix" class="col-sm-3 control-label">Suffix</label>
                        <div class="col-sm-2">
                            <p class="form-control-static">${currentUser.streetNumberSuffix}</p>          
                        </div>
                    </div>
                    <!--Street number suffix end-->

                    <!--Postal code start-->
                    <div id="field_postalCode" class="form-group">
                        <label for="postalCode" class="col-sm-3 control-label">Postal code</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${currentUser.postalCode}</p>
                        </div>
                    </div>
                    <!--Postal code end-->

                    <!--City start-->
                    <div id="field_city" class="form-group">
                        <label for="city" class="col-sm-3 control-label">City</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${currentUser.city}</p>
                        </div>
                    </div>
                    <!--City end-->

                    <!--Phone number start-->
                    <div id="field_phoneNumber" class="form-group">
                        <label for="phoneNumber" class="col-sm-3 control-label">Phone number</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${currentUser.phoneNumber}</p>
                        </div>
                    </div>
                    <!--Phone number end-->
                
                
                Order information:
                    <!--orderID start-->
                        <div id="field_orderID" class="form-group">
                            <label for="orderID" class="col-sm-3 control-label">orderID</label>
                            <div class="col-sm-3">
                                <p class="form-control-static">${itemOrder.id}</p>
                            </div>
                        </div>
                    <!--orderID end-->

                    <!--date start-->
                    <div id="field_date" class="form-group">
                        <label for="date" class="col-sm-3 control-label">date</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.date}</p>
                        </div>
                    </div>
                    <!--date end-->

                    <!--delivery start-->
                    <div id="field_delivery" class="form-group">
                        <label for="delivery" class="col-sm-3 control-label">delivery</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.delivery}</p>
                        </div>
                    </div>
                    <!--delivery end-->

                    <!--destination start-->
                    <div id="field_destination" class="form-group">
                        <label for="destination" class="col-sm-3 control-label">destination</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.destination}</p>
                        </div>
                    </div>
                    <!--destination end-->

                    <!--establishment start-->
                    <div id="field_establishment" class="form-group">
                        <label for="establishment" class="col-sm-3 control-label">establishment</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.item.establishment.name}</p>
                        </div>
                    </div>
                    <!--establishment end-->

                    <!--shippingCosts start-->
                    <div id="field_shippingCosts" class="form-group">
                        <label for="shippingCosts" class="col-sm-3 control-label">shippingCosts</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.shippingCosts}</p>
                        </div>
                    </div>
                    <!--shippingCosts end-->
                    
                    <!--amount start-->
                    <div id="field_amount" class="form-group">
                        <label for="" class="col-sm-3 control-label">amount</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.amount}</p>
                        </div>
                    </div>
                    <!--amount end-->
                    
                    <!--totalPrice start-->
                    <div id="field_totalPrice" class="form-group">
                        <label for="totalPrice" class="col-sm-3 control-label">totalPrice</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.totalPrice}</p>
                        </div>
                    </div>
                    <!--totalPrice end-->
                    
                    
            </div>
        </div>
                        <!--Javascript menu activator-->
        <!--<script>activeMenu("NAME_OF_THE_ACTIVE_TAB_GOES_HERE");</script>-->
        <t:footer/>
    </jsp:body>
</t:menu>
