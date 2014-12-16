<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function validate(field, reg) {
        if (reg.test(document.getElementById(field).value)) {
            document.getElementById("field_" + field).className = "form-group has-success has-feedback";
            document.getElementById("glyph_" + field).className = "glyphicon glyphicon-ok form-control-feedback";
            return true;
        } else {
            document.getElementById("field_" + field).className = "form-group has-error has-feedback";
            document.getElementById("glyph_" + field).className = "glyphicon glyphicon-remove form-control-feedback";
            return false;
        }

    }
</script>
<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
            <div class="panel panel-default">
                <div class="panel-body">
                <form:form method="POST" class="form-horizontal" role="form" commandName="product" action="${pageContext.request.contextPath}/product/add_step_2">  

                    <!--Name begin-->
                    <div id="field_name" class="form-group <c:if test="${nameError}">has-error</c:if>">
                        <label for="name" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-3">
                            <form:input path="name" onblur="validate(\"name\",/^[a-zA-Z]{2,}$/)" class="form-control" id="name" /> 
                            <span id="glyph_name" class=""></span>
                            <c:if test="${nameError}"><span class="help-block">Must be at least two characters long.</span></c:if>
                            </div>
                        </div>
                        <!--Name end-->

                        <!--Description begin-->
                        <div id="field_description" class="form-group <c:if test="${descriptionError}">has-error</c:if>">
                            <label for="description" class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-3">
                            <form:input path="description" onblur="validate(\"description\",/^.{6,}$/)" class="form-control" id="description" /> 
                            <span id="glyph_description" class=""></span>
                            <c:if test="${descriptionError}"><span class="help-block">Must be at least six characters long.</span></c:if>
                            </div>
                        </div>
                        <!--Description end-->

                        <!--Picture begin-->
                        <div id="field_picture" class="form-group">
                            <label for="picture" class="col-sm-2 control-label"><c:if test="${errorPicture}"></c:if>Picture</label>
                            <div class="col-sm-4">
                            <form:input type="file" path="picture" id="picture" /> 
                            <c:if test="${pictureError}"><span class="help-block">Must be a valid path to a picture.</span></c:if>
                            </div>
                        </div>
                        <!--Picture end-->

                        <!--Net thickness begin-->
                        <div class="form-group has-success has-feedback">
                            <label for="netThickness" class="col-sm-2 control-label">Net thickness</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                <span class="input-group-addon">mm</span>
                                <form:input path="netThickness" class="form-control" id="netThickness" readonly="true"/>
                                <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <!--Net thickness end-->
                    <!--Net width begin-->
                    <div class="form-group has-success has-feedback">
                        <label for="netWidth" class="col-sm-2 control-label">Net width</label>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">mm</span>
                                <form:input path="netWidth" class="form-control" id="netWidth" readonly="true"/>
                                <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <!--Net width end-->
                    <!--Product length begin-->
                    <div class="form-group has-success has-feedback">
                        <label for="productLength" class="col-sm-2 control-label">Product length</label>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">mm</span>
                                <form:input path="productLength" class="form-control" id="productLength" readonly="true"/>
                                <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <!--Product length end-->
                    <!--Gross weight begin-->
                    <div class="form-group has-success has-feedback">
                        <label for="grossWeight" class="col-sm-2 control-label">Gross weight</label>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">kg</span>
                                <form:input path="grossWeight" class="form-control" id="grossWeight" readonly="true"/>
                                <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <!--Gross weight end-->
                    <!--Standard sale price begin-->
                    <div class="form-group has-success has-feedback">
                        <label for="standardSalePrice" class="col-sm-2 control-label">Standard sale price</label>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <span class="input-group-addon">&euro;</span>
                                <form:input path="standardSalePrice" class="form-control" id="standardSalePrice" readonly="true"/>
                                <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <!--Standard sale price end-->



                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
        <t:footer/>
    </jsp:body>
</t:menu>