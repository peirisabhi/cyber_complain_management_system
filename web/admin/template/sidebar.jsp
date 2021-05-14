<%-- 
    Document   : sidebar
    Created on : May 12, 2021, 8:34:01 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- User profile -->
        <div class="user-profile">
            <!-- User profile image -->
            <!--                    <div class="profile-img">
                                    <img src="../assets/images/users/profile.png" alt="" />
                                     this is blinking heartbit
                                    <div class="notify setpos"> <span class="heartbit"></span> <span class="point"></span> </div>
                                </div>-->
            <!-- User profile text-->
            <div class="profile-text">
                <h5><%= session.getAttribute("name")%></h5>
                <a href="${pageScope.baseURL}/AdminLogout" class="" data-toggle="tooltip" title="Logout"><i
                        class="mdi mdi-power"></i></a>
                <%--                        <div class="dropdown-menu animated flipInY">--%>
                <%--                           --%>
                <%--                            <!-- text-->--%>
                <%--                            <div class="dropdown-divider"></div>--%>
                <%--                            <!-- text-->--%>
                <%--                            <a href="login.html" class="dropdown-item"><i class="fa fa-power-off"></i> Logout</a>--%>
                <%--                            <!-- text-->--%>
                <%--                        </div>--%>
            </div>
        </div>
        <!-- End User profile text-->
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-devider"></li>
                <li>
                    <a class="has-arrow waves-effect waves-dark" href="home.jsp" aria-expanded="false"><i
                            class="mdi mdi-gauge"></i><span class="hide-menu">Home </span></a>
                </li>

                <%--                <% if (String.valueOf(request.getSession().getAttribute("user_role_id")).equals("3")) {%>--%>
                <c:if test="${sessionScope.get('user_role_id') == 3}">
                    <li>
                        <a class="has-arrow waves-effect waves-dark" href="users.jsp" aria-expanded="false"><i
                                class="mdi mdi-account"></i><span class="hide-menu">Users </span></a>
                    </li>

                    <li>
                        <a class="has-arrow waves-effect waves-dark" href="complains.jsp" aria-expanded="false"><i
                                class="mdi mdi-file"></i><span class="hide-menu">Complains </span></a>
                    </li>
                </c:if>
                <%--                <%}%>--%>

                <%--                <% if (((Integer) request.getSession().getAttribute("user_role_id")) == 2) {%>--%>
                <c:if test="${sessionScope.get('user_role_id') == 2}">
                    <li>
                        <a class="has-arrow waves-effect waves-dark" href="complain-status.jsp" aria-expanded="false"><i
                                class="mdi mdi-file"></i><span
                                class="hide-menu">Complains Status </span></a>
                    </li>
                </c:if>
                <%--                <%}%>--%>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>