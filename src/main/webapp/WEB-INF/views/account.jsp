<%-- 
    Document   : account
    Created on : Nov 25, 2014, 2:12:49 PM
    Author     : Erik
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:menu>
    <jsp:body>
        <t:title_and_message/>
            <form:form method="GET" class="form-horizontal" role="form" commandName="user" action="${pageContext.request.contextPath}/user/account">
                <div id="field_firstName" class="form-group">
                    <label for="firstName" class="col-sm-2 control-label">First name</label>
                    <p><c:choose> <${user.firstName} </c:choose></p>
                </div>

                <div id="field_lastName" class="form-group">
                    <label for="lastName" class="col-sm-2 control-label">Last name</label>  
                    <p><c:choose> <${user.lastName} </c:choose></p>
                </div>

                <div id="field_email" class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <p><c:choose> <${user.email} </c:choose></p>
                </div>

                <div id="field_streetName" class="form-group">
                    <label for="streetName" class="col-sm-2 control-label">Street name</label>
                    <p><c:choose> <${user.streetName} </c:choose></p>
                </div>

                <div id="field_streetNumber" class="form-group">
                    <label for="streetNumber" class="col-sm-2 control-label">Street number</label>
                    <p><c:choose> <${user.streetNumber} </c:choose></p>
                </div>

                <div id="field_streetNumberSuffix" class="form-group">
                    <label for="streetNumberSuffix" class="col-sm-2 control-label">Street number suffix</label>
                    <p><c:choose> <${user.streetNumberSuffix} </c:choose></p>
                </div>

                <div id="field_postalCode" class="form-group">
                    <label for="postalCode" class="col-sm-2 control-label">Postal code</label>   
                    <p><c:choose> <${user.postalCode} </c:choose></p>
                </div>

                <div id="field_city" class="form-group">
                    <label for="city" class="col-sm-2 control-label">City</label>
                    <p><c:choose> <${user.city} </c:choose></p>
                </div>

                <div id="field_phoneNumber" class="form-group">
                    <label for="phoneNumber" class="col-sm-2 control-label">Phone number</label>
                    <p><c:choose> <${user.phoneNumber} </c:choose></p>
                </div>

                <div id="field_password"class="form-group">
                    <label for="password" class="col-sm-2 control-label">Password</label>
                    <p><c:choose> <${user.password} </c:choose></p>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Edit</button>
                    </div>
                </div>    
            </form:form>
        <t:footer/>
    </jsp:body>
</t:menu>

