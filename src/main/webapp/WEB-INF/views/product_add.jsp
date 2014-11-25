<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
        <form:form method="POST" class="form-horizontal" role="form" commandName="product" action="${pageContext.request.contextPath}/product/add">  

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Name</label> <font color="red"><b>${name_error}</b></font>
                <div class="col-sm-4">
                    <form:input path="name" class="form-control" id="name"/> 
                    <form:errors path="name" cssStyle="color: #ff0000;"/>
                </div>
            </div>

            <div class="form-group">
                <label for="price" class="col-sm-2 control-label">Price</label>
                <div class="col-sm-4">
                    <div class="input-group">
                        <span class="input-group-addon">€</span>
                        <form:input path="price" class="form-control" id="price" type="number" step="0.01"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="location" class="col-sm-2 control-label">Location</label> <font color="red"><b>${location_error}</b></font>
                <div class="col-sm-4">
                    <form:input path="location" class="form-control" id="location"/>
                </div>
            </div>

            <div class="form-group">
                <label for="weight" class="col-sm-2 control-label">Weight</label> <font color="red"><b>${weight_error}</b></font>
                <div class="col-sm-4">
                    <form:input path="weight" class="form-control" id="weight" />
                </div>
            </div>

            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">Description</label><font color="red"><b>${description_error}</b></font>
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