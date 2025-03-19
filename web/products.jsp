<%-- 
    Document   : products
    Created on : 10 Mar, 2025, 1:45:59 PM
    Author     : 5LABSYSTEM17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    String userEmail = (sessionObj != null) ? (String) sessionObj.getAttribute("user") : null;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fresh Basket</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
      

        <link rel="stylesheet" href="style.css">
      <!-------------------------Font Awesome Icons --------------->  
  <script src="https://kit.fontawesome.com/dad03e859c.js" crossorigin="anonymous"></script>
  <!----------x---------------Font Awesome Icons --------x------->

  <!----------x---------------Google font --------x------->
      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alkatra&family=Berkshire+Swash&family=Comic+Neue:wght@700&family=Gentium+Book+Plus:wght@400;700&family=Lato:ital,wght@0,400;0,700;0,900;1,700&family=Lexend+Deca:wght@500&family=Lexend:wght@500&family=Montserrat:wght@500&family=Open+Sans:wght@500;800&family=Roboto:wght@100;400&family=Sue+Ellen+Francisco&family=Work+Sans:wght@400;700;900&display=swap" rel="stylesheet">
      
      <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900;&display:swap">
       <!----------x---------------Google font --------x----------------->
       <link rel="stylesheet" href="index.css">
       <script src="cart.js"></script>
    </head>

    <body>
 <section id="header">
            <img src="mylogo.jpg.png" class="mainlogo">
            <div>
      <ul id="navbar">
 <li><a href="index.jsp" class="active">Home</a></li>
 <li><a href="products.jsp">Shop</a></li>
 <li><a href="about.jsp">About</a></li>
 <li><a href="contact.jsp">Contact</a></li>
                <% if (userEmail == null) { %>
            <!-- Show Sign In and Sign Up if user is NOT logged in -->
            <li><a href="login.jsp">Sign In</a></li>
            <li><a href="register.jsp">Sign Up</a></li>
        <% } else { %>
            <!-- Show Logout if user IS logged in -->
            <li>Welcome, <b><%= userEmail %>!</b></li>
            <li><a href="logout.jsp"><button>Logout</button></a></li>
            <li><button onclick="toggleCart()">🛒 Cart (<span id="cart-count">0</span>)</button></li>
             
    
    <div class="cart-overlay" id="cart-overlay" onclick="toggleCart()">
        <div class="cart" onclick="event.stopPropagation()">
            <h3>Shopping Cart</h3>
            <div id="cart-items"></div>
            <h4>Total: ₹<span id="cart-total">0</span></h4>
            <div class="cart-buttons">
                <button onclick="clearCart()">Clear Cart</button>
                <button onclick="buyNow()">Buy Now</button>
            </div>
        </div>
    </div>
        <% } %>
        </section>

<section id="hero">
  <h4>Trade-in-fair</h4>
  <h2>Super value deals</h2>
  <h1>On all Products</h1>
  <p>Save more with coupons and up to 70% off!</p>
  <button>Shop Now</button>
  

</section>

        <section>
            <button id="goToTopBtn" onclick="scrollToTop()">⬆ Go to Top</button>
        <style>
            #goToTopBtn {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: linear-gradient(to right, #ff5e62, #ff9966);
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 50px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
    display: none;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

#goToTopBtn:hover {
    background: linear-gradient(to right, #ff9966, #ff5e62);
}

         body { 
            font-family: Arial, sans-serif; 
            padding: 20px; 
            background: #f4f4f4;
            text-align: center;
        }
        button {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            margin: 5px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }
        button:hover {
            background: #218838;
        }
        .cart-overlay {
            position: fixed; 
            top: 0; 
            left: 0; 
            width: 100%; 
            height: 100%; 
            background: rgba(0, 0, 0, 0.5); 
            display: none; 
            justify-content: center; 
            align-items: center; 
        }
        .cart {
            background: white;
            padding: 20px;
            width: 350px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: left;
        }
        .cart-item {
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding: 10px 0; 
            border-bottom: 1px solid #ddd;
        }
        .cart-item span {
            font-size: 16px;
        }
        .cart-item button {
            background: #dc3545;
            padding: 5px 10px;
            font-size: 14px;
        }
        .cart-item button:hover {
            background: #c82333;
        }
        .cart-buttons {
            display: flex; 
            justify-content: space-between; 
            margin-top: 15px;
        }
        .cart-buttons button {
            flex: 1;
            margin: 0 5px;
        }
        h2 {
            color: #333;
        }
        .product {
            background: white;
            padding: 15px;
            margin: 10px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            display: inline-block;
            text-align: center;
        }
         #product-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px; /* Add spacing between cards */
    justify-content: flex-start; /* Align the products to the left */
    padding-left: 30px;
}

