<%-- 
    Document   : post-complain
    Created on : May 11, 2021, 4:53:57 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("id") == null) {
        response.sendRedirect("login.jsp");
    }
%>
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

    <section class="page-title">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                    <h1>Post Your Complain</h1>
                </div>
                <!-- end col -->
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="#">Home</a>
                            </li>
                            <%--                <li><a href="#">Pages</a>--%>
                            </li>
                            <li class="active">Post Complain</li>
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

    <!-- =-=-=-=-=-=-= Post Question  =-=-=-=-=-=-= -->
    <section class="section-padding-80 white" id="post-question">
        <div class="container">

<!--            <div class='row'>
                <div class='col col-lg-10 col-sm-11 mx-lg-auto mx-sm-auto'>
                    <div class='alert alert-danger alert-dismissible fade show' role='alert'>
                        sdsds
                        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                            <span aria-hidden='true'>&times;</span>
                        </button>
                    </div>
                </div>
            </div>-->

            <div class="row">
                <div class="col-sm-12 col-md-12 ">

                    <div class="box-panel">

                        <h2>Post Your Complain</h2>
                        <p>Enter Your Correct Complain Details </p>
                        <hr>
                        <!-- form login -->
                        <form class="margin-top-40" id="insert-form" method="post">
                            <div class="form-group">
                                <label>Complain Title</label>
                                <input id="title" name="title" type="text" placeholder="Bootstrap Not Working"
                                       class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Complain Category</label>
                                <select id="category" name="category" class="questions-category form-control">
                                    <option value="0" selected disabled>Select Your Complain Category</option>
                                    <option value="hacking attempts">Hacking Attempts</option>
                                    <option value="phishing attacks">Phishing Attacks</option>
                                    <option value="ransomware">Ransomware</option>
                                    <option value="cash poisoning">Cash Poisoning</option>
                                    <option value="email bombs">Email Bombs</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>

                            <div id="other" class="form-group">
                                <label>Other Category</label>
                                <input id="other_category" name="other_category" type="text" placeholder="Enter Category"
                                       class="form-control">
                            </div>


                            <div class="form-group">
                                <label>Attack Date</label>
                                <input id="date" name="date" type="date" placeholder="Enter Your Attack Date"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label>Attack Time</label>
                                <input id="time" name="time" type="time" placeholder="Enter Your Attack Time"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label>Description About Attack</label>
                                <textarea cols="12" rows="12" placeholder="Post Your Attack Details Here....."
                                          id="message" name="description" class="form-control"></textarea>
                            </div>

                            <button class="btn btn-primary pull-right">Publish Your Complain</button>

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

<script>
    $(document).ready(function () {
        $('#other').hide();

        $('#category').on('change', function () {
            if ($(this).find(":selected").val() == "other") {
                $('#other').show();
            } else {
                $('#other').hide();
            }
        });

        $('#insert-form').validate({
            ignore: [],
            rules: {
                title: {
                    required: true
                }
            },
            submitHandler: function (form) {
                $.ajax({
                    url: 'SaveComplain',
                    enctype: "multipart/form-data",
                    data: new FormData(form),
                    dataType: 'json',
                    method: 'post',
                    processData: false,
                    contentType: false,
                    error: function (error) {

                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                        })


                        // dt.ajax.reload();
                        // dt.draw();
                    },
                    success: function (r) {

                        if (r.status == 200) {
                            clear();
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: r.message,
                            })

                            // $("#create-new-user-form")[0].reset();
                            // $(".dropify-clear").trigger("click");
                        }else if (r.status == 500) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: r.message,
                            })
                        }else if(r.status == 404){
                            location.replace("login.jsp");
                        }

                    }
                });
            }
        })
    });


    function clear() {
        $('#title').val("");
        $('#date').val("");
        $('#time').val("");
        $('#other_category').val("");
        $('#message').val("");
        $('#category').val(0);
        $('#other').hide();

    }

</script>

</body>

</html>