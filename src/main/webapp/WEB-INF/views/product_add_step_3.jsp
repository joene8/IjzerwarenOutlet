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

    function checkAddition() {
        var buttons = document.getElementsByName("addition");
        if (buttons[0].checked) {
            $("#hidden").slideDown(500);
        } else {
            $("#hidden").slideUp(500);
        }
    }
</script>
<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
            <div class="panel panel-default">
                <div class="panel-body">
                <form:form method="POST" class="form-horizontal" role="form" commandName="item" action="${pageContext.request.contextPath}/product/add_step_3">  

                    <!--Chosen price begin-->
                    <div id="field_chosenPrice" class="form-group <c:if test="${chosenPriceError}">has-error</c:if>">
                            <label for="chosenPrice" class="col-sm-2 control-label">Price</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <span class="input-group-addon">&euro;</span>
                                <form:input path="chosenPrice" onblur="validate(\"chosenPrice\",/^[(0-9)+.?(0-9)*]+$/)" class="form-control" id="chosenPrice" /> 
                                <span id="glyph_chosenPrice" class=""></span>
                                <c:if test="${chosenPriceError}"><span class="help-block">Must be an valid price.</span></c:if>
                                </div>
                            </div>
                        </div>
                        <!--Chosen price end-->

                        <!--Stock begin-->
                        <div id="field_stock" class="form-group <c:if test="${stockError}">has-error</c:if>">
                            <label for="stock" class="col-sm-2 control-label">Stock</label>
                            <div class="col-sm-3">
                                    <form:input path="stock" onblur="validate(\"stock\",/^\\d{1,}$/)" class="form-control" id="stock" /> 
                                    <span id="glyph_stock" class=""></span>
                                <c:if test="${stockError}"><span class="help-block">Must be an valid number.</span></c:if>
                            </div>
                        </div>
                        <!--Stock end-->

                        <!--Addition start-->
                        <div id="field_addition" class="form-group">
                            <label for="addition" class="col-sm-2 control-label"><c:if test="${errorAddition}"></c:if>Would you like to give additional information?</label>
                            <div class="col-sm-4">


                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary">
                                    <form:radiobutton onchange="checkAddition()" name="addition" path="addition" value="yes"/>Yes</label>
                                <label class="btn btn-primary active">
                                    <form:radiobutton onchange="checkAddition()" name="addition" path="addition" value="no"/>No</label>
                            </div>    
                        </div>
                    </div>

                    <div id="hidden" style="display:none;">
                        <div id="field_additionDescription" class="form-group">
                            <label for="additionDescription" class="col-sm-2 control-label"><c:if test="${additionDescriptionError}"></c:if>Addition description</label>
                                <div class="col-sm-3">
                                <form:input path="additionDescription" onblur="validate(\"additionDescription\",/^.{6,}$/)" class="form-control" id="additionDescription" /> 
                                <span id="glyph_additionDescription" class=""></span>
                                <c:if test="${additionDescriptionError}"><span class="help-block">The addition description was not entered correctly</span></c:if>
                                </div>
                            </div>        

                            <div id="field_discountPercentage" class="form-group">
                                <label for="discountPercentage" class="col-sm-2 control-label">Discount Percentage</label>
                                <div class="col-sm-2">
                                    <div class="input-group">
                                        <span class="input-group-addon">%</span>    
                                    <form:select path="discountPercentage" class="form-control" id="discountPercentage" >
                                        <form:option  value="10" label="10" />
                                        <form:option  value="20" label="20" />
                                        <form:option  value="30" label="30" />
                                    </form:select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Addition end-->





                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
        <t:footer/>
    </jsp:body>
</t:menu>