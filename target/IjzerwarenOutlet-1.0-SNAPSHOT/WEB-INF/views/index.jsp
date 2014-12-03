<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:menu>
    <jsp:body>
        <t:title_and_message/>
<!-- Button trigger modal -->
<div class="jumbotron panel-default">
  <h1>Welcome to IJzerwarenOutlet</h1>
  <p>This site offers top quality products for affordable prices. Quickly check our products to see what we have to offer!</p>
  <p><a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/product/list" role="button">Products</a></p>
</div>

        <t:footer/>
    </jsp:body>
</t:menu>

