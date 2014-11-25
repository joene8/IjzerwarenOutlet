<%-- 
    Document   : userRegister
    Created on : 17-Nov-2014, 06:51:06
    Author     : How Fei Zheng
--%>

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
        <form:form method="POST" class="form-horizontal" role="form" commandName="user" action="${pageContext.request.contextPath}/user/register">

            <div id="field_email" class="form-group <c:if test="${errorEmail}">has-error</c:if>">
                <label for="email" class="col-sm-2 control-label"><c:if test="${errorEmail}"></c:if>Email</label>
                    <div class="col-sm-4">
                    <form:input onblur="validate(\"email\",/^\\w+@\\w+\\.\\w{2,}$/)" path="email" class="form-control" id="email" /> 
                    <c:if test="${errorEmail}"><span class="help-block">Email was not entered correctly</span></c:if>
                    </div>
                </div>


                <div id="field_username" class="form-group <c:if test="${errorUsername}">has-error</c:if>">
                    <label for="username" class="col-sm-2 control-label">Username</label> 
                    <div class="col-sm-4">
                    <form:input onblur="validate(\"username\",/^[a-zA-Z]{2,}$/)" path="username" class="form-control" id="username"/> 
                </div>
            </div>

            <div id="field_password"class="form-group <c:if test="${errorPassword}">has-error</c:if>">
                    <label for="password" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-4">
                    <form:input onblur="validate(\"password\",/^[a-zA-Z]{2,}$/)" type="password" path="password" class="form-control" id="password" /> 
                </div>
            </div>

            <div id="field_name" class="form-group <c:if test="${errorName}">has-error</c:if>">
                    <label for="name" class="col-sm-2 control-label">Name</label> 
                    <div class="col-sm-4">
                    <form:input onblur="validate(\"name\",/^[a-zA-Z]{2,}$/)" path="name" class="form-control" id="name" />
                    <c:if test="${errorName}"><span class="help-block">Name was not entered correctly</span></c:if>
                    </div>
                </div>

                <div id="field_streetAddress" class="form-group <c:if test="${errorAddress}">has-error</c:if>">
                    <label for="streetAddress" class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-4">
                    <form:input onblur="validate(\"streetAddress\",/^[a-zA-Z]{2,}$/)" path="streetAddress" class="form-control" id="streetAddress" /> 
                </div>
            </div>

            <div id="field_city" class="form-group <c:if test="${errorCity}">has-error</c:if>">
                    <label for="city" class="col-sm-2 control-label">City</label>
                    <div class="col-sm-4">
                    <form:input onblur="validate(\"city\",/^[a-zA-Z]{2,}$/)" path="city" class="form-control" id="city" /> 
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

