<%-- 
    Document   : genericPage
    Created on : Oct 13, 2014, 12:51:56 PM
    Author     : dervos
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@tag description="menu" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<html>
    <head>
        <t:head/>
    </head>

    <body>
        <div id="header">
            <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/index">IJzerwaren outlet</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li id="products">
                                <a href="${pageContext.request.contextPath}/product/table">Products</a>
                            </li>
                        </ul>
                        <!--Account begin-->
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${currentUser.firstName} <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="${pageContext.request.contextPath}/user/view/${currentUser.id}">My account</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>

                                </ul>
                        </ul>
                        <!--Account end-->

                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>