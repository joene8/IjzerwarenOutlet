<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
            <script type="text/javascript">
                $(document).ready(function ()
                {
                    $("#table").tablesorter();
                }
                );
            </script>
            <!--            Filter start-->
            <div class="col-sm-6 col-md-3">
                <!-- SearchBar start-->
                <div class="panel panel-default ">
                    <div class="panel-heading" role="tab" id="searchHeader">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#search" aria-expanded="false" aria-controls="search">
                                Search Bar&raquo;
                            </a>
                        </h4>
                    </div>
                    <div id="search" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="searchHeader">
                        <div class="panel-body">
                            <div class=" col-sm-3 col-md-2">
                                <form:form class="navbar-form navbar-left"  action="${pageContext.request.contextPath}/product/search"  method="GET" role="search">
                                <div class="form-group">
                                    <input type="text" id="search" name="search" class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SearchBar end-->
            <!--                    Category start-->
            <div class="panel panel-default ">
                <div class="panel-heading" role="tab" id="categoryHeader">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#category" aria-expanded="true" aria-controls="category">
                            Category&raquo;
                        </a>
                    </h4>
                </div>
                <div id="category" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="categoryHeader">
                    <div class="panel-body">
                        <div class=" col-sm-3 col-md-2">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">Hout
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">Metaal
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">IJzer 
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--                    Category end-->
            <!--                    Establishment start-->
            <div class="panel panel-default ">
                <div class="panel-heading" role="tab" id="establishmentHeader">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#establishment" aria-expanded="false" aria-controls="establishment">
                            Establishment&raquo;
                        </a>
                    </h4>
                </div>
                <div id="establishment" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="establishmentHeader">
                    <div class="panel-body">
                        <div class=" col-sm-3 col-md-2">
                            <c:forEach var="establishment" items="${establishments}">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox">${establishment.name}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <!--                    Establishment end-->

            <!--                    Price start-->
            <div class="panel panel-default ">
                <div class="panel-heading" role="tab" id="priceHeader">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#price" aria-expanded="false" aria-controls="price">
                            Price&raquo;
                        </a>
                    </h4>
                </div>
                <div id="price" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="priceHeader">
                    <div class="panel-body">
                        <div class=" col-sm-3 col-md-2">
                            sdsds
                        </div>
                    </div>
                </div>
            </div>
            <!--                    Price end-->
        </div>
        <!--            Filter end-->
        <c:choose>
            <c:when test="${products.size() != 0}">
                <!-- When there are products, they will be shown below -->

                <c:forEach var="product" items="${products}">
                    <div class=" col-sm-6 col-md-3">
                        <div class="thumbnail">
                            <img src="https://dl.dropboxusercontent.com/u/35106986/img/${product.picture}" data-src="holder.js/200x200" alt="...">
                            <div class="caption">
                                <h3>${product.name}</h3>
                                <p>${product.description}</p>
                                <h3><span class="oldPrice">&euro;${product.chosenPrice*2}</span><br>&euro;${product.chosenPrice}</h3>
                                <p><a href="#" class="btn btn-default" role="button">Check stock</a> <a href="${pageContext.request.contextPath}/product/info/${product.id}" class="btn btn-primary" role="button">Add to cart</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${currentUser.permissionLevel == 3}">
                <div class="row"></div>
                <a href="${pageContext.request.contextPath}/product/table" class="clearfix btn btn-sm btn-primary">List View</a>
                <a href="${pageContext.request.contextPath}/product/add" class="btn btn-sm btn-primary">Add product</a>
            </c:when>
        </c:choose>
        <!--Javascript menu activator-->
        <script>activeMenu("products");</script>
        <t:footer/>
    </jsp:body>
</t:menu>
