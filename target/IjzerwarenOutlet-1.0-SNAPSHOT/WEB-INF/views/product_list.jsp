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
                                                <input type="checkbox">Ijzer
                                            </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--                    Category end-->
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
                    <!-- When there are users, the will be shown below -->

                    <c:forEach var="product" items="${products}">
              <div class=" col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="https://dl.dropboxusercontent.com/u/35106986/img/${product.picture}" data-src="holder.js/200x200" alt="...">
      <div class="caption">
        <h3>${product.name}</h3>
        <p>${product.description}</p>
        <h3><span class="oldPrice">&euro;${product.chosenPrice*2}</span><br>&euro;${product.chosenPrice}</h3>
        <p><a href="#" class="btn btn-default" role="button">Check stock</a> <a href="#" class="btn btn-primary" role="button">Add to cart</a></p>
      </div>
    </div>
  </div>
                                  </c:forEach>


                </c:when>
                                        <c:otherwise>
                                            
<div class="panel panel-default col-sm-9 col-md-9">
  <h1>Sorry, no products were found.</h1>
  <p>Please try again later.</p>
        <c:if test="${currentUser != null}">
            <c:if test="${currentUser.permissionLevel > 1}">
                <p><a href="${pageContext.request.contextPath}/product/add" class="btn btn-lg btn-primary">Add product</a></p>
        </c:if>
        </c:if>
</div>
                        
                    </c:otherwise>
            </c:choose>
                    <div class="row"></div>
                        <a href="${pageContext.request.contextPath}/product/table" class="clearfix btn btn-sm btn-primary">List View</a>
        <c:if test="${currentUser != null}">
            <c:if test="${currentUser.permissionLevel > 2}">
        <a href="${pageContext.request.contextPath}/product/add" class="btn btn-sm btn-primary">Add product</a>
        </c:if>
        </c:if>
        <t:footer/>
    </jsp:body>
</t:menu>
