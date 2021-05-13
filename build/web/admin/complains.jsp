<%-- 
    Document   : complains
    Created on : May 12, 2021, 10:38:46 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
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
                        <h3 class="text-themecolor">Dashboard</h3>
                    </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
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

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <div id="div_button" class="col-md-offset-3 col-md-9">
                                    <button onclick="show_insert_form()" class="btn btn-info">Add Sub Category</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6"> </div>
                    </div><br>
                    <!-- Row -->
                    <!-- Row -->
                    <div id="div_add">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card card-outline-info">
                                    <div class="card-header">
                                        <h4 class="m-b-0 text-white">Add sub category form</h4>
                                    </div>
                                    <div class="card-body">
                                        <form id="form_insert" name="form_insert" role="form" method="POST" class="form-horizontal">
                                            <div class="form-body">
                                                <h3 class="box-title">Sub category information</h3>
                                                <hr class="m-t-0 m-b-40">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label for="cmb_category" class="control-label text-right col-md-2">Main Category</label>
                                                            <div class="col-md-10">
                                                                <select class="form-control custom-select" id="cmb_category" name="cmb_category" tabindex="1">
                                                                    <option value="2">Kandyan Brides Jewelry</option>
                                                                    <option value="3">Face Care</option>
                                                                    <option value="4">Skin Care</option>
                                                                    <option value="5">Hair Care</option>
                                                                    <option value="6">Makeup</option>
                                                                    <option value="7">Pedicure & Manicure</option>
                                                                    <option value="8">Fragrance & Deodorant</option>
                                                                    <option value="9">Hair wigs</option>
                                                                    <option value="10">Salon Furniture</option>
                                                                    <option value="11">Artificial Flowers</option>
                                                                    <option value="12">Fancy Dress</option>
                                                                    <option value="13">Hair Colors</option>
                                                                    <option value="14">COSMETIC TOOLS</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label for="txt_sub_category_name" class="control-label text-right col-md-2">Sub Category</label>
                                                            <div class="col-md-10">
                                                                <input type="text" id="txt_sub_category_name" name="txt_sub_category_name" class="form-control" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="row">
                                                            <div class="col-md-offset-3 col-md-9">
                                                                <button type="submit" class="btn btn-success">Insert</button>
                                                                <button type="reset" class="btn btn-inverse">Clear</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6"> </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->

                    <!-- Row -->
                    <div id="div_edit">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card card-outline-info">
                                    <div class="card-header">
                                        <h4 class="m-b-0 text-white">Update sub category form</h4>
                                    </div>
                                    <div class="card-body">
                                        <form id="form_update" name="form_update" role="form" method="POST" class="form-horizontal">
                                            <div class="form-body">
                                                <h3 class="box-title">Sub category information</h3>
                                                <hr class="m-t-0 m-b-40">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label for="cmb_category_update" class="control-label text-right col-md-2">Main Category</label>
                                                            <div class="col-md-10">
                                                                <select class="form-control custom-select" id="cmb_category_update" name="cmb_category_update" tabindex="1">
                                                                    <option value="2">Kandyan Brides Jewelry</option>
                                                                    <option value="3">Face Care</option>
                                                                    <option value="4">Skin Care</option>
                                                                    <option value="5">Hair Care</option>
                                                                    <option value="6">Makeup</option>
                                                                    <option value="7">Pedicure & Manicure</option>
                                                                    <option value="8">Fragrance & Deodorant</option>
                                                                    <option value="9">Hair wigs</option>
                                                                    <option value="10">Salon Furniture</option>
                                                                    <option value="11">Artificial Flowers</option>
                                                                    <option value="12">Fancy Dress</option>
                                                                    <option value="13">Hair Colors</option>
                                                                    <option value="14">COSMETIC TOOLS</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label for="txt_sub_category_name_update" class="control-label text-right col-md-2">Sub Category</label>
                                                            <div class="col-md-10">
                                                                <input type="text" id="txt_sub_category_name_update" name="txt_sub_category_name_update" class="form-control" required>
                                                                <input type="hidden" id="txt_sub_category_id_update" name="txt_sub_category_id_update" class="form-control" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <hr>
                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="row">
                                                            <div class="col-md-offset-3 col-md-9">
                                                                <button type="submit" class="btn btn-success">Update</button>
                                                                <button type="reset" class="btn btn-inverse">Clear</button>
                                                                <button type="button" onclick="show_insert_form()" class="btn btn-info">Add Sub Category</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6"> </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->

                    <!-- Row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-outline-info">
                                <div class="card-header">
                                    <h4 class="m-b-0 text-white">Sub Category details</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive m-t-40">
                                        <table id="myTable" class="table table-bordered table-striped">
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    </body>

</html>