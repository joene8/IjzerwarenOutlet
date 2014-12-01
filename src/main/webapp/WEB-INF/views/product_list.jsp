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
            
             <div class="panel panel-default">
  <div class="panel-body">
    <div class="row">
    <div class=" col-sm-3 col-md-2">
        <p>Category A</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
        <a href=""><p>Example 5</p></a>
        <a href=""><p>Example 6</p></a>
        <a href=""><p>Example 7</p></a>
    </div>
        <div class=" col-sm-3 col-md-2">
        <p>Category B</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
    </div>
        <div class=" col-sm-3 col-md-2">
        <p>Category C</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
        <a href=""><p>Example 5</p></a>
    </div>
        <div class=" col-sm-3 col-md-2">
        <p>Category D</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
        <a href=""><p>Example 5</p></a>
    </div>
        <div class=" col-sm-3 col-md-2">
        <p>Category E</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
    </div>
        <div class=" col-sm-3 col-md-2">
        <p>Category F</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
        <a href=""><p>Example 5</p></a>
    </div>
</div>
<div class="row">
        <div class=" col-sm-3 col-md-2">
        <p>Category G</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
        <a href=""><p>Example 5</p></a>
        <a href=""><p>Example 6</p></a>
    </div>
            <div class=" col-sm-3 col-md-2">
        <p>Category H</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
        <a href=""><p>Example 5</p></a>
        <a href=""><p>Example 6</p></a>
    </div>
            <div class=" col-sm-3 col-md-2">
        <p>Category I</p>
        <a href=""><p>Example 1</p></a>
        <a href=""><p>Example 2</p></a>
        <a href=""><p>Example 3</p></a>
        <a href=""><p>Example 4</p></a>
        <a href=""><p>Example 5</p></a>
        <a href=""><p>Example 6</p></a>
        <a href=""><p>Example 7</p></a>
    </div>
</div>



  </div>
</div>
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
            </c:choose>
                    <div class="row"></div>
                        <a href="${pageContext.request.contextPath}/product/table" class="clearfix btn btn-xs btn-primary">List View</a>
        <t:footer/>
    </jsp:body>
</t:menu>
