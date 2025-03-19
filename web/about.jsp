<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    String userEmail = (sessionObj != null) ? (String) sessionObj.getAttribute("user") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>About Us | Fresh Basket</title>
  <link rel="stylesheet" href="index.css"
  <!-- Font Awesome for social media icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="style.css">
  <script src="https://kit.fontawesome.com/dad03e859c.js" crossorigin="anonymous"></script>

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Alkatra&family=Berkshire+Swash&family=Comic+Neue:wght@700&family=Gentium+Book+Plus:wght@400;700&family=Lato:wght@400;700;900&display=swap" rel="stylesheet">

  <style>
   * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f4f4;
      color: #333;
  margin: 0;
  padding: 0;
    }
    
    /* New Header Section */
   #header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 50px; /* Reduce padding */
  background-color: #e8eaf6;
  width: 100%;
  margin: 0; /* Ensure no extra margins */
  height: 80px; /* Adjust height as needed */
}


#header .mainlogo {
  max-width: 100px;
  height: 80;
}
.navbar a.active {
  font-weight: bold;
  color: #007bff;
  border-bottom: 2px solid #007bff;
}



#navbar {
  list-style: none;
  display: flex;
  gap: 30px;
}

#navbar li {
  display: inline-block;
}

#navbar li a {
  text-decoration: none;
  color: black;
  font-size: 1.1em;
  font-weight: 500;
  padding: 5px 10px;
}



    /* Full-width section styling */
    section {
      padding: 80px 30px;
      margin: 60px auto;
      width: 100%;  /* Ensures the section takes up 100% of the page width */
      background-color: #fff;
      box-shadow: 0 10px 50px rgba(0, 0, 0, 0.1);
      border-radius: 15px;
      transition: transform 0.3s ease-in-out;
      animation: fadeIn 1s ease-out;
    }

    @keyframes fadeIn {
      0% {
        opacity: 0;
        transform: translateY(50px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    section h2 {
      text-align: center;
      font-size: 3em;
      color: #4CAF50;
      margin-bottom: 30px;
      font-weight: 700;
    }

    section p {
      font-size: 1.2em;
      color: #555;
      line-height: 1.8;
      text-align: justify;
      margin-bottom: 25px;
      letter-spacing: 0.5px;
    }

    .about-values {
      display: flex;
      justify-content: space-between;
      margin-top: 50px;
      gap: 30px;
    }

    .value-box {
      background-color: #8BC34A;
      padding: 30px;
      border-radius: 15px;
      color: #fff;
      width: 30%;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.3s ease;
    }

    .value-box:hover {
      transform: scale(1.05);
    }

    .value-box h3 {
      font-size: 2em;
      margin-bottom: 15px;
    }

    .value-box p {
      font-size: 1.2em;
    }

    /* Team Section Styling */
    #team {
      background-color: #f9f9f9;
      padding: 80px 30px;
      width: 100%;  /* Ensure the team section spans the full width */
    }

    .team-container {
      display: flex;
      justify-content: space-around;
      gap: 30px;
      flex-wrap: nowrap;
      overflow-x: auto;
      width: 100%;  /* Full width for the container */
    }

    .team-member {
      width: 250px;
      background-color: #fff;
      padding: 20px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      border-radius: 15px;
      transition: transform 0.3s ease;
      flex-shrink: 0;
    }

    .team-member img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      margin-bottom: 15px;
      transition: transform 0.3s ease;
    }

    .team-member h4 {
      font-size: 1.3em;
      color: #333;
    }

    .team-member p {
      font-size: 1.2em;
      color: #777;
      font-weight: 500;
      text-align: center
      
    }

    .team-member:hover {
      transform: scale(1.05);
    }


    /* Social Media Icons */
    .social-icons {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin-top: 15px;
    }

    .social-icon {
      text-decoration: none;
      font-size: 1.4em;
      color: #333;
      transition: color 0.3s ease;
    }

    .social-icon:hover {
      color: #4CAF50;
    }

    .social-icon.facebook:hover {
      color: #3b5998;
    }

    .social-icon.linkedin:hover {
      color: #0077b5;
    }

    .social-icon.twitter:hover {
      color: #1da1f2;
    }

    

    @media screen and (max-width: 768px) {
      .team-container {
        flex-wrap: wrap;
        justify-content: center;
      }

      .team-member {
        width: 250px;
        margin-bottom: 30px;
      }
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
  </style>
</head>

<body>

  <!-- Header Section -->
  <section id="header">
    <img src="mylogo.jpg.png" class="mainlogo">
    <div>
      <ul id="navbar">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="products.jsp">Shop</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
                <% if (userEmail == null) { %>
            <!-- Show Sign In and Sign Up if user is NOT logged in -->
            <li><a href="login.jsp">Sign In</a></li>
            <li><a href="register.jsp">Sign Up</a></li>
        <% } else { %>
            <!-- Show Logout if user IS logged in -->
            <li>Welcome,<b> <%= userEmail %>!</b></li>
            <li><a href="logout.jsp"><button>Logout</button></a></li>
        <% } %>
      </ul>
    </div>
  </section>

 <!-- About Us Section -->
  <section>
    <h2>Our Story</h2>
    <p>At Fresh Basket, we believe that healthy living starts with the food we eat. Founded with a vision to provide fresh, organic, and locally sourced groceries at your fingertips, Fresh Basket aims to revolutionize the way you shop for food online.</p>

    <p>Our journey began with a simple goal: to make healthy grocery shopping more convenient and affordable. With a dedicated team of farmers, suppliers, and experts, we bring you the best produce, grains, snacks, beverages, and more. We pride ourselves on offering quality products, ensuring each item meets our high standards before reaching your doorstep.</p>

    <h2>Why Choose Us?</h2>
    <p>Whether you're a busy professional, a health-conscious individual, or simply someone who loves great food, Fresh Basket makes it easy to access the finest products. From fresh fruits and vegetables to pantry staples and premium snacks, we’ve got everything you need to live a healthier lifestyle.</p>

    <!-- Core Values -->
    <div class="about-values">
      <div class="value-box">
        <h3>Quality</h3>
        <p>We deliver only the highest quality groceries that meet your dietary needs and preferences.</p>
      </div>
      <div class="value-box">
        <h3>Convenience</h3>
        <p>Shop for all your grocery needs in one place, with fast delivery right to your door.</p>
      </div>
      <div class="value-box">
        <h3>Sustainability</h3>
        <p>We focus on eco-friendly packaging and support sustainable farming practices to protect our planet.</p>
      </div>
    </div>
  </section>

  <!-- Team Section -->
  <section id="team">
    <h2>Meet Our Team</h2>
    <div class="team-container">
      <!-- Team Member 1 -->
      <div class="team-member">
        <img src="gowrinath.jpg">
        <h4>Yasoda<br> Gowrinath</h4>
        <p>Team Leader</p>
        <div class="social-icons">
          <a href="#" class="social-icon facebook" target="_blank"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social-icon linkedin" target="_blank"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" class="social-icon twitter" target="_blank"><i class="fab fa-twitter"></i></a>
        </div>
      </div>

      <!-- Team Member 2 -->
      <div class="team-member">
        <img src="jaswanth.png">
        <h4> <br>Jaswanth</h4>
        <p>Team Member</p>
        <div class="social-icons">
          <a href="#" class="social-icon facebook" target="_blank"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social-icon linkedin" target="_blank"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" class="social-icon twitter" target="_blank"><i class="fab fa-twitter"></i></a>
        </div>
      </div>

      <!-- Team Member 3 -->
      <div class="team-member">
        <img src="karthik.png">
        <h4><br>Karthik</h4>
        <p>Team Member</p>
        <div class="social-icons">
          <a href="#" class="social-icon facebook" target="_blank"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social-icon linkedin" target="_blank"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" class="social-icon twitter" target="_blank"><i class="fab fa-twitter"></i></a>
        </div>
      </div>


      <!-- Team Member 5 -->
      <div class="team-member">
        <img src="sriram.jpg">
        <h4><br>Sriram</h4>
        <p>Team Member</p>
        <div class="social-icons">
          <a href="#" class="social-icon facebook" target="_blank"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social-icon linkedin" target="_blank"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" class="social-icon twitter" target="_blank"><i class="fab fa-twitter"></i></a>
        </div>
      </div>
    </div>
  </section>



        <!-- Footer Section -->
        <footer class="section-p1">
            <div class="col">
                <a href="#"><img class="mainlogo" src="mylogo.jpg.png" alt="Logo"></a>
                <h4>Contact</h4>
                <p><strong>Address:</strong> One Town, Kotha peta, Vijayawada-01</p>
                <p><strong>Phone:</strong> +23456876199, +23458903120</p>
                <p><strong>Hours:</strong> 24/7</p>
                <div class="follow">
                    <h4>Follow Us</h4>
                    <div class="icon">
                        <i class="fab fa-facebook-f"></i>
                        <i class="fab fa-instagram"></i>
                        <i class="fab fa-twitter"></i>
                        <i class="fab fa-youtube"></i>
                        <i class="fab fa-pinterest-p"></i>
                    </div>
                </div>
            </div>
            <div class="sec">   
                <div class="col">
                    <h4>About</h4>
                    <a href="About.jsp">About Us</a>
                    <a href="#">Delivery Information</a>
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms and Condition</a>
                    <a href="contact.jsp">Contact Us</a>
                </div>
                <div class="col">
                    <h4>My Account</h4>
                    
                    <a href="login.jsp">Sign In</a>
                    <a href="register.jsp">Signup</a>
                    <a href="">Track my Order</a>
                    <a href="">Help</a> 
                </div>      
                    <div class="col install"> 
                        <h4>Install App</h4>   
                        <p>From App Store or Google Play</p>
                        <div class="row">  
                            <img src="https://i.postimg.cc/Y2s5mLdR/app.jpg" alt="App Store"> 
                            <img src="https://i.postimg.cc/7YvyWTS6/play.jpg" alt="Google Play">   
                        </div>           
                        <p>Secured Payment Gateways</p>
                        <img src="https://i.postimg.cc/kgfzqVRW/pay.png" alt="Payment">   
                    </div>          
            </div>
                    <div class="coypright">
                        <p>© 2025 All rights reserved! Made by Team 12</p> 
                    </div> 
        </footer> 
                    <!-- Font Awesome CDN -->
                    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" integrity=\"sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />  
                    <script>  
                        const bar = document.getElementById('bar');   
                        const close = document.getElementById('close'); 
                        const nav = document.getElementById('navbar');  
                        if (bar) {    
                            bar.addEventListener('click', () => {   
                                nav.classList.add('active'); 
                            });      
                        }
                        if (close) {
                            close.addEventListener('click', () => {
                                nav.classList.remove('active');    
                            });    
                        } 
                                                   </script>

</body>
</html>
