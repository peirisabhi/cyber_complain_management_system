<%-- 
    Document   : register
    Created on : May 11, 2021, 10:57:12 AM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <h1>Create Account</h1>
                        </div>
                        <!-- end col -->
                        <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                            <div class="bread">
                                <ol class="breadcrumb">
                                    <li><a href="#">Home</a>
                                    </li>
                                    <li><a href="#">Pages</a>
                                    </li>
                                    <li class="active">SIgn Up</li>
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

            <!-- =-=-=-=-=-=-= Register Form =-=-=-=-=-=-= -->
            <section class="section-padding-80 white" id="register">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3">

                            <div class="box-panel">


                                <!-- form login -->
                                <form method="post" action="ComplainerRegisterController">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" name="name" required placeholder="Your Full Name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="email" required placeholder="Your Email" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Contact</label>
                                        <input type="tel" name="contact" required placeholder="Your Contact Number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="password" required placeholder="Your Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <input type="password" name="confirm_password" required placeholder="Verify Your Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col-xs-12 text-right">
                                                <p class="help-block"><a data-toggle="modal" href="login.html">Already Register Sing In</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Create Account</button>

                                </form>
                                <!-- form login -->

                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <!-- end container -->
            </section>
            <!-- =-=-=-=-=-=-= Register Form End =-=-=-=-=-=-= -->

            <!-- =-=-=-=-=-=-= Our Clients =-=-=-=-=-=-= -->
            <section class="custom-padding" id="clients">
                <div class="container">

                    <!-- Row -->
                    <div class="row">

                        <!-- col-md-2 client-block -->
                        <div class="col-md-2 col-xs-6 col-sm-4 client-block">

                            <!-- client-item client-item-style-2 -->
                            <div class="client-item client-item-style-2">
                                <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_5.png"> </a>
                            </div>
                            <!-- /client-item client-item-style-2 -->

                        </div>
                        <!-- /col-md-2 client-block -->

                        <!-- col-md-2 client-block -->
                        <div class="col-md-2 col-xs-6 col-sm-4 client-block">

                            <!-- client-item client-item-style-2 -->
                            <div class="client-item client-item-style-2">
                                <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_6.png"> </a>
                            </div>
                            <!-- /client-item client-item-style-2 -->

                        </div>
                        <!-- /col-md-2 client-block -->

                        <!-- col-md-2 client-block -->
                        <div class="col-md-2 col-xs-6 col-sm-4 client-block">

                            <!-- client-item client-item-style-2 -->
                            <div class="client-item client-item-style-2">
                                <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_7.png"> </a>
                            </div>
                            <!-- /client-item client-item-style-2 -->

                        </div>
                        <!-- /col-md-2 client-block -->

                        <!-- col-md-2 client-block -->
                        <div class="col-md-2 col-xs-6 col-sm-4 client-block">

                            <!-- client-item client-item-style-2 -->
                            <div class="client-item client-item-style-2">
                                <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_8.png"> </a>
                            </div>
                            <!-- /client-item client-item-style-2 -->

                        </div>
                        <!-- /col-md-2 client-block -->

                        <!-- col-md-2 client-block -->
                        <div class="col-md-2 col-xs-6 col-sm-4 client-block">

                            <!-- client-item client-item-style-2 -->
                            <div class="client-item client-item-style-2">
                                <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_9.png"> </a>
                            </div>
                            <!-- /client-item client-item-style-2 -->

                        </div>
                        <!-- /col-md-2 client-block -->

                        <!-- col-md-2 client-block -->
                        <div class="col-md-2 col-xs-6 col-sm-4 client-block">

                            <!-- client-item client-item-style-2 -->
                            <div class="client-item client-item-style-2">
                                <a title="Client Logo" href="#"> <img alt="Clients Logo" src="images/clients/client_10.png"> </a>
                            </div>
                            <!-- /client-item client-item-style-2 -->

                        </div>
                        <!-- /col-md-2 client-block -->

                    </div>
                    <!-- Row End -->

                </div>
                <!-- end container -->
            </section>
            <!-- =-=-=-=-=-=-= Our Clients -end =-=-=-=-=-=-= -->

        </div>
        <!-- =-=-=-=-=-=-= Main Area End =-=-=-=-=-=-= -->

        <!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
        <%@include file="template/footer.jsp"%>


        <%@include file="template/scripts.jsp"%>
    </body>

</html>