<%@page import="com.springmvc.model.Item"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:menu>
    <jsp:body>

        <c:choose>
            <c:when test="${currentEstablishment == null}">
                <div class="panel panel-gray" id="title">
                    <div class="panel-heading">
                        <span class="pageTitle">Choose an Establishment</span>
                    </div>
                    <div class="panel-body">
                        <span class="pageDescription">Please choose an establishment in order to see which products it offers</span><br>

                        <form action="${pageContext.request.contextPath}/product/establishment_products" method="POST">
                            <select id="choice" name="choice">
                                <c:forEach var="establishment" items="${establishments}">
                                    <option value="${establishment.id}">${establishment.name}</option>
                                </c:forEach>
                            </select>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>

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
                    <!--                    <div class="panel panel-default ">
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
                                        </div>-->
                    <!--                    Category end-->
                    <!--                    Price start-->
                    <!--                    <div class="panel panel-default ">
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
                                        </div>-->
                    <!--                    Price end-->
                    <!-- Switch from Establishment start -->
                    <div class="panel panel-default ">
                        <div class="panel-heading" role="tab" id="establishmentHeader">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" href="#establishment" aria-expanded="false" aria-controls="establishment">
                                    Change Establishment&raquo;
                                </a>
                            </h4>
                        </div>
                        <div id="establishment" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="establishmentHeader">
                            <div class="panel-body">
                                <a style ="color:red; font-size:11px">Attention: When you change establishment, your cart will be emptied!</a>
                                <form action="${pageContext.request.contextPath}/product/establishment_products" method="POST">
                                    <select id="choice" name="choice">
                                        <option value="${currentEstablishment}"></option>
                                        <c:forEach var="establishment" items="${establishments}">
                                            <option value="${establishment.id}">${establishment.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Switch from Establishment end -->
                </div>
                <!--            Filter end-->
                <c:choose>
                    <c:when test="${items.size() != 0}">
                        <!-- When there are products, they will be shown below -->

                        <c:forEach var="item" items="${items}">
                            <div class=" col-sm-6 col-md-3">
                                <div class="thumbnail">
                                    <img src="https://dl.dropboxusercontent.com/u/35106986/img/${item.product.picture}" data-src="holder.js/200x200" alt="...">
                                    <div class="caption">
                                        <h3>${item.product.name}</h3>
                                        <p>${item.product.description}</p>
                                        <p>${item.product.productNumber.categorie}</p>
                                        <p>${item.product.productLength}x${item.product.netWidth}x${item.product.netThickness} mm (LWH)</p>
                                       <p>${item.product.grossWeight} kg</p>
                                       
                                       
                                        <h3><span class="oldPrice">&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${item.product.standardSalePrice}" /></span>  
                                            <div style="font-size:12px">you save ${item.getDiscount()}%</div><br>
                                            <span>&euro;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${item.getActualPrice()}" /></span><c:if test="${item.isAddition()}">
                                                <span data-toggle="tooltip" data-placement="right" title="${item.getAdditionDescription()}"><img src="http://png-5.findicons.com/files/icons/1156/fugue/16/wrench_screwdriver.png"</span></c:if></h3>
                                        <p>Stock: ${item.stock}</p>
                                        <p><a href="${pageContext.request.contextPath}/cart/add/${item.id}" class="btn btn-primary" role="button" method="POST">Add to cart</a></p>
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
            </c:otherwise>
        </c:choose>
        <!--Javascript menu activator-->
        <script>activeMenu("products");</script>
        <t:footer/>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </jsp:body>
</t:menu>
