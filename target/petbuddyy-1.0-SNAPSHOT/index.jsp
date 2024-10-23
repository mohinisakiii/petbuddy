<%-- 
    Document   : index
    Created on : 03-Aug-2024, 9:32:58 PM
    Author     : mohin
--%>

<%@page import="java.util.ArrayList"%>
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
        <style>
            .hero{

                background-image: url("img/hero/pet 4.webp");
                height: 60vh;
                background-size: 100%;
                animation: change 10s infinite ease-in-out;
            }
            @keyframes change{
                0%{
                    background-image: url("img/hero/pet 4.webp");
                }
                30%{
                    background-image: url("img/hero/pet 5.jpeg");
                }
                60%{
                    background-image: url("img/hero/pet 6.webp");
                }
                100%{
                    background-image: url("img/hero/pet 4.webp");
                }
            }
        </style>
        <div class="hero">



        </div>

        <div class="prefer text-center mb-4 mt-4">

            <div class="prefer1 text-center">
                <h4>What would you prefer?</h4>
                <div class="select">
                    <button class="btn2"><a href="categories.jsp">Buy One</a></button>
                    <button class="btn2"><a href="">Adopt One</a></button>
                </div>
            </div>
            <div>
                <img src="img/buy.webp" >
            </div>
        </div>

        <%@ page import="java.util.List" %>




        <%    String cat = request.getParameter("category");

            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<product> list;

            if (cat == null || cat.trim().equals("all")) {
                list = dao.getAllProduct();
            } else {
                int cid = Integer.parseInt(cat.trim());
                list = dao.getAllProductById(cid);
            }

            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<category> clist = cdao.getCategories();
        %>

        <h2 class="title mt-3 mb-4"><img src="img/circle.png" width="50px" height="50px">   Top Categories   <img src="img/circle.png" width="50px" height="50px"> </h2>

        <div class="category-container" >

            <%
                for (category c : clist) {
            %>
            <a href="categories.jsp?category=<%= c.getCategoryId()%>" class="category-item"  >
                <%= c.getCategoryTitle()%>
            </a>
            <%
                }
            %>
        </div>
        <div class="best">

            <h2 class="text-center mt-3 mb-4">Best Sellers</h2>
        </div>

        <div class="ml-6 mr-6 mb-4">
            <div class="cardshow">
                <!--traversing product-->
                <%
                    for (product p : dao.getFirstFourProducts()) {
                %>
                <!--                                product card-->


                <div class="card product-card bestseller ml-5 mr-5 mb-3" style="width:300px; height:450px;" >
                    <button class="btn discount ml-1 mt-1"><span><%= p.getpDiscount()%>% off</span></button>
                    <div class="container text-center">

                        <img src="img/products/<%= p.getpPhoto()%>" style="height: 200px; width:180px;" class="card-img-top m-2" alt="...">

                    </div>
                        <div class="bestseller1 ml-3 mr-3 mt-2 mb-4">
                            <h5 class="card-title"><%= p.getpName()%></h5>
                            <p class="card-text">
                                <%= Helper.get10Words(p.getpDesc())%>
                            </p>
                        </div>
                        <div class=" bestseller2 text-center ml-1 mr-1">
                            <button class="btn custom_bg1" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)"> Add to Cart </button>
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


<div>
    <div class="video1 ml-5">
        <video autoplay muted loop src="img/temptations.mp4" width="1420px" ></video>
    </div>
</div>
<div class="heading mt-4 mb-4">
    <h2 class=" text-center mt-3 mb-3">&#128054; "Unleash happiness with our premium dog gear—because your best friend deserves the best!" &#128062;</h2>
