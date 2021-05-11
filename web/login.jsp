<%-- 
    Document   : login
    Created on : May 11, 2021, 10:56:38 AM
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
            <h1>Sign In To Your Account</h1>
          </div>
          <!-- end col -->
          <div class="col-md-6 col-sm-5 co-xs-12 text-right">
            <div class="bread">
              <ol class="breadcrumb">
                <li><a href="#">Home</a>
                </li>
<%--                <li><a href="#">Pages</a>--%>
<%--                </li>--%>
                <li class="active">Sign In</li>
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

    <!-- =-=-=-=-=-=-= Login Form =-=-=-=-=-=-= -->
    <section class="section-padding-80 white" id="login">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">

            <div class="box-panel">

              <!-- form login -->
              <form method="post" action="ComplainerLoginController">
                <div class="form-group">
                  <label>Email</label>
                  <input name="email" type="email" placeholder="Your Email" class="form-control">
                </div>
                <div class="form-group">
                  <label>Password</label>
                  <input name="password" type="password" placeholder="Your Password" class="form-control">
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-xs-6">
                      <div class="checkbox flat-checkbox">
                        <label>
                          <input type="checkbox">
<%--                          <span class="fa fa-check"></span> Remember me?--%>
                        </label>
                      </div>
                    </div>
                    <div class="col-xs-6 text-right">
                      <p class="help-block"><a data-toggle="modal" href="#myModal">Forgot password?</a>
                      </p>
                    </div>
                  </div>
                </div>

                <button class="btn btn-primary btn-lg btn-block">Log In</button>

              </form>
              <!-- form login -->

            </div>
          </div>

          <div class="clearfix"></div>
        </div>
      </div>
      <!-- end container -->
    </section>
    <!-- =-=-=-=-=-=-= Login Form   End =-=-=-=-=-=-= -->



  </div>
  <!-- =-=-=-=-=-=-= Main Area End =-=-=-=-=-=-= -->

  <!-- =-=-=-=-=-=-= FOOTER =-=-=-=-=-=-= -->
  <%@include file="template/footer.jsp"%>


  <%@include file="template/scripts.jsp"%>
</body>

</html>