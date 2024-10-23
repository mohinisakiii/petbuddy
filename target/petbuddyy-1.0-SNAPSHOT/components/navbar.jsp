<%@page import="com.mycompany.petbuddyy.entities.user"%>
<%
    user user1 = (user) session.getAttribute("current-user");

%>





<nav class="navbar navbar-expand-lg navbar-dark custom_bg" >
    <div class="container">
        <a class="navbar-brand" href="index.jsp" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bolder;">PetBuddy</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link custom_bg " href="index.jsp" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bold;
                       ">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link custom_bg " href="categories.jsp" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bold;">Categories <span class="sr-only">(current)</span></a>
                </li>



            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link custom_bg" href="#!" data-toggle="modal" data-target="#cart">  <i class="fa fa-cart-plus" style="font-size: 20px;color: #E85A4F;"></i><span class="ml-0 cart-items" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bold;">(0)</span></a>
                </li>



                <%                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link custom_bg" href="login.jsp" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bold;">Login</a>
                </li> 
                <li class="nav-item active">
                    <a class="nav-link custom_bg" href="register.jsp" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bold;">Register </a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item active">
                    <a class="nav-link custom_bg" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bold;" ><%= user1.getUserName()%> </a>
                </li> 
                <li class="nav-item active">
                    <a class="nav-link custom_bg" href="LogoutServlet" style="color: #E85A4F;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-size: 18px;font-weight: bold;">Logout </a>
                </li>
                <%
                    }
                %>



            </ul>
        </div>
    </div>
</nav>
