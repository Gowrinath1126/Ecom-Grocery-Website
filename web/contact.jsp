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
    <title>Contact Us</title>
    <link rel="stylesheet" href="contact.css">
    <link rel="stylesheet" href="index.css">
    <style>
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
        <li><a href="about.jsp" class="active">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>

       <% if (userEmail == null) { %>
            <!-- Show Sign In and Sign Up if user is NOT logged in -->
            <li><a href="login.jsp">Sign In</a></li>
            <li><a href="register.jsp">Sign Up</a></li>
        <% } else { %>
            <!-- Show Logout if user IS logged in -->
            <li>Welcome,<b> <b><%= userEmail %>!</b></b></li>
            <li><a href="logout.jsp"><button>Logout</button></a></li>
        <% } %>
      </ul>
    </div>
  </section>
<form class="my-form" action="contact_us.jsp" method="post">
  <div class="container">
    <h1>Get in touch!</h1>
    <ul style="list-style:none; padding:0;">
      <li>
        <select name="queryType" required>
          <option selected disabled>-- Please choose an option --</option>
          <option value="FeedBack">Feedback</option>
          <option value="Business Deal">Business Deal</option>
          <option value="Other">Other</option>      
        </select>
      </li>
      <li>
        <div class="grid grid-2">
          <input type="text" name="name" placeholder="Name" required>  
          <input type="text" name="surname" placeholder="Surname" required>
        </div>
      </li>
      <li>
        <div class="grid grid-2">
          <input type="email" name="email" placeholder="Email" required>  
          <input type="tel" name="phone" placeholder="Phone">
        </div>
      </li>    
      <li>
        <textarea name="message" placeholder="Message" required></textarea>
      </li>   
      <li>
      <div class="checkbox-wrapper-1">
  <input id="example-1" class="substituted" type="checkbox" aria-hidden="true" />
  <label for="example-1">I have read and agreed with <a href="">the terms and conditions.</a></label>
</div>        
      </li>  
      <li>
        <div class="grid grid-3">
          <div class="required-msg">REQUIRED FIELDS</div>
          <button class="btn-grid" type="submit" disabled>
            <span class="front">SUBMIT</span>
          </button>
          <button class="btn-grid" type="reset" disabled>
            <span class="front">RESET</span>
          </button> 
        </div>
      </li>    
    </ul>
  </div>
</form>

<footer>
  <div class="container">
    <small>Made with <span>❤</span> by <a href="http://georgemartsoukos.com/" target="_blank">Team 12</a>
    </small>
  </div>
</footer>

<script>
const checkbox = document.querySelector('.my-form input[type="checkbox"]');
const btns = document.querySelectorAll(".my-form button");

checkbox.addEventListener("change", function() {
  const checked = this.checked;
  for (const btn of btns) {
    checked ? (btn.disabled = false) : (btn.disabled = true);
  }
});
</script>


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
