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
                <c:if test="${currentUser==null}">
                 <div class ="col-sm-3">    
                    Would you like to <a href="${pageContext.request.contextPath}/user/login">Login</a>?<br>    
                    

                    Or would you like to continue?<br>
                    
                    <button onblur="checkButton()" name="button" path="button" class="btn btn-primary">Continue</button>
                    
                </div>
                </c:if>
                <form:form method="POST" class="form-horizontal" role="form" commandName="itemOrder" action="${pageContext.request.contextPath}/itemOrder/add_step_1">                    
                            <div id="hidden" style="visibility:hidden;">
                                
                                <!--first name start-->
                                <div id="field_firstName" class="form-group <c:if test="${nameError}">has-error</c:if>">
                                    <label for="firstName" class="col-sm-2 control-label">First name</label>
                                    <div class="col-sm-3">
                                    <c:choose>
                                        <c:when test="${currentUser != null}">
                                            <p class="form-control-static">${currentUser.firstName}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <form:input  required="required"  onblur="validate(\"firstName\",/^[a-zA-Z]{2,}$/)" path="firstName" class="form-control" id="firstName" />
                                            <span id="glyph_firstName" class=""></span>
                                            <c:if test="${errorFirstName}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                        </c:otherwise>
                                        
                                    </c:choose>    
                                    </div>
                                </div>
                                <!--first name end-->
                                
                                <!--last name start-->
                                <div id="field_lastName" class="form-group <c:if test="${nameError}">has-error</c:if>">
                                    <label for="lastName" class="col-sm-2 control-label">Last name</label>
                                    <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${currentUser.lastName}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input  required="required"  onblur="validate(\"lastName\",/^[a-zA-Z]{2,}$/)" path="lastName" class="form-control" id="lastName" />
                                                <span id="glyph_lastName" class=""></span>
                                                <c:if test="${errorFirstName}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                            </c:otherwise>                                            
                                        </c:choose>
                                    </div>
                                </div>
                                <!--last name end-->
                                
                                <!--Email start-->
                                <div id="field_email" class="form-group <c:if test="${errorEmail}">has-error</c:if>">
                                    <label for="email" class="col-sm-3 control-label">Email</label>
                                    <div class="col-sm-3">        
                                        <c:choose>    
                                            <c:when test="${currentUser != null}">
                                                    <p class="form-control-static">${currentUser.email}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input  required="required"  onblur="validate(\"email\",/^[\\w.-]+@\\w+\\.[\\w.-]{2,}$/)" path="email" class="form-control" id="email" />
                                                <span id="glyph_email" class=""></span>
                                                <c:if test="${errorEmail}"><span class="help-block">Must be a correct email.</span></c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <!--Email end-->

                                <!--Street name start-->
                                <div id="field_streetName" class="form-group <c:if test="${streetNameError}">has-error</c:if>">
                                    <label for="streetName" class="col-sm-2 control-label">Street name</label>
                                    <div class="col-sm-3">
                                        <c:choose>    
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${currentUser.streetName}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input  required="required"  onblur="validate(\"streetName\",/^[a-zA-Z .']{2,}$/)" path="streetName" class="form-control" id="streetName" />
                                                <span id="glyph_streetName" class=""></span>
                                                <c:if test="${errorStreetName}"><span class="help-block">Must be at least two characters long.</span></c:if>
                                            </c:otherwise>
                                        </c:choose>                                            
                                    </div>
                                </div>
                                <!--Street name end-->

                                <!--Street number start-->
                                <div id="field_streetNumber" class="form-group <c:if test="${streetNumberError}">has-error</c:if>">
                                    <label for="streetNumber" class="col-sm-2 control-label">Street number</label>
                                    <div class="col-sm-3">
                                        <c:choose>
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${currentUser.streetNumber}</p>
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
                                <div id="field_streetNumberSuffix" class="form-group <c:if test="${streetNumberSuffixError}">has-error</c:if>">
                                    <label for="streetNumberSuffix" class="col-sm-2 control-label">Street number suffix</label>
                                    <div class="col-sm-3">
                                    <c:choose>
                                        <c:when test="${currentUser != null}">
                                            <p class="form-control-static">${currentUser.streetNumberSuffix}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <form:input required="required" type="number" onblur="validate(\"streetNumberSuffix\",/^.*$/)" path="streetNumberSuffix" class="form-control" id="streetNumberSuffix" /> 
                                            <span id="glyph_streetNumberSuffix" class=""></span>
                                            <c:if test="${errorStreetNumberSuffix}"><span class="help-block">Must be a valid number.</span></c:if>
                                        </c:otherwise>                                        
                                    </c:choose>    
                                    </div>
                                </div>
                                <!--Street number suffix end-->

                                <!--Postal code start-->
                                <div id="field_postalCode" class="form-group <c:if test="${ErrorPostalCode}">has-error</c:if>">
                                    <label for="postalCode" class="col-sm-2 control-label">Postal code</label>
                                    <div class="col-sm-3">
                                        <c:choose>    
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${currentUser.postalCode}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input  required="required"  onblur="validate(\"postalCode\",/^\\d{4} ?[a-zA-Z]{2}/)" placeholder="1234AB" path="postalCode" class="form-control" id="postalCode" />
                                                <span id="glyph_postalCode" class=""></span>
                                                <c:if test="${errorPostalCode}"><span class="help-block">Must have 4 numbers and 2 letters.</span></c:if>
                                            </c:otherwise>
                                            
                                        </c:choose>    
                                    </div>
                                </div>
                                <!--Postal code end-->

                                <!--City start-->
                                <div id="field_city" class="form-group <c:if test="${cityError}">has-error</c:if>">
                                    <label for="city" class="col-sm-2 control-label">City</label>
                                    <div class="col-sm-3">
                                        <c:choose>    
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${currentUser.city}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input  required="required"  onblur="validate(\"city\",/^[a-zA-Z .']{2,}$/)" path="city" class="form-control" id="city" />
                                                <span id="glyph_city" class=""></span>
                                                <c:if test="${errorCity}"><span class="help-block">Must be at least 2 characters long.</span></c:if>
                                            </c:otherwise>
                                            
                                        </c:choose>        
                                    </div>
                                </div>
                                <!--City end-->

                                <!--Phone number start-->
                                <div id="field_phoneNumber" class="form-group <c:if test="${errorPhoneNumber}">has-error</c:if>">
                                    <label for="phoneNumber" class="col-sm-2 control-label">Phone number</label>
                                    <div class="col-sm-3">
                                        <c:choose>    
                                            <c:when test="${currentUser != null}">
                                                <p class="form-control-static">${currentUser.phoneNumber}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <form:input required="required" type="number" onblur="validate(\"phoneNumber\",/^0\\d{9}$/)" path="phoneNumber" class="form-control" id="phoneNumber" /> 
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

