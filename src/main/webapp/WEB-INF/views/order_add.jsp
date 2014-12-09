<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<script>
    function checkDelivery() {
        var buttons = document.getElementsByName("delivery");
        if(buttons[0].checked){
        document.getElementById("hidden").style.visibility = "visible";
    } else {
        document.getElementById("hidden").style.visibility = "hidden";
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
                </c:if>
                <form:form method="POST" class="form-horizontal" role="form" commandName="order" action="${pageContext.request.contextPath}/order/create">
                    
                        
                    <div id="field_addition" class="form-group">
                        <label for="addition" class="col-sm-2 control-label"><c:if test="${errorAddition}"></c:if>What method of delivery would you like to have?</label>
                        <div class="col-sm-4">
                        
                      
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary">
                                <form:radiobutton onchange="checkDelivery()" name="delivery" path="delivery" value="pickup"/>Pickup</label>
                                    <label class="btn btn-primary active">
                                <form:radiobutton onchange="checkDelivery()" name="delivery" path="delivery" value="delivery"/>Delivery</label>
                            </div>    
                        </div>
                    </div>
                    
                            <div id="hidden" style="visibility:hidden;">
                                
                            </div>        
                            
                </form:form>    
            </div>
        </div>
                        <!--Javascript menu activator-->
        <script>activeMenu("NAME_OF_THE_ACTIVE_TAB_GOES_HERE");</script>
        <t:footer/>
    </jsp:body>
</t:menu>

