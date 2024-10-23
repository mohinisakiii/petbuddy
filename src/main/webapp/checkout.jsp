<%
    user user = (user) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!--form-details-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">

                                </div>
                                <div class="form-group">
                                    <label for="name">Your Contact</label>
                                    <input value="<%= user.getUserPhone()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact number">

                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                    <textarea value="<%= user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
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
