
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<script type="text/javascript">
    var checkflag = "false";
    function selectToggle(toggle, form) {
        var myForm = document.forms[form];
        for (var i = 0; i < myForm.length; i++) {
            if (toggle) {
                myForm.elements[i].checked = "checked";
            }
            else {
                myForm.elements[i].checked = "";
            }
        }
    }

</script>

<t:menu>
    <jsp:body>
        <t:title_and_message></t:title_and_message>
            <head>
                <meta charset="utf-8" />
                <title>Multipl jQuery UI Datepicker in a HTML page</title>
                <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
                <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
                <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
                <link rel="stylesheet" href="/resources/demos/style.css" />

                <style>
                    .datepicker{
                    }
                </style>

                <script>
    $(function () {
        $(".datepicker").datepicker();
    });
                </script>
            </head>

            <div class="panel panel-default">
                <div class="panel-body">
                    <script type="text/javascript">
                        $(document).ready(function ()
                        {
                            $("#table").tablesorter();
                        }
                        );
                    </script>

                    <table id="table" class="table table-striped table-hover">

                        <form action="${pageContext.request.contextPath}/timelog/search" method="GET" role="search">
                        Custom Range Login Date
                        From <input type="text" placeholder="mm/dd/yyyy" value="${fromDate}" id="fromDate" name="fromDate" class="datepicker" />
                        To <input type="text" placeholder="mm/dd/yyyy" value="${toDate}" id="toDate" name="toDate" class="datepicker"  />
                        <button type="submit" class="btn btn-default">Go</button>
                    </form>

                    <thead>
                        <tr>
                            <th>
                            </th>
                            <th>
                                ID <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Login <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Logout <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                Duration <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th>
                                User ID <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </th>
                            <th></th>

                        </tr>
                    </thead>
                    <form name="checkbox" action="${pageContext.request.contextPath}/timelog/selection">

                        <tbody>
                            <c:choose>
                                <c:when test="${timelogs.size() != 0}">
                                    <!-- for each user a new row is added-->
                                    <c:forEach var="timelog" items="${timelogs}">
                                        <tr>
                                            <td><input type="checkbox" name="selection" value=${timelog.id}></td>
                                            <td>${timelog.id}</td>
                                            <td>${timelog.login}</td>
                                            <td>${timelog.logout}</td>
                                            <td>${timelog.duration}</td>
                                            <td>${timelog.user.id}</td>
                                            <td>  <a href="${pageContext.request.contextPath}/timelog/delete/${timelog.id}" class="btn btn-xs btn-danger">Delete</a></td>

                                        </tr>
                                    </c:forEach>

                                </c:when>
                            </c:choose>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="7"><em>Total Logs:  ${timelogs.size()}</em></td>
                            </tr>
                        </tfoot>

                        <br/><INPUT TYPE="SUBMIT" class="btn btn-sm btn-danger" VALUE="Delete Selection">
                        Select <a class="btn btn-xs btn-default" href="javascript:selectToggle(true, 'checkbox');">All</a> | <a class="btn btn-xs btn-default" href="javascript:selectToggle(false, 'checkbox');">None</a><p>
                    </form>
                </table>
            </div>
        </div>
        <!--Javascript menu activator-->
        <script>activeMenu("timelogs");</script>
        <t:footer/>
    </jsp:body>
</t:menu>
