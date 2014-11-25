<script>
    function validate(field, reg) {
        if (reg.test(document.getElementById(field).value)) {
            document.getElementById("field_" + field).className = "form-group has-success";
            return true;
        } else {
            document.getElementById("field_" + field).className = "form-group has-error";
            return false;
        }

    }
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:menu>
    <jsp:body>
        <t:title_and_message/>
        <form:form method="POST" class="form-horizontal" role="form" commandName="establishment" action="${pageContext.request.contextPath}/establishment/add">
            <div id="field_name" class="form-group <c:if test="${errorName}">has-error</c:if>">
                    <label for="name" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-4">
                    <form:input required="required"  onblur="validate(\"name\",/^[a-zA-Z]{2,}$/)" path="name" class="form-control" id="name" /> 
                    <c:if test="${errorName}"><span class="help-block">Must be at least 2 characters long</span></c:if>
                    </div>
                </div>

                <div id="field_streetName" class="form-group <c:if test="${errorStreetName}">has-error</c:if>">
                    <label for="streetName" class="col-sm-2 control-label">Street name</label>
                    <div class="col-sm-4">
                    <form:input required="required" onblur="validate(\"streetName\",/^[a-zA-Z]{2,}$/)" path="streetName" class="form-control" id="streetName" /> 
                    <c:if test="${errorStreetName}"><span class="help-block">Must be at least 2 characters long</span></c:if>
                    </div>
                </div>

                <div id="field_streetNumber" class="form-group <c:if test="${errorStreetNumber}">has-error</c:if>">
                    <label for="streetNumber" class="col-sm-2 control-label">Street number</label>
                    <div class="col-sm-4">
                    <form:input required="required" type="number" onblur="validate(\"streetNumber\",/^\\d{1,}$/)" path="streetNumber" class="form-control" id="streetNumber" /> 
                    <c:if test="${errorStreetNumber}"><span class="help-block">Must be a valid number</span></c:if>
                    </div>
                </div>

                <div id="field_streetNumberSuffix" class="form-group">
                    <label for="streetNumberSuffix" class="col-sm-2 control-label">Street number suffix</label>
                    <div class="col-sm-4">
                    <form:input onblur="validate(\"streetNumberSuffix\",/^.*$/)" path="streetNumberSuffix" class="form-control" id="streetNumberSuffix" /> 
                </div>
            </div>

            <div id="field_postalCode" class="form-group <c:if test="${errorPostalCode}">has-error</c:if>">
                    <label for="postalCode" class="col-sm-2 control-label">Postal code</label>
                    <div class="col-sm-4">
                    <form:input required="required" onblur="validate(\"postalCode\",/^\\d{4} ?[a-zA-Z]{2}/)" path="postalCode" placeholder="1234AB" class="form-control" id="postalCode" /> 
                    <c:if test="${errorPostalCode}"><span class="help-block">Must have 4 numbers and 2 letters</span></c:if>
                    </div>
                </div>

                <div id="field_city" class="form-group <c:if test="${errorCity}">has-error</c:if>">
                    <label for="city" class="col-sm-2 control-label">City</label>
                    <div class="col-sm-4">
                    <form:input required="required"  onblur="validate(\"city\",/^[a-zA-Z]{2,}$/)" path="city" class="form-control" id="city" /> 
                    <c:if test="${errorCity}"><span class="help-block">Must be at least 2 characters long</span></c:if>
                    </div>
                </div>

                <div id="field_phoneNumber" class="form-group <c:if test="${errorPhoneNumber}">has-error</c:if>">
                    <label for="phoneNumber" class="col-sm-2 control-label">Phone number</label>
                    <div class="col-sm-4">
                    <form:input required="required" onblur="validate(\"phoneNumber\",/^0\\d{9}$/)" type="number" path="phoneNumber" placeholder="0612345678" class="form-control" id="phoneNumber" /> 
                    <c:if test="${errorPhoneNumber}"><span class="help-block">Must have 10 digits</span></c:if>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Create Account</button>
                    </div>
                </div>

        </form:form>
    </jsp:body>
</t:menu>

