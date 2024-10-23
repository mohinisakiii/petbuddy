<%@page import="com.mycompany.petbuddyy.helper.Helper"%>
<%@page import="com.mycompany.petbuddyy.entities.category"%>
<%@page import="com.mycompany.petbuddyy.dao.CategoryDao"%>
<%@page import="com.mycompany.petbuddyy.entities.product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.petbuddyy.dao.ProductDao"%>
<%@page import="com.mycompany.petbuddyy.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Petbuddy - Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%                    String cat = request.getParameter("category");

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProduct();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<category> clist = cdao.getCategories();
                %>


                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="categories.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>




                        <%
                            for (category c : clist) {

                        %>
                        <a href="categories.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <!--show products-->
                <div class="col-md-10">
                    <!--                row-->
                    <div class="row mt-4">
                        <!-- col:12-->
                        <div class="col-md-12">
                            <div class="card-columns">
                                <!--traversing product-->
                                <%
                                    for (product p : list) {
                                %>
                                <!--                                product card-->
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width:auto;" class="card-img-top m-2" alt="...">

                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>
                                        </p>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button class="btn custom_bg" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)"> Add to Cart </button>
                                        <button class="btn btn-outline-success"> &#8377; <%= p.getPriceAfterApplyingDiscount()%>/-  <span class="text-secondary discount-label">   &#8377; <%= p.getpPrice()%> , <%= p.getpDiscount()%>% off</span></button>

                                    </div>
                                </div>



                                <% }
                                    if (list.size() == 0) {
                                        out.println("<h3>No item in this category</h3>");
                                    }
                                %>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
    </body>
    <footer class=" footer1 ">
        <div class="ml-5 mr-5 ">
            <div class="footertitle2 ml-5 mr-5 pt-4 pb-3">
                <p><span>PET PARENTS ALSO SEARCHED:</span>  Dog Food | Dry Dog Food | Cat Food | Wet Cat Food | Petbuddy Treats | Royal Canin | Petbuddy Deals | Royal Canin Dog Food | Pedigree Food | Whiskas | Cat Litter & Accessories | Cat Toys | Natural Treats | Fun Toys | New Products | Personalised Tags | Dog Collars & Leashes | Cat Harnesses | Sheba Cat Food | Hay | Vitamins & Supplements</p></br>
                <p><span>KNOW YOUR BREEDS :</span>  Beagle | Boxer | Daschund | Doberman | German Shepherd | Golden Retriever | Indie | Labrador | Pug | Rottweiler | Shih Tzu | Siberian Husky | Bengal | Himalayan | Indie | Maine Coon | Persian | Siamese</p></br></br>
                <div class="footertitle">
                    <div class="heading1">
                        <h5>Follow us</h5>
                        <div class="icon">
                            <a href="!#" class="icon fa fa-facebook ml-1"></a>
                            <a href="!#" class="icon fa fa-instagram ml-1"></a>
                            <a href="!#" class="icon fa fa-youtube ml-1"></a>
                            <a href="!#" class="icon fa fa-telegram ml-1"></a>
                        </div>
                    </div>
                    <div class="heading1">
                        <h5>Shop now</h5>
                        <div>
                            <p>Dog</br>Cats</br>Small animals</br>Birds</p>
                        </div>
                    </div>
                    <div class="heading1">
                        <h5>Online shopping</h5>
                        <div>
                            <p>Terms of Use</br>Privacy Policy</br>Returns Policy</br>Shipping Policy</br>Customer Grievance Redressal</br>Returns Center</br>Contact Us</p>
                        </div>
                    </div>
                    <div class="heading1">
                        <h5>The Petbuddy Difference</h5>
                        <div>
                            <p>Articles</br>Giving Back</p>
                        </div>
                    </div>
                    <div class="heading1">
                        <h5>Sign Up</h5>
                        <div>
                            <p>For us it's all about the love </br>for Pets! Subscribe to our Newsletter </br>and receive special promotions and fun content!</p></br>
                            <div>
                                <input class="input text-center" type="text" name="email" placeholder="Email address">
                                <button class="signup">Sign Up</button>
                            </div>
                        </div>
                    </div>

                </div>
                <p class="copyright"></br>&COPY;Petbuddy Limited.All rights reserved</p>
            </div>
        </div>
    </footer>
</html>
