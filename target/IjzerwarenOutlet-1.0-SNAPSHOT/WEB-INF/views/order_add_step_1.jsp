<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<script>
    function checkButton() {
        var buttons = document.getElementsByName("button");
        if (buttons[0].checked) {
            $("#hidden").slideDown(500);
        } else {
            $("#hidden").slideUp(500);
        }
    }
</script>

<t:menu>
    <jsp:body>
        <t:title_and_message/>
        <div class="panel panel-default">
            <div class="panel-body">
                <c:if test="${currentUser!=null}">
                Would you like to login?    
                <a href="${pageContext.request.contextPath}/user/login">Login</a>
                
                Or would you like to continue?
                <div class="col-sm-3">
                    <button onclick="checkButton()" name="button" path="button" class="btn btn-primary">Continue</button>
                </div>
                </c:if>
                <form:form method="POST" class="form-horizontal" role="form" commandName="itemOrder" action="${pageContext.request.contextPath}/itemOrder/add_step_1">
                    
                            <div id="hidden" style="visibility:hidden;">
                                
                                <!--first name start-->
                                <div id="field_firstName" class="form-group <c:if test="${nameError}">has-error</c:if>">
                                    <label for="firstName" class="col-sm-2 control-label">First name</label>
                                    <div class="col-sm-3">
                                        <c:if test="${currentUser != null}">
                                            <form:input path="firstName" onblur="validate(\"name\",/^[a-zA-Z]{2,}$/)" class="form-control" id="firstName" readonly="true" />
                                            <span id="glyph_name" class=""></span>
                                            <c:if test="${nameError}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                        <c:otherwise>
                                            <form:input  required="required"  onblur="validate(\"firstName\",/^[a-zA-Z]{2,}$/)" path="firstName" class="form-control" id="firstName" />
                                            <span id="glyph_firstName" class=""></span>
                                            <c:if test="${errorFirstName}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                        </c:otherwise>
                                        </c:if>
                                        
                                    </div>
                                </div>
                                <!--first name end-->
                                
                                <!--last name start-->
                                <div id="field_lastName" class="form-group <c:if test="${nameError}">has-error</c:if>">
                                    <label for="lastName" class="col-sm-2 control-label">Last name</label>
                                    <div class="col-sm-3">
                                        <c:if test="${currentUser != null}">
                                            <form:input path="lastName" onblur="validate(\"name\",/^[a-zA-Z]{2,}$/)" class="form-control" id="lastName" readonly="true" />
                                            <span id="glyph_lastName" class=""></span>
                                            <c:if test="${nameError}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                        <c:otherwise>
                                            <form:input  required="required"  onblur="validate(\"lastName\",/^[a-zA-Z]{2,}$/)" path="lastName" class="form-control" id="lastName" />
                                            <span id="glyph_lastName" class=""></span>
                                            <c:if test="${errorFirstName}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                        </c:otherwise>
                                        </c:if>
                                        
                                    </div>
                                </div>
                                <!--last name end-->
                                
                                <!--Email start-->
                                <div id="field_email" class="form-group <c:if test="${errorEmail}">has-error</c:if>">
                                    <label for="email" class="col-sm-3 control-label">Email</label>
                                    <div class="col-sm-3">
                                    <c:choose>
                                        <c:when test="${currentUser != null}">
                                            <p class="form-control-static">${user.email}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <form:input type="email" required="required" onblur="validate(\"email\",/^[\\w.-]+@\\w+\\.[\\w.-]{2,}$/)" path="email" placeholder="someone@someplace.com" class="form-control" id="email" /> 
                                            <span id="glyph_email" class=""></span>
                                            <c:if test="${errorEmail}"><span class="help-block">Must be a correct email.</span></c:if>
                                        </c:otherwise>
                                    </c:choose>
                                    </div>
                                </div>
                                <!--Email end-->

                                <!--Street name start-->
                                <div id="field_streetName" class="form-group <c:if test="${errorStreetName}">has-error</c:if>">
                                        <label for="streetName" class="col-sm-3 control-label">Street name</label>
                                        <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${user.streetName}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input required="required" onblur="validate(\"streetName\",/^[a-zA-Z .']{2,}$/)" path="streetName" class="form-control" id="streetName" /> 
                                                <span id="glyph_streetName" class=""></span>
                                                <c:if test="${errorStreetName}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!--Street name end-->

                                <!--Street number start-->
                                <div id="field_streetNumber" class="form-group <c:if test="${errorStreetNumber}">has-error</c:if>">
                                        <label for="streetNumber" class="col-sm-3 control-label">Street number</label>
                                        <div class="col-sm-2">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${user.streetNumber}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input required="required" type="number" onblur="validate(\"streetNumber\",/^\\d{1,}$/)" path="streetNumber" class="form-control" id="streetNumber" /> 
                                                <span id="glyph_streetNumber" class=""></span>
                                                <c:if test="${errorStreetNumber}"><span class="help-block">Must be a valid number.</span></c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!--Street number end-->

                                <!--Street number suffix start-->
                                <div id="field_streetNumberSuffix" class="form-group">
                                    <label for="streetNumberSuffix" class="col-sm-3 control-label">Suffix</label>
                                    <div class="col-sm-2">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${user.streetNumberSuffix}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input onblur="validate(\"streetNumberSuffix\",/^.*$/)" path="streetNumberSuffix" class="form-control" id="streetNumberSuffix" />
                                                <span id="glyph_streetNumberSuffix" class=""></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!--Street number suffix end-->

                                <!--Postal code start-->
                                <div id="field_postalCode" class="form-group <c:if test="${errorPostalCode}">has-error</c:if>">
                                        <label for="postalCode" class="col-sm-3 control-label">Postal code</label>
                                        <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${user.postalCode}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input required="required" onblur="validate(\"postalCode\",/^\\d{4} ?[a-zA-Z]{2}/)" path="postalCode" placeholder="1234AB" class="form-control" id="postalCode" /> 
                                                <c:if test="${errorPostalCode}"><span class="help-block">Must have 4 numbers and 2 letters.</span></c:if>
                                                    <span id="glyph_postalCode" class=""></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!--Postal code end-->

                                <!--City start-->
                                <div id="field_city" class="form-group <c:if test="${errorCity}">has-error</c:if>">
                                        <label for="city" class="col-sm-3 control-label">City</label>
                                        <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${user.city}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input required="required"  onblur="validate(\"city\",/^[a-zA-Z .']{2,}$/)" path="city" class="form-control" id="city" /> 
                                                <span id="glyph_city" class=""></span>
                                                <c:if test="${errorCity}"><span class="help-block">Must be at least 2 characters long.</span></c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!--City end-->

                                <!--Phone number start-->
                                <div id="field_phoneNumber" class="form-group <c:if test="${errorPhoneNumber}">has-error</c:if>">
                                        <label for="phoneNumber" class="col-sm-3 control-label">Phone number</label>
                                        <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${user.phoneNumber}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input required="required" onblur="validate(\"phoneNumber\",/^0\\d{9}$/)" type="number" path="phoneNumber" placeholder="0612345678" class="form-control" id="phoneNumber" /> 
                                                <span id="glyph_phoneNumber" class=""></span>
                                                <c:if test="${errorPhoneNumber}"><span class="help-block">Must have 10 digits.</span></c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!--Phone number end-->

                                <div class="col-sm-3">
                                    <button type="submit" class="btn btn-primary">Continue</button>
                                </div>
                                    
                            </div>        
                            
                </form:form>    
            </div>
        </div>
                        <!--Javascript menu activator-->
        <!--<script>activeMenu("products");</script>-->
        <t:footer/>
    </jsp:body>
</t:menu>

