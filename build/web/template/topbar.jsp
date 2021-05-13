<%-- 
    Document   : topbar
    Created on : May 11, 2021, 2:20:32 PM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-4">
                <ul class="top-nav nav-left">
                    <li><a href="index.jsp">Home</a>
                    </li>

                    <li class="hidden-xs"><a href="contact.jsp">Contact
                        Us</a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-8">
                <ul class="top-nav nav-right">
                    <% if (session.getAttribute("id") == null) { %>

                    <li><a href="login.jsp"><i class="fa fa-lock" aria-hidden="true"></i>Login</a>
                    </li>
                    <li><a href="register.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>Signup</a>
                    </li>

                    <% } else {%>

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown"
                           data-animations="fadeInUp">
<%--                            <img class="img-circle resize" alt=""--%>
<%--                                 src="https://templates.scriptsbundle.com/knowledge/demo/images/authors/13.jpg">--%>
                            <span class="hidden-xs small-padding">
								<span>${sessionScope.get("name")}</span>
							 <i class="fa fa-caret-down"></i>
							</span>
                        </a>
                        <ul class="dropdown-menu ">
                            <%--                            <li><a href=""><i class=" icon-bargraph"></i> Dashboard</a></li>--%>
                            <li><a href="profile.jsp"><i
                                    class=" icon-gears"></i> Profile Setting</a></li>
                            <li><a href="my-complains.jsp"><i
                                    class="icon-heart"></i> My Complains</a></li>
                            <li><a href="#"><i class="icon-lock"></i> Logout</a></li>
                        </ul>
                    </li>

                    <% } %>
                </ul>
            </div>
        </div>
    </div>
</div>