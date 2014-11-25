<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
        <form:form method="POST" class="form-horizontal" role="form" commandName="product" action="${pageContext.request.contextPath}/product/edit">
            <form:hidden path="Id"/>

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-4">
                    <form:input path="name" class="form-control" id="name"/>
                </div>
            </div>

            <div class="form-group">
                <label for="price" class="col-sm-2 control-label">Price</label>
                <div class="col-sm-4">
                    <form:input path="price" class="form-control" id="price" />
                </div>
            </div>

            <div class="form-group">
                <label for="location" class="col-sm-2 control-label">Location</label>
                <div class="col-sm-4">
                    <form:input path="location" class="form-control" id="location"/>
                </div>
            </div>

            <div class="form-group">
                <label for="weight" class="col-sm-2 control-label">Weight</label>
                <div class="col-sm-4">
                    <form:input path="weight" class="form-control" id="weight"/>
                </div>
            </div>

            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-4">
                    <form:input path="description" class="form-control" id="description"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>


        </form:form>
    </jsp:body>
</t:menu>