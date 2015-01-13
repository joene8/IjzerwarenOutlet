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
                        <label for="orderID" class="col-sm-3 control-label">orderID</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.id}</p>
                        </div>
                    </div>
                    <!--orderID end-->

                    <!--amount start-->
                    <div id="field_amount" class="form-group">
                        <label for="" class="col-sm-3 control-label">amount</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.amount}</p>
                        </div>
                    </div>
                    <!--amount end-->

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

                    <!--totalPrice start-->
                    <div id="field_totalPrice" class="form-group">
                        <label for="totalPrice" class="col-sm-3 control-label">totalPrice</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.totalPrice}</p>
                        </div>
                    </div>
                    <!--totalPrice end-->

                    <!--user start-->
                    <div id="field_user" class="form-group">
                        <label for="user" class="col-sm-3 control-label">user</label>
                        <div class="col-sm-3">
                            <p class="form-control-static">${itemOrder.user.name}</p>
                        </div>
                    </div>
                    <!--user end-->

                    <!--delete start-->
                    <div id="button_delete" class="form-group">
                        <div class="col-sm-3">
                            <a href="${pageContext.request.contextPath}/itemOrder/delete/${itemOrder.id}" class="btn btn-xs btn-danger">Delete</a>
                        </div>
                    </div>
                    <!--delete end-->

                </form:form>
            </div>
        </div>
        <t:footer/>
    </jsp:body>
</t:menu>
