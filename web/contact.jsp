<%-- 
    Document   : contact
    Created on : May 11, 2021, 2:26:17 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
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

<!-- =-=-=-=-=-=-= Main Area =-=-=-=-=-=-= -->
<div class="main-content-area">

    <!-- =-=-=-=-=-=-= Page Breadcrumb =-=-=-=-=-=-= -->
    <section class="page-title">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                    <h1>Contact Us</h1>
                </div>
                <!-- end col -->
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a>
                            </li>
                            <li class="active">Contact</li>
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

    <!-- =-=-=-=-=-=-= Contact Us  =-=-=-=-=-=-= -->
    <section class="section-padding-80 white contact-us" id="contacts">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-sm-12 col-xs-12">

                    <h2>Send a Message</h2>

                    <form id="contactForm" method="post" action="#">
                        <div class="row">
                            <div class="col-lg-6 formmargin">

                                <div class="form-group">
                                    <input type="text" placeholder="Name" id="name" name="name" class="form-control"
                                           required>

                                </div>

                                <div class="form-group">
                                    <input type="email" placeholder="Email" id="email" name="email" class="form-control"
                                           required>

                                </div>

                                <div class="form-group">
                                    <input type="text" placeholder="Subject" id="subject" name="subject"
                                           class="form-control" required>
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <textarea cols="12" rows="8" placeholder="Message..." id="message" name="message"
                                              class="form-control" required></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <button id="yes" class="btn btn-primary" type="submit">Send Message</button>

                            </div>
                        </div>
                    </form>
                </div>


                <div class="clearfix"></div>
            </div>
        </div>
        <!-- end container -->
    </section>
    <!-- =-=-=-=-=-=-= Contact Us End =-=-=-=-=-=-= -->


</div>
<!-- =-=-=-=-=-=-= Main Area End =-=-=-=-=-=-= -->

<!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
<%@include file="template/footer.jsp" %>


<%@include file="template/scripts.jsp" %>
</body>

</html>