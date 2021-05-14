<%-- 
    Document   : my-complains
    Created on : May 12, 2021, 1:47:54 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("admin_id") == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="db.DBConnection"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <title>Knowledge Q&A Dashboard Template</title>
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

        <!-- =-=-=-=-=-=-= Main Area =-=-=-=-=-=-= -->
        <div class="main-content-area">

            <!-- =-=-=-=-=-=-= Page Breadcrumb =-=-=-=-=-=-= -->
            <section class="page-title">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                            <h1>My Complains</h1>
                        </div>
                        <!-- end col -->
                        <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                            <div class="bread">
                                <ol class="breadcrumb">
                                    <li><a href="#">Home</a>
                                    </li>
                                    <%--                <li><a href="#">Pages</a>--%>
                                    <%--                </li>--%>
                                    <li class="active">My Complains</li>
                                </ol>
                            </div>
                            <!-- end bread -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end container -->
            </section>

            <!-- =-=-=-=-=-=-= Page Breadcrumb End =-=-=-=-=-=-= -->

            <section class="section-padding-80 white">

                <div class="container"> 

                    <!-- Row -->
                    <div class="row">
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            
                            <sql:setDataSource var="myDS" driver="<%= DBConnection.DB_DRIVER%>"
                            url="<%= DBConnection.DB_URL%>"
                            user="<%= DBConnection.DB_USERNAME%>"  password="<%= DBConnection.DB_PASSWORD%>"/>

                            <sql:query dataSource="${myDS}" var="complains">
                                SELECT * FROM complain WHERE active_status = 1 AND user_id = '${sessionScope.get("id")}';
                            </sql:query>

                            <c:forEach var="row" items="${complains.rows}">
                                <!-- Question Listing -->
                                <div class="listing-grid">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12  col-xs-12">
                                            <h3><a  href="#">${row.title}</a></h3>
                                            <div class="listing-meta">
                                                <span><i class="fa fa-clock-o" aria-hidden="true"></i>${row.date}</span>  
                                                <!--<span><i class="fa fa fa-eye" aria-hidden="true"></i>${row.ssn}</span>--> 
                                                <span><i class="fa fa fa-eye" aria-hidden="true"></i>${row.status}</span> 
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

                        </div>


                    </div>

                </div>

            </section>
            <!-- =-=-=-=-=-=-= User History End =-=-=-=-=-=-= -->



        </div>
        <!-- =-=-=-=-=-=-= Main Area End =-=-=-=-=-=-= -->

        <!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
        <%@include file="template/footer.jsp"%>


        <%@include file="template/scripts.jsp"%>
    </body>

</html>