<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:menu>
    <jsp:body>
        <t:title_and_message/>
        <!--Javascript menu activator-->
        <script>activeMenu("about_us");</script>
        <t:footer/>
    </jsp:body>
</t:menu>
