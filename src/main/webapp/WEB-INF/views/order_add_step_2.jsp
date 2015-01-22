<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<script>
    function checkDelivery() {
        var buttons = document.getElementsByName("delivery");
        if(buttons[0].checked){
            if(document.getElementById("delivery").value === "false"){
                document.getElementById("hidden").style.visibility = "visible";
            }else if(document.getElementById("delivery").value === "true"){
                document.getElementById("hidden2").style.visibility = "visible";
            }    
        } else {
            document.getElementById("hidden").style.visibility = "hidden";
        }
    }
</script>-->
<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form:form method="POST" class="form-horizontal" role="form" commandName="itemOrder" action="${pageContext.request.contextPath}/itemOrder/add_step_2">  

                        <div id="field_delivery" class="form-group">
                            <label for="delivery" class="col-sm-2 control-label"><c:if test="${errorDelivery}"></c:if>Method of delivery:</label>
                            <div class="col-sm-4">
                                <br>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary">
                                    <form:radiobutton name="delivery" path="delivery" value="false"/>Pickup</label>
                                    <label class="btn btn-primary active">
                                    <form:radiobutton name="delivery" path="delivery" value="true"/>Delivery</label>
                                </div>
                                
                                <br>
                            </div>
                        </div>
                                        
                        <!--<div id="hidden" style="visibility:hidden;">-->        

                        <!--Destination start-->
                        <div id="field_Destination" class="form-group <c:if test="${errorDestination}">has-error</c:if>">
                                <label for="Destination" class="col-sm-2 control-label">Destination</label>
                                <div class="col-sm-4">
                                <form:select path="Destination" class="form-control" name="Destination">
                                    <c:forEach var="establishment" items="${establishments}">
                                        <option value="${establishment.id}">${establishment.name}</option>
                                    </c:forEach>    
                                </form:select>
                                
                            </div>
                        </div>
                        <!--Destination end-->


<!--                        </div>

                        <div id="hidden2" style="visibility:hidden;">-->

                            <div id="field_Destination" class="form-group <c:if test="${errorDestination}">has-error</c:if>">
                            <label for="Destination" class="col-sm-2 control-label">Destination</label>
                                <div class="col-sm-4">
                                    <p class="form-control-static">${currentUser.city}</p>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">Continue</button>
                                </div>

                            </div>            
                        <!--</div>-->
                    </form:form>
                </div>
            </div>    
        <t:footer/>
    </jsp:body>
</t:menu>