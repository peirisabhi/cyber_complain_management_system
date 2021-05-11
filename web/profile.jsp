<%-- 
    Document   : Profile
    Created on : May 11, 2021, 4:27:04 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                    <h1>Hello, ${sessionScope.get("name")}</h1>
                </div>
                <!-- end col -->
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a>
                            </li>
                            <%--                <li><a href="#">Pages</a>--%>
                            <%--                </li>--%>
                            <li class="active">My Account</li>
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

    <section class="section-padding-80" id="login">
        <div class="container">
            <div class="row mx-auto">
<%--                <div class="col-sm-6 col-md-4">--%>

<%--                    <div class="box-panel">--%>

<%--                        <form>--%>
<%--                            <div class="form-group">--%>
<%--                                <label>Upload Image</label>--%>
<%--                                <div class="input-group">--%>
<%--                    <span class="input-group-btn">--%>
<%--                <span class="btn btn-default btn-file">--%>
<%--                    Browse… <input type="file" id="imgInp">--%>
<%--                </span>--%>
<%--                    </span>--%>
<%--                                    <input type="text" class="form-control" readonly>--%>
<%--                                </div>--%>
<%--                                <img id="img-upload" src="images/1.jpg" alt=""/>--%>
<%--                            </div>--%>

<%--                            <button class="btn btn-primary btn-lg">Change Image</button>--%>

<%--                        </form>--%>

<%--                    </div>--%>
<%--                </div>--%>

                <div class="col-md-12">

                    <div class="box-panel">

                        <!-- form login -->
                        <form>
                            <div class="form-group">
                                <label>Full Name</label>
                                <input type="text" placeholder="Enter Your Name" value="${sessionScope.get("name")}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" placeholder="Your Email" value="${sessionScope.get("email")}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Contact No</label>
                                <input type="tel" placeholder="Your Email" value="${sessionScope.get("mobile")}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" placeholder="Your Password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input type="password" placeholder="Your Password" class="form-control">
                            </div>
<%--                            <div class="form-group">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-xs-12">--%>
<%--                                        <div class="checkbox flat-checkbox">--%>
<%--                                            <label>--%>
<%--                                                <input type="checkbox">--%>
<%--                                                <span class="fa fa-check"></span> Make My Profile Private?--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>

                            <button class="btn btn-primary btn-lg">Update My Profile</button>

                        </form>
                        <!-- form login -->

                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
        <!-- end container -->
    </section>


</div>
<!-- =-=-=-=-=-=-= Main Area End =-=-=-=-=-=-= -->

<!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
<%@include file="template/footer.jsp" %>


<%@include file="template/scripts.jsp" %>
</body>

</html>
