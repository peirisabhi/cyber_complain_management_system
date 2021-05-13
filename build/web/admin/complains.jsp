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
            <!-- Row -->
            <div id="div_edit">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Update sub category form</h4>
                            </div>
                            <div class="card-body">
                                <form id="form_update" name="form_update" role="form" method="POST"
                                      class="form-horizontal">

                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit" class="btn btn-success">Update</button>
                                                        <button type="reset" class="btn btn-inverse">Clear</button>
                                                        <button type="button" onclick="show_insert_form()"
                                                                class="btn btn-info">Add Sub Category
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6"></div>
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
                            <h4 class="m-b-0 text-white">Complain List</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive m-t-40">
                                <table id="myTable" class="table table-bordered table-striped">

                                    <tr>
                                        <th>User Id</th>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Complainer</th>
                                        <th>Status</th>
                                        <th>Complained Date</th>
                                        <th>Action</th>
                                    </tr>

                                    <sql:setDataSource var="myDS" driver="<%= DBConnection.DB_DRIVER%>"
                                                       url="<%= DBConnection.DB_URL%>"
                                                       user="<%= DBConnection.DB_USERNAME%>"
                                                       password="<%= DBConnection.DB_PASSWORD%>"/>

                                    <sql:query dataSource="${myDS}" var="users">
                                        SELECT complain.id AS id, title, category, complain.created_at, complain.`status`, `user`.`name` FROM complain INNER JOIN `user` WHERE `complain`.user_id = `user`.id AND `complain`.`active_status` = 1
                                    </sql:query>

                                    <c:forEach var="row" items="${users.rows}">
                                        <tr>
                                            <td>${row.id}</td>
                                            <td>${row.title}</td>
                                            <td>${row.category}</td>
                                            <td>${row.name}</td>
                                            <td>${row.status}</td>
                                            <td>${row.created_at}</td>
                                            <td>
                                                <div class="btn-group btn-group-xs  ">
                                                    <button id="btn-row-view" class="btn btn-success">
                                                        View
                                                    </button>
                                                </div>
                                                <div class="btn-group btn-group-xs  ">
                                                    <button id="btn-row-edit" class="btn btn-info">
                                                        Approve
                                                    </button>
                                                </div>
                                                <div class="btn-group btn-group-xs  ">
                                                    <button id="btn-row-delete" onclick="removeUser(${row.id})"class="btn btn-danger">
                                                        Reject
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

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

<script>

    function show_insert_form() {
        var content = '';
        content += '<button onclick="hide_insert_form()" class="btn btn-info">Hide Form</button>';
        $('#div_button').html(content);
        $("#div_add").show();
        $('#div_edit').hide();
        $('#txt_sub_category_id_update').val('');
        $('#txt_sub_category_name_update').val('');
    }

    function hide_insert_form() {
        var content = '';
        content += '<button onclick="show_insert_form()" class="btn btn-info">Add New User</button>';
        $('#div_button').html(content);
        $("#div_add").hide();
    }

    function hide_update_form() {
        var content = '';
        content += '<button onclick="show_update_form()" class="btn btn-info">Show Update Form</button>';
        $('#div_button').html(content);
        $("#div_edit").hide();
    }

    function show_update_form() {
        var content = '';
        content += '<button onclick="hide_update_form()" class="btn btn-info">Hide Form</button>';
        $('#div_button').html(content);
        $("#div_edit").show();
    }


    $(document).ready(function () {

        $("#div_add").hide();
        $("#div_edit").hide();


        $("#form_insert").validate({
            ignore: [],
            rules: {
                name: {
                    required: true
                },
                email: {
                    required: true
                },
                mobile: {
                    required: true
                },
                role: {
                    required: true
                },
                password: {
                    required: true
                },
                confirm_password: {
                    required: true,
                    equalTo: "#password"
                }
            },
            submitHandler: function (form) {
                $.ajax({
                    url: '${pageScope.baseURL}/CreateUserController',
                    data: $('#form_insert').serializeArray(),
                    dataType: 'json',
                    method: 'post',
                    error: function (error) {

                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                        })

                    },
                    success: function (r) {

                        if (r.status == 200) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: r.message,
                                onClose: () => {
//                                    location.replace("users.jsp");
                                    location.reload();
                                }
                            });

                        }

                        if (r.status == 500) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: r.message,
                            })
                        }

                    }
                });
            }
        });


    });


    function removeUser(userId) {
        console.log(userId)
        Swal.fire({
            title: "Do you want to remove this user?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#fcb03b",
            confirmButtonText: "Yes, remove it!",
            cancelButtonText: "No, cancel it!",
            closeOnConfirm: false,
            closeOnCancel: false
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '${pageScope.baseURL}/DeleteUserController',
                    data: {id: userId},
                    dataType: 'json',
                    method: 'post',
                    error: function (error) {

                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                        })

                    },
                    success: function (r) {

                        if (r.status == 200) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: r.message,
                                onClose: () => {
//                                    location.replace("users.jsp");
                                    location.reload();
                                }
                            });

                        }

                        if (r.status == 500) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: r.message,
                            })
                        }

                    }
                });
            }
        })


    }


</script>

</body>

</html>