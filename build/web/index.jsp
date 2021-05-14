<%-- 
    Document   : index
    Created on : May 11, 2021, 10:45:56 AM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="db.DBConnection" %>

<!DOCTYPE html>
<html lang="en">


<head>

    <title>Cyber Crime</title>
    <%@include file="template/header.jsp" %>

</head>

<body>


<!-- =-=-=-=-=-=-= PRELOADER =-=-=-=-=-=-= -->
<div class="preloader"><span class="preloader-gif"></span>
</div>


<!-- =-=-=-=-=-=-= HEADER =-=-=-=-=-=-= -->
<%@include file="template/topbar.jsp" %>
<!-- =-=-=-=-=-=-= HEADER Navigation =-=-=-=-=-=-= -->
<%@include file="template/navigation.jsp" %>
<!-- HEADER Navigation End -->


<!-- =-=-=-=-=-=-= HOME =-=-=-=-=-=-= -->
<div class="full-section search-section">
    <div class="search-area container">
        <h3 class="search-title">Have a Question?</h3>
        <p class="search-tag-line">If you have any question you can ask below or enter what you are looking for!</p>
        <form autocomplete="off" method="get" class="search-form clearfix" id="search-form" action="index.jsp">
            <input type="text" title="* Please enter a search term!" name="keyword"
                   placeholder="Type your search terms here"
                   class="search-term " autocomplete="off">
            <input type="submit" value="Search" class="search-btn">
        </form>
    </div>
</div>
<!-- =-=-=-=-=-=-= HOME END =-=-=-=-=-=-= -->
<!-- =-=-=-=-=-=-= Main Area =-=-=-=-=-=-= -->
<div class="main-content-area">
    <!-- =-=-=-=-=-=-= Latest Questions  =-=-=-=-=-=-= -->
    <section class="white question-tabs padding-bottom-80" id="latest-post">
        <div class="container">
            <div class="row">
                <!-- Content Area Bar -->
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <br/>
                    <br/>
                    <div class="panel-body">


                        <c:if test="<%= request.getParameter("keyword") != null%>">

                            <sql:setDataSource var="myDS" driver="<%= DBConnection.DB_DRIVER%>"
                                               url="<%= DBConnection.DB_URL%>"
                                               user="<%= DBConnection.DB_USERNAME%>"
                                               password="<%= DBConnection.DB_PASSWORD%>"/>

                            <sql:query dataSource="${myDS}" var="complains">
                                SELECT * FROM  complain INNER JOIN `user` WHERE `complain`.user_id = `user`.id  AND `complain`.`status` = "Recovered" AND title LIKE '<%=request.getParameter("keyword") %>%';
                            </sql:query>

                            <c:forEach var="row" items="${complains.rows}">
                                <!-- Question Listing -->
                                <div class="listing-grid">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12  col-xs-12">
                                            <h3><a href="#">${row.title}</a></h3>
                                            <div class="listing-meta">
                                                <span><i class="fa fa-clock-o" aria-hidden="true"></i>${row.date}</span>
                                                <!--<span><i class="fa fa fa-eye" aria-hidden="true"></i>${row.ssn}</span>-->
                                                <span><i class="fa fa fa-eye"
                                                         aria-hidden="true"></i>${row.status}</span>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-sm-12  col-xs-12">
                                            <p>${row.description}</p>
                                            <div class="pull-right tagcloud">
                                                <a href="">${row.category}</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- Question Listing End -->
                            </c:forEach>

                        </c:if>

                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
</div>
<!-- end container -->
</section>
<!-- =-=-=-=-=-=-= Latest Questions  End =-=-=-=-=-=-= -->


</div>
<!-- =-=-=-=-=-=-= Main Area End =-=-=-=-=-=-= -->

<!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
<%@include file="template/footer.jsp" %>


<%@include file="template/scripts.jsp" %>
</body>


</html>