.product-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    margin: 10px; /* Decrease margin to make the cards closer */
    padding: 10px; /* Decrease padding for smaller cards */
    width: 180px; /* Decrease width of the product cards */
    text-align: center;
}

.product-card img {
    width: 100%;
    height: auto;
}

.product-card h3 {
    margin: 10px 0;
}

.price {
    font-weight: bold;
    color: #333;
}

.product-card button {
    margin-top: 10px;
    padding: 8px; /* Decrease button padding */
    background-color: green;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.product-card button:hover {
    background-color: greenyellow;
}
/*category*/
 .category-buttons {
            margin: 20px 0;
            text-align: center;
        }

        .category-buttons button {
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .category-buttons button:hover {
            background-color: greenyellow;
        }
        
    </style>
    <body><br><br>
<center><h1>Our Products</h1></center>
    <section>  
         <!-- Category Filter Buttons -->
    <div class="category-buttons">
        <button onclick="filterProducts('all')">All Products</button>
        <button onclick="filterProducts('fruits')">Fruits</button>
        <button onclick="filterProducts('vegetables')">Vegetables</button>
        <button onclick="filterProducts('grocery')">Grocery</button>
        <button onclick="filterProducts('milk products')">Milk Products</button>
    </div>
    <!-- Product Card -->
    
     <div id="product-container">
    <div class="product-card" data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003516/potato-1-kg-product-images-o590003516-p590003516-0-202408070949.jpg?im=Resize=(360,360)" alt="Potato">
<h3>Potato 1KG</h3>
<p class="price">Rs.35</p>
<button onclick="addToCart(1,'Potato',35)">Add to Cart</button>
</div> 
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590004109/tomato-country-1-kg-pack-product-images-o590004109-p590122468-0-202409171906.jpg?im=Resize=(360,360)" alt="tomato">
<h3>Tomato 1KG</h3>                
<p class="price">Rs.30</p>
<button onclick="addToCart(2,'tomato',30)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003661/cucumber-regular-500-g-product-images-o590003661-p590034099-0-202408070949.jpg?im=Resize=(360,360)" alt="cucumber madras">
<h3>cucumber madras 1kg</h3>
<p class="price">rs.48</p>
<button onclick="addToCart(3,'cucumber madras',48)">Add to Cart</button>
</div>

<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590002136/onion-5-kg-pack-product-images-o590002136-p590002136-0-202408070949.jpg?im=Resize=(360,360)" alt="onion">
<h3>onion 1kg</h3>                            
<p class="price">rs.45</p>
<button onclick="addToCart(4,'onion',45)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/rv02kz8uwu/paryavaraan-okra-harsit-lady-s-finger-vegetable-seeds-for-summer-season-home-gardening-25-seeds-product-images-orv02kz8uwu-p606516653-0-202312050043.jpg?im=Resize=(360,360)" alt="okra">
<h3>Ladies Finger 1kg</h3>                                    
<p class="price">rs.62</p>
<button onclick="addToCart(5,'Ladies Fingure',62)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003538/cabbage-per-pc-approx-600-g-1000-g-product-images-o590003538-p590003538-0-202408070949.jpg?im=Resize=(360,360)" alt="cabbage">
<h3>cabbage per each</h3>                                            
<p class="price">rs.27</p>
<button onclick="addToCart(6,'cabbage',27)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003662/green-capsicum-500-g-product-images-o590003662-p590003662-0-202408132028.jpg?im=Resize=(360,360)" alt="green-capsicum">
<h3>green capsicum 500gm</h3>                                                    
<p class="price">rs.42</p>
<button onclick="addToCart(7,'green capsicum',42)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/rv6zfwjyri/master-green-bottle-guard-seed-30-per-packet-product-images-orv6zfwjyri-p595664352-0-202211270103.jpg?im=Resize=(360,360)" alt="bottle-gourd">
<h3>bottle-gourd</h3>                                                            
<p class="price">rs.36</p>
<button onclick="addToCart(8,'bottle-gourd',36)">Add to Cart</button>
</div>        
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003543/ridge-gourd-500-g-product-images-o590003543-p590003543-0-202408070949.jpg?im=Resize=(360,360)" alt="ridge-gourd-500-g">
<h3>ridge-gourd-500-g</h3>
<p class="price">rs.34</p>
<button onclick="addToCart(9,'ridge-gourd-500-g',34)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003545/brinjal-nagpure-250-g-product-images-o590003545-p590003545-0-202411061150.jpg?im=Resize=(360,360)" alt="brinjal-black">
<h3>brinjal-black 1kg</h3>
<p class="price">rs.68</p>
<button onclick="addToCart(10,'brinjal-black',68)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003541/bitter-gourd-500-g-product-images-o590003541-p590003541-0-202408070949.jpg?im=Resize=(360,360)" alt="bitter-gourd">
<h3>bitter-gourd 1kg</h3>
<p class="price">rs.54</p>
<button onclick="addToCart(11,'brinjal-black',54)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590000156/cowpea-beans-500-g-product-images-o590000156-p590000156-0-202408070949.jpg?im=Resize=(360,360)" alt="cowpea-beans">
<h3>cowpea-beans 1kg</h3>
<p class="price">rs.39</p>
<button onclick="addToCart(12,'cowpea-beans',39)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590000128/drumstick-each-approx-25-g-100-g-product-images-o590000128-p590000128-0-202406192014.jpg?im=Resize=(360,360)" alt="drumstick-each">
<h3>drumstick-each</h3>
<p class="price">rs.39</p>
<button onclick="addToCart(13,'drumstick-each',39)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003532/indian-garlic-200-g-product-images-o590003532-p590003532-0-202408070949.jpg?im=Resize=(360,360)" alt="garlic">
<h3>garlic 100gm</h3>
<p class="price">rs.90</p>
<button onclick="addToCart(15,'garlic',90)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003533/green-chilli-200-g-product-images-o590003533-p590003533-0-202408070949.jpg?im=Resize=(360,360)" alt="green-chilli">
<h3>green-chilli 100gm</h3>
<p class="price">rs.12</p>
<button onclick="addToCart(17,'green-chilli',12)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003546/carrot-orange-500-g-product-images-o590003546-p590003546-0-202408070949.jpg?im=Resize=(360,360)" alt="carrot">
<h3>carrot 500gm</h3>
<p class="price">rs.36</p>
<button onclick="addToCart(18,'carrot',36)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003537/cauliflower-1-pc-approx-600-g-1000-g-product-images-o590003537-p590003537-0-202411061152.jpg?im=Resize=(360,360)" alt="cauliflower">
<h3>cauliflower 1pc</h3>
<p class="price">rs.28</p>
<button onclick="addToCart(19,'cauliflower',28)">Add to Cart</button>
</div>
<div class="product-card "data-category="vegetables">
<img src="https://www.jiomart.com/images/product/original/590003556/kundri-coccinia-250-g-product-images-o590003556-p590003556-0-202408070949.jpg?im=Resize=(360,360)" alt="coccinia">
<h3>coccinia 500gm</h3>
<p class="price">rs.43</p>
<button onclick="addToCart(20,'coccinia',43)">Add to Cart</button>
</div>
<div class="product-card" data-category="milk products">
<img src="https://www.jiomart.com/images/product/original/490319577/heritage-paneer-200-g-pouch-product-images-o490319577-p490319577-0-202203170527.jpg?im=Resize=(360,360)" alt="Panner">
<h3>Panner 200g</h3>              
<p class="price">Rs.89</p>
<button onclick="addToCart(21,'Panner',89)">Add to Cart</button>
</div>
<div class="product-card" data-category="milk products">
            <img src="https://www.jiomart.com/images/product/original/490001387/amul-butter-100-g-carton-product-images-o490001387-p490001387-0-202203170403.jpg?im=Resize=(360,360)" alt="butter">
            <h3>amul butter 100g</h3>
               
            <p class="price">Rs.59</p>
            <button onclick="addToCart(22,'butter',59)">Add to Cart</button>
            </div>
            
            <div class="product-card" data-category="milk products">
                <img src="https://www.jiomart.com/images/product/original/494374920/nestle-milkmaid-condensed-milk-210-g-product-images-o494374920-p608425531-0-202403111322.jpg?im=Resize=(360,360)"  alt="milkmaid">
                <h3>milkmaid 210g</h3>
                    
                <p class="price">Rs.49</p>
                <button onclick="addToCart(23,'milkmaid',49)">Add to Cart</button>
                </div> 
                
              <div class="product-card" data-category="milk products">
                 <img src="https://www.jiomart.com/images/product/original/491491710/heritage-total-curd-1000-g-product-images-o491491710-p605577325-0-202408011856.jpg?im=Resize=(360,360)"  alt="heritagetotalcurd">
                 <h3>Heritage Total Curd-1kg</h3>
                      
                <p class="price">Rs.63</p>
                <button onclick="addToCart(24,'heritagetotalcurd',63)">Add to Cart</button>
                </div>

                  <div class="product-card" data-category="milk products">
                     <img src="https://www.jiomart.com/images/product/original/490983555/cavin-s-chocolate-milkshake-180-ml-product-images-o490983555-p590126885-0-202411270829.jpg?im=Resize=(360,360)"  alt="cavin Milkshake">
                        <h3>Cavin Milkshake-180ml</h3>
                              
                        <p class="price">Rs.27</p>
                        <button onclick="addToCart(25,'cavin Milkshake',27)">Add to Cart</button>
                        </div>
                        <div class="product-card" data-category="milk products">
                            <img src="https://www.jiomart.com/images/product/original/590002436/amul-cow-milk-500-ml-product-images-o590002436-p590049231-0-202312261450.jpg?im=Resize=(360,360)"  alt="Milk">
                            <h3>Amul-Cow Milk 500ml</h3>
                                   
                            <p class="price">Rs.28</p>
                            <button onclick="addToCart(26,'Milk',28)">Add to Cart</button>
                            </div>

                            <div class="product-card" data-category="milk products">
                                <img src="https://www.jiomart.com/images/product/original/490983577/amul-mithai-mate-sweetened-condensed-milk-200-g-tin-product-images-o490983577-p490983577-0-202204070409.jpg?im=Resize=(360,360)"  alt="amul-mithai-mate">
                                <h3>Amul Mithai Mate(Tin)200g</h3>
                                        
                                <p class="price">Rs.80</p>
                                <button onclick="addToCart(27,'amul-mithai-mate',80)">Add to Cart</button>
                                </div>

                                <div class="product-card" data-category="milk products">
                                    <img src="https://www.jiomart.com/images/product/original/590008928/amul-a2-buffalo-milk-500-ml-product-images-o590008928-p606781716-0-202312181852.jpg?im=Resize=(360,360)"  alt="buffalo-milk">
                                    <h3>Buffalo-Milk 500ml</h3>
                                              
                                    <p class="price">Rs.36</p>
                                    <button onclick="addToCart(28,'buffalo-milk',36)">Add to Cart</button>
                                    </div>

                                    <div class="product-card" data-category="milk products">
                                        <img src="https://www.jiomart.com/images/product/original/491209195/amul-lassi-250-ml-tetra-pak-product-images-o491209195-p590086916-0-202203150032.jpg?im=Resize=(360,360)"  alt="amul-lassi">
                                        <h3>Amul Lassi 250ml</h3>
                                                  
                                        <p class="price">Rs.26</p>
                                        <button onclick="addToCart(29,'amul-lassi',26)">Add to Cart</button>
                                        </div>
                                        
                                        <div class="product-card" data-category="milk products">
                                            <img src="https://www.jiomart.com/images/product/original/492365424/parle-agro-smoodh-chocolate-flavoured-milk-80-ml-tetra-pak-product-images-o492365424-p590707035-0-202305030227.jpg?im=Resize=(360,360)"  alt="smoodh-chocolate">
                                            <h3>Smoodh Chocolate</h3>
                                                        
                                            <p class="price">Rs.10</p>
                                            <button onclick="addToCart(30,'smoodh-chocolate',10)">Add to Cart</button>
                                            </div>

                                            <div class="product-card" data-category="milk products">
                                                <img src="https://www.jiomart.com/images/product/original/490478026/nandini-goodlife-toned-milk-1-l-tetra-pak-product-images-o490478026-p490478026-0-202203170959.jpg?im=Resize=(360,360)"  alt="goodlifetonedmilk">
                                                <h3>GoodLife Toned Milk 1l</h3>
                                                             
                                                <p class="price">Rs.65</p>
                                                <button onclick="addToCart(31,'goodlifetonedmilk',65)">Add to Cart</button>
                                                </div>

                                                <div class="product-card" data-category="milk products">
                                                    <img src="https://www.jiomart.com/images/product/original/490010287/delicious-fat-spread-500-g-carton-product-images-o490010287-p490010287-0-202203150530.jpg?im=Resize=(360,360)"  alt="deliciousfatspread">
                                                    <h3>Delicious Fat Spread 500g</h3>
                                                                  
                                                    <p class="price">Rs.89</p>
                                                    <button onclick="addToCart(32,'deliciousfatspread',89)">Add to Cart</button>
                                                    </div>

                                                    <div class="product-card" data-category="milk products">
                                                        <img src="https://www.jiomart.com/images/product/original/490001540/amul-fresh-cooking-cream-1-l-tetra-pak-product-images-o490001540-p490001540-0-202203170446.jpg?im=Resize=(360,360)"  alt="amul-fresh-cooking-cream">
                                                        <h3>Fresh Cream 1l</h3>
                                                                       
                                                        <p class="price">Rs.205</p>
                                                        <button onclick="addToCart(33,'amul-fresh-cooking-cream',205)">Add to Cart</button>
                                                        </div>

                                                        <div class="product-card" data-category="milk products">
                                                            <img src="https://www.jiomart.com/images/product/original/491376662/amul-mozzarella-cheddar-diced-cheese-blend-200-g-pack-product-images-o491376662-p491376662-0-202406041526.jpg?im=Resize=(360,360)"  alt="mozzarella diced-cheese-blend">
                                                            <h3>mozzarella diced-cheese</h3>
                                                                             
                                                            <p class="price">Rs.117</p>
                                                            <button onclick="addToCart(34,'mozzarella diced-cheese-blend',117)">Add to Cart</button>
                                                            </div>

                                                            <div class="product-card" data-category="milk products">
                                                                <img src="https://www.jiomart.com/images/product/original/490010199/amul-cheese-block-1-kg-carton-product-images-o490010199-p490010199-0-202211031818.jpg?im=Resize=(360,360)"  alt="amul-cheese-block-1-kg">
                                                                <h3>Amul Cheese Block 1kg</h3>
                                                                                  
                                                                <p class="price">Rs.516</p>
                                                                <button onclick="addToCart(35,'amul-cheese-block-1-kg',516)">Add to Cart</button>
                                                                </div>

                                                                <div class="product-card" data-category="milk products">
                                                                    <img src="https://www.jiomart.com/images/product/original/492580301/d-lecta-cheese-slices-200-g-pouch-product-images-o492580301-p590946262-0-202206291627.jpg?im=Resize=(360,360)"  alt="cheese-slices-200-g">
                                                                    <h3>Cheese Slices 200g</h3>
                                                                                       
                                                                    <p class="price">Rs.114</p>
                                                                    <button onclick="addToCart(36,'cheese-slices-200-g',114)">Add to Cart</button>
                                                                    </div>
                                                                    
                                                                    <div class="product-card" data-category="milk products">
                                                                    <img src="https://www.jiomart.com/images/product/original/491961054/britannia-blend-and-diced-pizza-cheese-200-g-pouch-product-images-o491961054-p590334665-0-202502201010.jpg?im=Resize=(360,360)"  alt="britannia-blend-and-diced-pizza-">
                                                                    <h3>Britannia Diced Pizza 200g</h3>
                                                                                        
                                                                    <p class="price">Rs.120</p>
                                                                    <button onclick="addToCart(37,'britannia-blend-and-diced-pizza-',120)">Add to Cart</button>
                                                                    </div>

                                                                    <div class="product-card" data-category="milk products">
                                                                        <img src="https://www.jiomart.com/images/product/original/491390840/modern-crust-pizza-base-150-g-product-images-o491390840-p491390840-0-202203141859.jpg?im=Resize=(360,360)"  alt="pizza-base-150-g">
                                                                        <h3>Pizza Base 150g</h3>
                                                                                             
                                                                        <p class="price">Rs.75</p>
                                                                        <button onclick="addToCart(38,'pizza-base-150-g',75)">Add to Cart</button>
                                                                        </div>

                                                                        <div class="product-card" data-category="milk products">
                                                                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFt3_1A9UbNDJ1ldRaDIJhsXsFlMlw_-1K8g&s"  alt="Doodh peda">
                                                                            <h3>Doodh peda 250g</h3>
                                                                                                  
                                                                            <p class="price">Rs.99</p>
                                                                            <button onclick="addToCart(39,'Doodh peda',99)">Add to Cart</button>
                                                                            </div>

                                                                            <div class="product-card" data-category="milk products">
                                                                                <img src="https://www.jiomart.com/images/product/original/491599835/britannia-milk-bread-400-g-product-images-o491599835-p590113086-0-202203150756.jpg?im=Resize=(360,360)"  alt="milk-bread-400-g">
                                                                                <h3>Milk Bread 400g </h3>
                                                                                                       
                                                                                <p class="price">Rs.57</p>
                                                                                <button onclick="addToCart(40,'Doodh peda',57)">Add to Cart</button>
                                                                                </div>
<div class="product-card" data-category="fruits">
            <img src="https://5.imimg.com/data5/WS/GW/FG/SELLER-62386301/apple-1--500x500.jpeg" alt="Apple">
            <h3>Apple-1kg</h3>
            <p class="price">Rs.129</p>
            <button onclick="addToCart(41,'Apple',129)">Add to Cart</button>
           
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://5.imimg.com/data5/FW/IP/AP/SELLER-26713484/fresh-black-grapes-500x500.jpg" alt="Grapes">
            <h3>Grapes-1kg</h3>
            <p class="price">Rs.79</p>
            <button onclick="addToCart(42,'Grapes',79)">Add to Cart</button>
           
        </div>
			<div class="product-card" data-category="fruits">
            <img src="https://freshproduceshoppe.com/wp-content/uploads/2024/01/guavathaimp-freshproducesho-1.jpg" alt="Guavas">
            <h3>Guavas</h3>
            <p class="price">Rs.48</p>
            <button onclick="addToCart(43,'Guavas',48)">Add to Cart</button>
           
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590004112/orange-imported-4-pcs-pack-approx-900-g-1100-g-product-images-o590004112-p590087385-0-202409171903.jpg?im=Resize=(360,360)" alt="Oranges">
            <h3>Oranges-1kg</h3>
            <p class="price">Rs.68</p>
            <button onclick="addToCart(44,'Oranges',68)">Add to Cart</button>
           
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590001268/pomegranate-economy-6-pcs-pack-product-images-o590001268-p590485022-0-202408070949.jpg?im=Resize=(360,360)" alt="pomegranate">
            <h3>pomegranate</h3>
            <p class="price">Rs.226</p>
            <button onclick="addToCart(45,'pomegranate',226)">Add to Cart</button>
           
        </div>
         <div class="product-card" data-category="fruits">
            <img src="https://2.imimg.com/data2/HF/FC/MY-1420834/banana-250x250.jpg" alt="Bananas">
            <h3>Bananas</h3>
            <p class="price">Rs.70</p>
            <button onclick="addToCart(46,'Bananas',70)">Add to Cart</button>
           
        </div>
         <div class="product-card" data-category="fruits">
            <img src="https://5.imimg.com/data5/SELLER/Default/2024/4/407882398/SM/VQ/FJ/159824908/fresh-strawberry-fruit-500x500.jpg" alt="Strawberrys">
            <h3>Strawberrys</h3>
            <p class="price">Rs.210</p>
            <button onclick="addToCart(47,'Strawberrys',210)">Add to Cart</button>
           
        </div>
		 <div class="product-card" data-category="fruits">
            <img src="https://tiimg.tistatic.com/fp/2/007/789/pure-and-fresh-sweet-and-juicy-common-cultivated-green-watermelon-850.jpg" alt="Watermelons">
            <h3>Watermelon-1kg</h3>
            <p class="price">Rs.30</p>
            <button onclick="addToCart(48,'Watermelons',30)">Add to Cart</button>
           
        </div>
		 <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/rvcjchox9r/xolda-dragon-fruit-seed-15-per-packet-product-images-orvcjchox9r-p607303446-0-202401120008.jpg?im=Resize=(360,360)" alt="Dragon-fruit">
            <h3>Dragon-fruit</h3>
            <p class="price">Rs.75</p>
            <button onclick="addToCart(49,'Dragon-fruit',75)">Add to Cart</button>
           
        </div>
		 <div class="product-card" data-category="fruits">
            <img src="data:image/jpeg;base64,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" alt="Custard-Apple">
            <h3>Custard-Apple</h3>
			<p class="price">Rs.144</p>
            <button onclick="addToCart(50,'Custard-Apple',144)">Add to Cart</button>
           
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590009674/kiwi-imported-3-pcs-pack-product-images-o590009674-p590317377-0-202408070949.jpg?im=Resize=(360,360)" alt="Kiwis">
            <h3>Kiwis</h3>
            <p class="price">Rs.229</p>
            <button onclick="addToCart(51,'Kiwis',229)">Add to Cart</button>
           
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590000070/pineapple-queen-1-pc-approx-700-g-1200-g-product-images-o590000070-p590000070-0-202409041925.jpg?im=Resize=(360,360)" alt="Pineapples">
            <h3>Pineapples</h3>
            <p class="price">Rs.85</p>
            <button onclick="addToCart(52,'Pineapples',85)">Add to Cart</button>
           
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590003068/sapota-6-pcs-pack-approx-450-g-550-g-product-images-o590003068-p590309513-0-202409271101.jpg?im=Resize=(360,360)" alt="Blueberrys">
            <h3>Sapota</h3>
            <p class="price">Rs.129</p>
            <button onclick="addToCart(53,'Sapota',129)">Add to Cart</button>
           
        </div>
        <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/rvqdzxcgba/namelix-art-organic-original-natural-papaya-soap-base-500-g-pack-of-3-product-images-orvqdzxcgba-p600155998-0-202304041814.jpg?im=Resize=(360,360)" alt="Papayas">
            <h3>Papaya</h3>
            <p class="price">Rs.56</p>
            <button onclick="addToCart(54,'Papayas',56)">Add to Cart</button>
           
        </div>
        <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590009518/mango-totapuri-4-pcs-approx-1200-g-1400-g-product-images-o590009518-p590177429-0-202408070949.jpg?im=Resize=(360,360)" alt="Mangos">
            <h3>Mangos</h3>
            <p class="price">Rs.37</p>
            <button onclick="addToCart(55,'Mangos',37)">Add to Cart</button>

         </div>
        <div class="product-card" data-category="fruits">
            <img src="https://5.imimg.com/data5/SELLER/Default/2022/4/BU/SH/ZU/150637998/soursop-cancer-fruit-png-500x500.png">
            <h3>Soursop</h3>
            <p class="price">Rs.73</p>
            <button onclick="addToCart(56,'Soursop',73)">Add to Cart</button>
           
        </div>
         <div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/40159879_6-super-saver-brown-chana.jpg?tr=w-154,q-80" alt="BengalGram">
            <h3>Bengal Gram</h3> 
            <p class="price">Rs.149</p>
            <button onclick="addToCart(57,'BengalGram',149)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bigbasket.com/media/uploads/p/m/40159943_3-super-saver-urad-black-splitchilka.jpg?tr=w-154,q-80" alt="BlackGram">
            <h3>Black Gram</h3> 
            <p class="price">Rs.119</p>
            <button onclick="addToCart(58,'BlackGram',119)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/30000276_7-bb-royal-til-black.jpg?tr=w-154,q-80" alt="SesameSeeds">
            <h3>Sesame Seeds</h3> 
            <p class="price">Rs.189</p>
            <button onclick="addToCart(59,'SesameSeeds',189)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/40159879_6-super-saver-brown-chana.jpg?tr=w-154,q-80" alt="ChanaDal">
            <h3>Chana Dal</h3> 
            <p class="price">Rs.176</p>
            <button onclick="addToCart(60,'ChanaDal',176)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bigbasket.com/media/uploads/p/m/40293069_2-bhagirathi-horse-gram-flour-ready-mix.jpg?tr=w-154,q-80" alt="HorseGramFloor">
            <h3>Horse Gram Floor</h3> 
            <p class="price">Rs.149</p>
            <button onclick="addToCart(61,'HorseGramFloor',149)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/40159888_6-super-saver-green-moong-whole.jpg?tr=w-154,q-80" alt="GreenGram">
            <h3>Green Gram</h3> 
            <p class="price">Rs.67</p>
            <button onclick="addToCart(62,'GreenGram',67)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bigbasket.com/media/uploads/p/m/40292147_4-fresho-organic-sprouts-horse-gram.jpg?tr=w-154,q-80" alt="HorseGram">
            <h3>Horse Gram</h3> 
            <p class="price">Rs.94</p>
            <button onclick="addToCart(63,'GreenGram',94)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bigbasket.com/media/uploads/p/m/900448731_2-truefarm-organic-red-kidney-beans.jpg?tr=w-154,q-80" alt="HorseGram">
            <h3>Horse Gram</h3> 
            <p class="price">Rs.85</p>
            <button onclick="addToCart(64,'HorseGram',85)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/40159888_6-super-saver-green-moong-whole.jpg?tr=w-154,q-80" alt="KidneyBeans">
            <h3>Kidney Beans</h3> 
            <p class="price">Rs.144</p>
            <button onclick="addToCart(65,'KidneyBeans',144)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.jiomart.com/images/product/original/491349597/tata-sampann-unpolished-masoor-dal-1-kg-product-images-o491349597-p491349597-0-202406142010.jpg?im=Resize=(360,360)" alt="MasoorDal">
            <h3>Masoor Dal</h3> 
            <p class="price">Rs.196</p>
            <button onclick="addToCart(66,'MasoorDal',196)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.jiomart.com/images/product/original/492851038/good-life-unpolished-moong-dal-500-g-product-images-o492851038-p591219162-0-202301252154.jpg?im=Resize=(360,360)" alt="MoongDal">
            <h3>Moong Dal</h3> 
            <p class="price">Rs.89</p>
            <button onclick="addToCart(67,'MoongDal',89)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.jiomart.com/images/product/original/491187260/good-life-chitra-rajma-500-g-product-images-o491187260-p491187260-0-202205191754.jpg?im=Resize=(360,360)" alt="Rajma">
            <h3>Rajma</h3> 
            <p class="price">Rs.88</p>
            <button onclick="addToCart(68,'Rajma',88)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bigbasket.com/media/uploads/p/m/40218656_2-pristine-fields-of-gold-organic-toor-dalred-gram-split.jpg?tr=w-154,q-80" alt="RedGram">
            <h3>Red Gram</h3> 
            <p class="price">Rs.76</p>
            <button onclick="addToCart(69,'RedGram',76)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/40274488_2-bb-royal-roasted-chana-whole-rich-in-protein.jpg?tr=w-154,q-80" alt="RoastedChana">
            <h3>Roasted Chana</h3> 
            <p class="price">Rs.62</p>
            <button onclick="addToCart(70,'RoastedChana',62)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/30004949_4-double-horse-soya-chunks-nano.jpg?tr=w-154,q-80" alt="SoyaChunks">
            <h3>Soya Chunks</h3> 
            <p class="price">Rs.51</p>
            <button onclick="addToCart(71,'SoyaChunks',51)">Add to Cart</button>
</div>
<div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/10000487_10-bb-royal-soya-bean.jpg?tr=w-154,q-80" alt="SoyaBeans">
            <h3>Soya Beans</h3> 
            <p class="price">Rs.68</p>
            <button onclick="addToCart(72,'SoyaBeans',68)">Add to Cart</button>
</div>
    </div>



<footer class="section-p1">
  
<div class="col">
<a href="#"><img class="mainlogo" src="mylogo.jpg.png" alt="Logo"></a>
    <h4>Contact</h4>
     <p><strong>Address:<strong>Kbn college, Kotpeta, Vijayawada</p>
    <p><strong>Phone:</strong>+23456876199, +23458903120</p>
    <p><strong>Hours:</strong>10.00 - 18.00, Mon - Sat</p>
       </div>
      
    <div class="sec">   
    <div class="col">
      <h4>About</h4>
      <a href="#">About Us</a>
      <a href="#">Delivery Information</a>
      <a href="#">Privacy Policy</a>
      <a href="#">Terms and Condition</a>
      <a href="#">Contact Us</a>
   </div>
    
    <div class="col">
      <h4>My Account</h4>
                    <a href="login.jsp">Sign In</a>
                    <a href="register.jsp">Signup</a>
      <a href="#">View Cart</a>
      <a href="#">My Account</a>
      <a href="#">My Wishlist</a>
      <a href="#">Track my Order</a>
      <a href="#">Help</a>
        
    </div>
    
    <div class="col install">
      <h4>Install App</h4>
      <p>From App Store or Google Play</p>
 
      <div class="row">
      <img src="https://i.postimg.cc/Y2s5mLdR/app.jpg" alt="">
      <img src="https://i.postimg.cc/7YvyWTS6/play.jpg" alt="">
    </div>
    <p>Secured Payment Gateways</p>
    <img src="https://i.postimg.cc/kgfzqVRW/pay.png" alt="">
       </div>
  </div>
  
  <div class="coypright">
      <p> © 2023 All rights reserved! made by Team 12 </p>
    </div>
  
 </footer>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
/*	const bar = document.getElementById('bar')
const close = document.getElementById('close')
const nav = document.getElementById('navbar')

if (bar) {
  bar.addEventListener('click', () => {
    nav.classList.add('active')
  })
 
 if (close) {
   close.addEventListener('click', () => {
     nav.classList.remove('active')
   })
 }
}
 */ 


    </script>
    <script>
             let cart = [];

        function toggleCart() {
            const cartOverlay = document.getElementById("cart-overlay");
            cartOverlay.style.display = cartOverlay.style.display === "flex" ? "none" : "flex";
        }

        function addToCart(id, name, price) {
    console.log("Adding to cart:", { id, name, price }); // Debugging: Log added item
    let item = cart.find(i => i.id === id);
    if (item) {
        item.quantity++;
    } else {
        cart.push({ id, name, price: parseFloat(price), quantity: 1 });
    }
    updateCart();
}


        function updateCart() {
            const cartItems = document.getElementById("cart-items");
            cartItems.innerHTML = "";
            let total = 0;
            cart.forEach(item => {
                total += item.price * item.quantity;
                cartItems.innerHTML += `
                    <div class="cart-item">
                        <span>${item.name} (x${item.quantity}) - ₹${item.price * item.quantity}</span>
                        <div>
                            <button onclick="changeQuantity(${item.id}, -1)">-</button>
                            <button onclick="changeQuantity(${item.id}, 1)">+</button>
                            <button onclick="removeFromCart(${item.id})">🗑</button>
                        </div>
                    </div>`;
            });
            document.getElementById("cart-count").innerText = cart.length;
            document.getElementById("cart-total").innerText = total;
        }

        function changeQuantity(id, delta) {
            let item = cart.find(i => i.id === id);
            if (item) {
                item.quantity += delta;
                if (item.quantity <= 0) removeFromCart(id);
            }
            updateCart();
        }

        function removeFromCart(id) {
            cart = cart.filter(i => i.id !== id);
            updateCart();
        }

        function clearCart() {
            cart = [];
            updateCart();
        }

        function buyNow() {
    if (cart.length === 0) {
        alert("Your cart is empty!");
        return;
    }

    // Store cart data in localStorage so it can be accessed in shipping.jsp
    localStorage.setItem("cart", JSON.stringify(cart));
    
    // Redirect to the shipping page
    window.location.href = "shipping.jsp";
}
document.addEventListener("DOMContentLoaded", () => {
    filterProducts("all"); // Show all products by default
});

function filterProducts(category) {
    let products = document.querySelectorAll(".product-card");

    products.forEach(product => {
        let productCategory = product.getAttribute("data-category");

        if (category === "all" || productCategory === category) {
            product.style.display = "block";
        } else {
            product.style.display = "none";
        }
    });
}

window.onscroll = function () {
    showGoToTopButton();
};

function showGoToTopButton() {
    let button = document.getElementById("goToTopBtn");
    if (document.documentElement.scrollTop > 300) {
        button.style.display = "block"; // Show button after scrolling 300px
    } else {
        button.style.display = "none"; // Hide button when at the top
    }
}

function scrollToTop() {
    window.scrollTo({ top: 0, behavior: "smooth" });
}
    </script>
    </body>

</html>