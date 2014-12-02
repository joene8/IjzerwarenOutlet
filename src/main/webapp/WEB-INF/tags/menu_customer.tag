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
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
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
                            <li>
                                <a href="${pageContext.request.contextPath}/product/list">Show Products</a>
                            </li>
                            
                            <li>
                                <a href="${pageContext.request.contextPath}/timelog/list">Show User Logs</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">STIHO Groep<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="http://www.stiho.nl/">Stiho</a></li>
                                    <li><a href="http://www.giebels.nl/">Giebels</a></li>
                                    <li><a href="http://www.baars-bloemhoff.nl/">Baars & Bloemhoff</a></li>
                                    <li><a href="http://www.bouwmaat.nl/">Bouwmaat</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/about_us">About us</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/contact">Contact</a>
                            </li>
                            <form:form class="navbar-form navbar-left"  action="${pageContext.request.contextPath}/product/search"  method="GET" role="search">
                                <div class="form-group">
                                    <input type="text" id="search" name="search" class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                            </form:form>
                            <ul class="nav navbar-nav navbar-right">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${currentUser.firstName} <span class="caret"></span></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">My account</a></li>
                                                <li><a href="#">My order history</a></li>
                                                <li class="divider"></li>
                                                <li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>

                                    </ul>
                            </ul>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