</div>
<!--show products-->
<div class="col-md-10">
    <!--                row-->
    <div class="row mt-4">
        <!-- col:12-->
        <div class="col-md-12">
            <div class="card-columns cardshow mb-3">
                <!--traversing product-->
                <%
                    for (product p : dao.getAllProductById(2)) {
                %>
                <!--                                product card-->
                <div class="card product-card bestseller ml-5 mr-5 mb-3" style="width:300px; height:400px;" >
                    <div class="container text-center">
                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width:auto;" class="card-img-top m-2" alt="...">

                    </div>
                        <div class="bestseller1 ml-3 mr-3 mt-3 mb-4">
                            <h5 class="card-title"><%= p.getpName()%></h5>
                            <p class="card-text">
                                <%= Helper.get10Words(p.getpDesc())%>
                            </p>
                        </div>
                        <div class=" text-center">
                            <button class="btn custom_bg1" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)"> Add to Cart </button>
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
            <div class="view text-center mb-4 mt-1">
                <button class="btn1"><a href="categories.jsp" class="viewmore">View More</a></button>
            </div>
            <div>
                <div class="video1 ml-5">
                    <div class="video">
                        <video autoplay muted loop src="img/catvideo.mp4" width="1450px" ></video>
                    </div>
                </div>
</div>
<div class="heading mt-2 mb-2">
    <h2 class=" text-center mt-4 mb-4">&#128049; Best Deals on Cat Items – Spoil Your Feline Friend Today! &#128062;</h2>
</div>
<!--show products-->
<div class="col-md-10">
    <!--                row-->
    <div class="row mt-4">
        <!-- col:12-->
        <div class="col-md-12">
            <div class="card-columns cardshow mb-4  ">
                <!--traversing product-->
                <%
                    for (product p : dao.getAllProductById(1)) {
                %>
                <!--                                product card-->
                <div class="card product-card bestseller ml-5 mr-5 mb-3" style="width:300px; height:400px;" >
                    <div class="container text-center">
                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width:auto;" class="card-img-top m-2" alt="...">

                    </div>
                    <div class="bestseller1 ml-3 mr-3 mt-3 mb-4">
                        <h5 class="card-title"><%= p.getpName()%></h5>
                        <p class="card-text">
                            <%= Helper.get10Words(p.getpDesc())%>
                        </p>
                    </div>
                    <div class=" text-center">
                        <button class="btn custom_bg1" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)"> Add to Cart </button>
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
                <div class="view text-center mb-4">
                    <button class="btn1"><a href="categories.jsp" class="viewmore">View More</a></button>
                </div>
                <div class="blog text-center">
                    <h3>Learn With PetBuddy</h3>
                </div>
                <div class="blogcard mb-4 mt-5">
                    <div class="bcard">
                        <img src="img/hero/dog1.png" width="350px">
                        <h4 class="ml-2 ml-2 text-center">5 Yummy Summer Foods for Dogs</h4>
                        <p class="ml-2 mr-2 text-center">Scorching temperatures are around the corner, and your furry pal is sure to feel the heat too. If you’re wondering, “how to cool my dog down?”, you’re not alone in this query. Many pet parents are confused about what dogs...</br></br><a href="bcard1.jsp"><span>Read More > </span></a></p>
                    </div>
                    <div class="bcard"><img src="img/hero/dog2.png" width="350px">
                        <h4 class=" ml-2 mr-2 text-center">Beat the heat - Summer care tips for pets</h4>
                        <p class="ml-2 mr-2 text-center">Keeping pets cool in the summer might need a little extra care during the scorching summer months to ensure their health and well-being. As temperatures soar, pets are more susceptible to heat-related illnesses such as heatstroke, dehydration, and burnt paw...</br></br><span>Read More > </span></p>
                    </div>
                    <div class="bcard"><img src="img/hero/dog3.png" width="350px">
                        <h4 class="ml-2 mr-2 text-center">Create a cat-friendly environment for your new feline friend</h4>
                        <p class="ml-2 mr-2 text-center">Kittens are extremely curious and energetic animals with boundless energy. Creating a safe and enriching environment at home will cater to your kitten’s playful side, provide much needed physical and mental stimulus, and positively impact their health and development for...</br></br><span>Read More > </span></p>
                    </div>
                </div>
                <%@ include file="components/common_modals.jsp" %>

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

