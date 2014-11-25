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
                                <a href="${pageContext.request.contextPath}/product/add">Add Product</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/establishment/add">Add Establishment</a>
                            </li>
                            <form:form class="navbar-form navbar-left"  action="${pageContext.request.contextPath}/product/search"  method="GET" role="search">
                                <div class="form-group">
                                    <input type="text" id="search" name="search" class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                            </form:form>
                            <ul class="nav navbar-nav navbar-right">
                                <c:choose>
                                    <c:when test="${not empty currentUser}">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${currentUser.name} <span class="caret"></span></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="${pageContext.request.contextPath}/user/account">My account</a></li>
                                                <li><a href="#">My order history</a></li>
                                                <li class="divider"></li>
                                                <li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/user/login">Login</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/user/register">Register</a>
                                                </li>
                                            </c:otherwise>

                                        </c:choose>

                                    </ul>
                            </ul>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

