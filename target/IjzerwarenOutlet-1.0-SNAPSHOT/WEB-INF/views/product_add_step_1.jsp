<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:menu>
    <jsp:body>
        <t:title_and_message/>
        <div class="panel panel-default">
            <div class="panel-body">
                <!-- Form begin -->
                <form:form method="POST" class="form-horizontal" role="itemNumber" action="${pageContext.request.contextPath}/product/add_step_1">  
                    <div class="form-group">
                        <label for="itemNumber" class="col-sm-2 control-label">Item number</label>
                        <div class="col-sm-3">
                             <input type="number" id="itemNumber" name="itemNumber" class="form-control">
                        </div>
                        <div class="col-sm-3">
                        <button type="submit" class="btn btn-primary">Find product</button>
                        </div>
                    </div>
                </form:form>
                <!-- Form end -->
            </div>
        </div>
                <!--Javascript menu activator-->
        <script>activeMenu("products");</script>
        <t:footer/>
    </jsp:body>
</t:menu>
