<%-- 
    Document   : establishment_add_edit_view.jsp
    Author     : Deva Vrijma
--%>

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


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:menu>
    <jsp:body>
        <t:title_and_message/>
                <div class="panel panel-default">
            <div class="panel-body">
        <form:form method="POST" class="form-horizontal" role="form" commandName="establishment" action="${pageContext.request.contextPath}/establishment/${addEditOrView}">

            <!--Name start-->
            <div id="field_name" class="form-group <c:if test="${errorName}">has-error</c:if>">
                    <label for="name" class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-3">
                    <c:choose>
                        <c:when test="${addEditOrView eq 'view'}">
                            <p class="form-control-static">${establishment.name}</p>
                        </c:when>
                        <c:otherwise>
                            <form:input required="required" onblur="validate(\"name\",/^[a-zA-Z]{2,}$/)" path="name" class="form-control" id="name" /> 
                            <span id="glyph_name" class=""></span>
                            <c:if test="${errorLastName}"><span class="help-block">Must be at least 2 characters long.</span></c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!--Name end-->

            <!--Street name start-->
            <div id="field_streetName" class="form-group <c:if test="${errorStreetName}">has-error</c:if>">
                    <label for="streetName" class="col-sm-3 control-label">Street name</label>
                    <div class="col-sm-3">
                    <c:choose>
                        <c:when test="${addEditOrView eq 'view'}">
                            <p class="form-control-static">${establishment.streetName}</p>
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
                        <c:when test="${addEditOrView eq 'view'}">
                            <p class="form-control-static">${establishment.streetNumber}</p>
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
                        <c:when test="${addEditOrView eq 'view'}">
                            <p class="form-control-static">${establishment.streetNumberSuffix}</p>
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
                        <c:when test="${addEditOrView eq 'view'}">
                            <p class="form-control-static">${establishment.postalCode}</p>
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
                        <c:when test="${addEditOrView eq 'view'}">
                            <p class="form-control-static">${establishment.city}</p>
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
                        <c:when test="${addEditOrView eq 'view'}">
                            <p class="form-control-static">${establishment.phoneNumber}</p>
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


            <!--Submit button start-->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <c:choose>
                        <c:when test="${addEditOrView eq 'edit'}">
                            <form:hidden path="id" value="${establishment.id}"/>
                            <a href="${pageContext.request.contextPath}/establishment/view/${establishment.id}" class="btn btn-default">Cancel</a>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </c:when>
                        <c:when test="${addEditOrView eq 'view'}">
                            <a href="${pageContext.request.contextPath}/establishment/list" class="btn btn-default">Back</a>
                            <a href="${pageContext.request.contextPath}/establishment/edit/${establishment.id}" class="btn btn-primary">Edit information</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/establishment/list" class="btn btn-default">Cancel</a>
                            <button type="submit" class="btn btn-primary">Create establishment</button>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <!--Submit button end-->

        </form:form>
            </div>
                </div>
                        <!--Javascript menu activator-->
        <script>activeMenu("establishments");</script>
                    <t:footer/>
    </jsp:body>
</t:menu>

