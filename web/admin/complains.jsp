<%-- 
    Document   : complains
    Created on : May 12, 2021, 10:38:46 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:set var="req" value="${pageContext.request}"/>
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}"/>
<%@page import="db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Admin - Cyber Crime</title>
    <%@include file="template/header.jsp" %>
</head>

<body class="fix-header fix-sidebar card-no-border">
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
    </svg>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <%@include file="template/topbar.jsp" %>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <%@include file="template/sidebar.jsp" %>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h3 class="text-themecolor">Manage Complains</h3>
            </div>
            <div class="col-md-7 align-self-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Complains</li>
                </ol>
            </div>
            <%--                <div>--%>
            <%--                    <button class="right-side-toggle waves-effect waves-light btn-inverse btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>--%>
            <%--                </div>--%>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">

            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                 aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myLargeModalLabel">Complain Details</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">
                            <form id="form_insert" name="form_insert" role="form" method="POST"
                                  class="form-horizontal">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Title</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="title" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Category</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="category"  class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Date</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="date"  class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Time</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="time" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Complained Date</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="complained_date" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Complainer Name</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="complainer_name" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Complainer Email</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="complainer_email" name="name" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Complainer Mobile</label>
                                                <div class="col-md-10">
                                                    <input type="text" disabled id="complainer_mobile" name="name" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-2">Complain Description</label>
                                                <div class="col-md-10">
                                                    <textarea class="form-control" id="description" disabled rows="5"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">
                                Close
                            </button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>


        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <%@include file="template/footer.jsp" %>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<%@include file="template/scripts.jsp" %>

<script>



    $(document).ready(function () {




    });





    function viewComplain(id) {

        $.ajax({
            url: '${pageScope.baseURL}/GetComplainDetails',
            data: {id: id},
            dataType: 'json',
            method: 'get',
            error: function (error) {

                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Something went wrong!',
                })

            },
            success: function (r) {
                console.log(r)
                if (r.status == 200) {

                    $('#title').val("");
                    $('#category').val("");
                    $('#date').val("");
                    $('#time').val("");
                    $('#complained_date').val("");
                    $('#complainer_name').val("");
                    $('#complainer_email').val("");
                    $('#complainer_mobile').val("");
                    $('#description').val("");


                    $('#title').val(r.data.title);
                    $('#category').val(r.data.category);
                    $('#date').val(r.data.date);
                    $('#time').val(r.data.time);
                    $('#complained_date').val(r.data.createdAt);
                    $('#complainer_name').val(r.data.complainer);
                    $('#complainer_email').val(r.data.complainerEmail);
                    $('#complainer_mobile').val(r.data.complainerMobile);
                    $('#description').val(r.data.description);

                    $('.bs-example-modal-lg').modal();
                }

                if (r.status == 500) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Something went wrong!',
                    })
                }

            }
        });


    }


</script>

</body>

</html>