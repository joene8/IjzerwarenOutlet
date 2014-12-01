<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function checkAddition() {
        var buttons = document.getElementsByName("addition");
        if(buttons[0].checked){
        document.getElementById("hidden").style.visibility = "visible";
    } else {
        document.getElementById("hidden").style.visibility = "hidden";
    }
    }
</script>
<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
        <form:form method="POST" class="form-horizontal" role="form" commandName="product" action="${pageContext.request.contextPath}/product/add">  

            <div id="field_name" class="form-group">
                <label for="name" class="col-sm-2 control-label"><c:if test="${errorName}"></c:if>Name</label>
                    <div class="col-sm-4">
                    <form:input path="name" class="form-control" id="name" /> 
                    <c:if test="${errorName}"><span class="help-block">Name was not entered correctly</span></c:if>
                    </div>
                </div>

                <div id="field_description" class="form-group">
                    <label for="description" class="col-sm-2 control-label"><c:if test="${errorDescription}"></c:if>Description</label>
                    <div class="col-sm-4">
                    <form:input path="description" class="form-control" id="description" /> 
                    <c:if test="${errorDescription}"><span class="help-block">Description was not entered correctly</span></c:if>
                    </div>
                </div>
                    
                                    <div id="field_price" class="form-group">
                    <label for="chosenPrice" class="col-sm-2 control-label"><c:if test="${errorChosenPrice}"></c:if>Price</label>
                    <div class="col-sm-4">
                    <form:input path="chosenPrice" class="form-control" id="chosenPrice" /> 
                    <c:if test="${errorChosenPrice}"><span class="help-block">Price was not entered correctly</span></c:if>
                    </div>
                </div>
                    
                                                        <div id="field_price" class="form-group">
                    <label for="picture" class="col-sm-2 control-label"><c:if test="${errorPicture}"></c:if>Picture</label>
                    <div class="col-sm-4">
                    <form:input type="file" path="picture" class="form-control" id="picture" /> 
                    <c:if test="${errorPicture}"><span class="help-block">Picture was not entered correctly</span></c:if>
                    </div>
                </div>


                <div id="field_addition" class="form-group">
                    <label for="addition" class="col-sm-2 control-label"><c:if test="${errorAddition}"></c:if>Would you like to give addition information?</label>
                    <div class="col-sm-4">
                    <form:radiobutton onchange="checkAddition()" name="addition" path="addition" value="yes"/><label for="yes">Yes</label><br>
                    <form:radiobutton onchange="checkAddition()" name="addition" path="addition" value="no"/><label for="no">No</label>
                </div>    
            </div>

                <div id="hidden" style="visibility:hidden;">
                <div id="field_additionDescription" class="form-group">
                    <label for="additionDescription" class="col-sm-2 control-label"><c:if test="${errorAdditionDescription}"></c:if>Addition description</label>
                        <div class="col-sm-4">
                        <form:input path="additionDescription" class="form-control" id="additionDescription" /> 
                        <c:if test="${errorName}"><span class="help-block">The addition description was not entered correctly</span></c:if>
                        </div>
                    </div>        

                    <div id="field_discountPercentage" class="form-group">
                        <label for="discountPercentage" class="col-sm-2 control-label">Discount Percentage</label>
                        <div class="col-sm-4">
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

            <!--Adding pictures needs some extra work--!>                            
            <!--            <div id="field_Picture" class="form-group">
                            <label for="Picture" class="col-sm-2 control-label"><c:if test="${errorName}"></c:if>Image</label>
                                <div class="col-sm-4">
            <form:input type ="file" path="Picture" class="form-control" id="Picture" /> 
            <c:if test="${errorName}"><span class="help-block">The wrong file was uploaded</span></c:if>
            </div>
    </div>        
                -->
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Add product</button>
                    </div>
                </div>
        </form:form>
                        <t:footer/>
    </jsp:body>
</t:menu>