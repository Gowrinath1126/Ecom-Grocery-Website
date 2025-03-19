<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Check if user is logged in
    HttpSession Session = request.getSession(false);
    String user = (Session != null && Session.getAttribute("user") != null)
                  ? (String) Session.getAttribute("user")
                  : null;
%>
<%
    HttpSession sessionObj = request.getSession(false);
    String userEmail = (sessionObj != null) ? (String) sessionObj.getAttribute("user") : null;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Fresh Basket</title>
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="style.css">
        <script src="https://kit.fontawesome.com/dad03e859c.js" crossorigin="anonymous"></script>
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Alkatra&family=Berkshire+Swash&family=Comic+Neue:wght@700&family=Gentium+Book+Plus:wght@400;700&family=Lato:ital,wght@0,400;0,700;0,900;1,700&family=Lexend+Deca:wght@500&family=Lexend:wght@500&family=Montserrat:wght@500&family=Open+Sans:wght@500;800&family=Roboto:wght@100;400&family=Sue+Ellen+Francisco&family=Work+Sans:wght@400;700;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900;&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="index.css">
        <script>
        alert("Welcome, <%= user %>! 🎉");
    </script>
    </head>

    <body>
        <!-- Header Section -->
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
            <li>Welcome,<b> <%= userEmail %>!</b></li>
            <li><div class="profile-menu" onclick="toggleDropdown()">
            <img src="https://www.freeiconspng.com/uploads/am-a-19-year-old-multimedia-artist-student-from-manila--21.png" alt="Profile" class="profile-pic">
            <div class="dropdown" id="dropdownMenu">
                <a href="profile.jsp">Profile</a>
                <a href="#">Settings</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </div></li>
        <% } %>
                                       
                
                </ul>
            </div>
        </section>

        <!-- Hero Section -->
        <section id="hero">
            <h4>Trade-in-fair</h4>
            <h2>Super value saver</h2>
            <h1>On all Products</h1>
            <p>Save more with coupons and up to 70% off!</p>
            <a href="products.jsp"><button>Shop Now</button></a>
        </section>

        <!-- Feature Section -->
        <section id="feature" class="section-p1">
            <div class="fe-box">
                <img src="https://i.postimg.cc/PrN2Y6Cv/f1.png" alt="">
                <h6>Free Shipping</h6>
            </div>
            <div class="fe-box">
                <img src="https://i.postimg.cc/qvycxW4q/f2.png" alt="">
                <h6>Online Order</h6>
            </div>
            <div class="fe-box">
                <img src="https://i.postimg.cc/1Rdphyz4/f3.png" alt="">
                <h6>Save Money</h6>
            </div>
            <div class="fe-box">
                <img src="https://i.postimg.cc/GpYc2JFZ/f4.png" alt="">
                <h6>Promotions</h6>
            </div>
            <div class="fe-box">
                <img src="https://i.postimg.cc/4yFCwmv6/f5.png" alt="">
                <h6>Happy Sell</h6>
            </div>
            <div class="fe-box">
                <img src="https://i.postimg.cc/gJN1knTC/f6.png" alt="">
                <h6>F24/7 Support</h6>
            </div>
        </section>

        <a href="products.jsp"><button class="button-2" role="button">See More</button></a>
        <button id="goToTopBtn" onclick="scrollToTop()">⬆ Go to Top</button>
        <style>
             .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
        }
        .profile-menu {
            position: relative;
            cursor: pointer;
        }
        .profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid white;
        }
        .dropdown {
            display: none;
            position: absolute;
            right: 0;
            background: white;
            color: black;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            overflow: hidden;
            width: 150px;
        }
        .dropdown a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: black;
        }
        .dropdown a:hover {
            background: #ddd;
        }
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
            .button-2 {
                background-color: rgba(51, 51, 51, 0.05);
                border-radius: 8px;
                border-width: 0;
                color: #333333;
                cursor: pointer;
                display: inline-block;
                font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: 500;
                line-height: 20px;
                list-style: none;
                margin: 0;
                padding: 10px 12px;
                text-align: center;
                transition: all 200ms;
                vertical-align: baseline;
                white-space: nowrap;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                margin-left: 90%;
            }
            #product-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding: 20px;
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
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.product-card button:hover {
    background-color: #0056b3;
}

        </style>

        <!-- Product Container -->
        <main id="product-container">
        <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590004112/orange-imported-4-pcs-pack-approx-900-g-1100-g-product-images-o590004112-p590087385-0-202409171903.jpg?im=Resize=(360,360)" alt="Oranges">
            <h3>Oranges-1kg</h3>
            <p class="price">Rs.68</p>
            </div>
            <div class="product-card "data-category="vegetables">
            <img src="https://www.jiomart.com/images/product/original/590004109/tomato-country-1-kg-pack-product-images-o590004109-p590122468-0-202409171906.jpg?im=Resize=(360,360)" alt="tomato">
            <h3>Tomato 1KG</h3>                
            <p class="price">Rs.30</p>
            </div>
            <div class="product-card "data-category="vegetables">
            <img src="https://www.jiomart.com/images/product/original/590003541/bitter-gourd-500-g-product-images-o590003541-p590003541-0-202408070949.jpg?im=Resize=(360,360)" alt="bitter-gourd">
            <h3>bitter-gourd 1kg</h3>
            <p class="price">rs.54</p>
            </div>
            <div class="product-card" data-category="milk products">
            <img src="https://www.jiomart.com/images/product/original/491599835/britannia-milk-bread-400-g-product-images-o491599835-p590113086-0-202203150756.jpg?im=Resize=(360,360)"  alt="milk-bread-400-g">
            <h3>Milk Bread 400g </h3>
            <p class="price">Rs.57</p>
            </div>
            <div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/10000487_10-bb-royal-soya-bean.jpg?tr=w-154,q-80" alt="SoyaBeans">
            <h3>Soya Beans</h3> 
            <p class="price">Rs.68</p>
            </div>
            <div class="product-card " data-category="grocery">
            <img src="https://www.bbassets.com/media/uploads/p/m/40159888_6-super-saver-green-moong-whole.jpg?tr=w-154,q-80" alt="GreenGram">
            <h3>Green Gram</h3> 
            <p class="price">Rs.67</p>
            </div>
            <div class="product-card" data-category="milk products">
            <img src="https://www.jiomart.com/images/product/original/492365424/parle-agro-smoodh-chocolate-flavoured-milk-80-ml-tetra-pak-product-images-o492365424-p590707035-0-202305030227.jpg?im=Resize=(360,360)"  alt="smoodh-chocolate">
            <h3>Smoodh Chocolate</h3>
            <p class="price">Rs.10</p>
            </div>
            <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590003068/sapota-6-pcs-pack-approx-450-g-550-g-product-images-o590003068-p590309513-0-202409271101.jpg?im=Resize=(360,360)" alt="Blueberrys">
            <h3>Sapota</h3>
            <p class="price">Rs.129</p>
           
        </div>
            <!-- Repeat other product cards as needed -->
        </main>

        <!-- Banner Section -->
        <section id="banner" class="section-m1">
            <h4>Only For You</h4>
            <h2>Up to <span>150/- off</span> On Orders Above 500/-</h2>
            <a href="products.jsp"><button class="btn normal">Explore more</button></a>
        </section>

        <!-- New Arrivals Section -->
        <section id="product1" class="section-p1">
            <h2>New Arrivals</h2>
            <p>Summer Collections</p>
            <main id="product-container">
                <div class="product-card" data-category="fruits">
            <img src="https://tiimg.tistatic.com/fp/2/007/789/pure-and-fresh-sweet-and-juicy-common-cultivated-green-watermelon-850.jpg" alt="Watermelons">
            <h3>Watermelon</h3>
            <p class="price">Rs.30</p>
        </div>
		 <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/rvcjchox9r/xolda-dragon-fruit-seed-15-per-packet-product-images-orvcjchox9r-p607303446-0-202401120008.jpg?im=Resize=(360,360)" alt="Dragon-fruit">
            <h3>Dragon-fruit</h3>
            <p class="price">Rs.75</p>
        </div>
		 <div class="product-card" data-category="fruits">
            <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSEhIVFRUVFRUXFxUVFRUXFRUVFRUXFxUXFhUYHSggGBolHRUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGxAQGjAlHyUvLSstLS0tLS0rLS0tLSstLS0vLSs1LS0rLS0tLS0tLS0tLS0tLS0rLS0tLy0tLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAABAAIDBAUGB//EAEgQAAIBAgQDBgIIAwQGCwEAAAECEQADBBIhMQVBUQYTImFxgTKRFEJSYqGx0fAjweEVM3KSVIKTorKzJDRjdIOEwsPS4vEW/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAEDAgQFBv/EADERAAICAQMCBQICCwAAAAAAAAABAhEDEiExQVETYYGR8CIyBFIUMzRCcYKhscHR4f/aAAwDAQACEQMRAD8A9JpRTjTTXGdIIppFOmgRQAw0KcaYxpDOH7dooxFlnkeGEYEeJ5IKtO4g1zIxBtKwYZAW8Jj4RGwaNK73tjwv6RZWEDtbcOFmDtBynrXl+c27mS4GKQwYNOsiFPkRXDlwpzbv55DXsaVjGI90LlAYSQyCJMbMo051RxWGuo5JBABlmkaafhQwmJAdCvgIJJj6zDkfLzp+Mxt1iUJbLsZYmf6VPTpkJtUmx2OxWbIYPiUGdRrGp996htY1ipj6rCCw19jQtY8qoDAMARoRoBFT4a0L11FDnKd9NVXc1tY64MtLmLOh7BYGLj4mIEFF82aC3sIrtjerMwt5FUKgAUCABVgXga64qlRpKkWDcpneU0GnBa2McrU8GmqtSqlAAFGKeqU7LTER0oqXLQy0AMimxUuWgRQBEaUVJloZaQDIoRUkUCKAI4pU+KVAGwaQFNxN4W1Z22UT5nyHnVLh2Gv4lTduXbmHSfBbtd3mYdWLK1PrQuhfAppp2Gwy2pU3LlxjE94QxUT0AAn9Km+jT8Jn8DW9LFqRVIqJhVl7ZG9RMtZaGmVLgrne0nDFxCZWEMJho1H6iuouLVZ7FTlGzR5hiuGX7SZERWHPKok/PUexrLAxGs2LgPXKNfevWrmCBqu2AFT8JB6nlScPxDa90V/xfpWxwXhz2yfDqdzGp967z6EOlOXCjpW1FLhCUUjJw2HatC1YNX7dqpglao0VLdk1MtqpwtOinQiNUp4WnRRFMQAKMUaVAANNp9IigQyKUUYpRQMaRTYp9KKBDYoEU+KRFMCKKVSZaVKgJ+NYQ3bRVWyHMpkesEfjWvbuqqgLHhXQbxyqlfth1KnmIrJ4Xje7uXUvssoEhYIlYPiHqenSpyn4c7fXaxqmqNrA4fxZjtvJ5k/pV1mGUvzJ09KqYXFB/CpHpT8Zd0yjkNvKrxkqsw4tbE16dVB1Ikesa/P+VY9/EQNtOev8quY6+AVYGIg78qodorgt/wAQGFIlvTmQOdKc6sFGx1u5mE6UDWDh+OLevAWYNsJ4iu33ST16e9agxFTjJNGyzFDLUaXJqRWrQANum91UtKgQxUp2SnqKeBQMhy0stTRSimBDFCKlIoRQAyKUU+KBoENpU6KEUANilRijFADaBokUqAG0qdQoAE0aEUaAL71mcUwy3VKuPRh8Skagg1sMtV7tiaJxtUJHFYPE3cJfe44a6HRVLA6jIzFfD/rN86j4n23KqCh8eYBQ4jVmESSQdJ/Curv8NBrLx/Zazd+NAfUCubwWnszakyXifHbeT41DAkZsyhTAPU6DnXO8W7XW8Vh7bWyO9bIAm4tkHxyf3pFXMR2BwzgZgxA5Zmj5VNhOxuHtfCh9yaeiTX1MLZDwzEKqhVCqIGiqFnzgc61rQJqxh+F2xstXUsACrJCK9qyanVKnVKiu4i2glriKOrOqifc0+BBy0ooW7iuJRlcaaoysNRI1XyqQLQMSiiBRFIimIEUDTooUACKFNxN9LYzXHVABMuwUfjWPxDtThrSliXaN8qFf+ZlpNpchZtRQisPDdr8G6ki4wMkZShzGJMrlkMNDqDyrXwOMt3lz2nDrzI3B3hgdVOo0Mb0KSfAEsUqJoVoBpoRTjSpAMNKKcaFADYoGnUIoAEUqUUqBGrQIp1CtiGlaaUqSgaVAMK0wpUpNCaBkOSqOI4xZS4bRYlwJICsQNCQC0QJg1o3bgUSfbQk+wrz3ieNFtyxJuH4coEzBBPiEyCQB/rE1DLk0bIzKVD+LcYuHM+W44GwRHK2wASYULBiAZJkxtpFYZ4beW33jMiM4koviMGYkzAjTQGNY9NS/j2xKZ1y2rYDqQTqSuZdAPqiT005b1mvdfM2R0C5TnFwOsRGVhCkMQMwOsa76QOCbk35knKxcPxndwUv3Q2gYqETMQeYHLXnm3NdPwrtiM4tYhYzEBbum5MDOAAMusZh023Nce/DnAIzIZDDwFifECBoygTrUAtW/CBmiWnxMTOxmdtvh8qcMkob36CUmt0ezEcqFcr2b7TqV7q/4TbAVHAY51UAeIanNpvz9q2LvaDDKCS7af9nc57RIiTXoRyxkrTOmNyWpcGkK5/inaa2LZbDMl5g+Q7lV0mSNM242MVi8V49fxOYWLcWIKkXCqZydgTrmGhML4YiTrWRgLFwWUFu1oFaYy5XKuylgS0ySBuPTasSy7bEpT7EeEupiP+kXBnu53PigMCHyoGQHTYfFOh2p13ENcdRkNx2G4GUgoAWMzAHOfOOlMwF4JhralQzA3HYMgIDXHe4VBIPwj56elOwmPS24i3/eZ1JGdyotw2igEhJaDGxy+3NKm6MXuxr3yq5byHPmZVBId2SSbeqzrlMR5Vn8PutPgZ7bKdG8WcAE67giRB+VW794kO+cAqCQ4cGCAGBJXodI5yRUKzfAc5kbJmUww1AB57rrBrD23+IaZ6F2T4q+ItsLsF7TBS66BwZgleTeEgxpsRvW1XmXBuK3LFx2TViUNxZ8DZQZUjYeRERPz9LsXQ6q67MARO8Hr513Yp6tnyiq7MdFKKNKqmhsUIp5FNNADaFOIppFACpUqVIDUNA0mNNJrbZmgmhRoUhiNR3bqqCzEBRuTsBT7jgAkkADUkwAB1JNcj2g4qtxkVZ7te8JYkgMwAiF5xynrUsuRQjYO6syuO427iVuhDlaIzElcikFhl+yY2XfUbTNZnD8HZe2ge53r2lgXNVW4QzpJGaXCiFzQJ1qW/buG2qXVJaPEYbJmLO/dsSPih1kTusaxBzOEXJvMrqwSz3jI7eFVuPlVR4hGYZGImQD6CuG3T97JO+CXCcVWxlQgJazqGEKgQlvi0iIJBMnYk0zHXSHDKSwJDSDmBnQHN6Tp602xlOJtAqCWzhRnLIbotM1twCYG222u0xRx4kkhLeZT4cyAMxUiQxA+EkbGeegiltSslsZ5vlGfwnuw3hYKckgCfGNIzTEnpT7tySH2DDUkGJG3w7GJ35RVvFYwMVdR4HQESFEhpITKNo1ERWfiL/dXco0UgMojKBGjKBtEgnTYMBSSTfAdy6lxldCVMSgJmROYgjrOUjl08xVjtDxEKy4YKCMves0yFRS0gCdzkMz1Eb6Zr4qRpC5pI11HMecjw/MU/jmFe8UxK+MPayMsayGnpESWBPLLVMK3pnRjm1jkl5f6ZY4PxNXDoLkyc4B0JlQoJERAIGmmw05U84tWshJnIXUiYlu9YxoNBBH56VY7Pdn8Q9nKqWkDOxuO5k6GAuVVIYwBzP41fxHZCLa2zDFRGcKUGfUsRlOkliYJquSK07E/DlLhHP4W8Atyc7RfuALm8KqEttAB0BJP+9VqwgUNkYl5BJHhHdEr8In7Y8Wu+UmARVbBYdgLllUY+JrivA8auqqwBgZj4V25EdKfh8PJg51KEszlQAikRBB0YMQNBsQCak0/QWlgxOKKxcIVspDBmRWJX66sSJ0DSD1ArWa+zCCZkxMkHWQSDy+KZ38qp4jD2Lmeykq5ULmaMpLZTEj4dgJ5U2zaZoKPIA+AhhJBAgiNwZB13FJUPTxTK+HshTmXZs2bUDMQSJ8m0IMb6mvTOzGNW7YAUEG0e6YHXVVVpBgaEONOX4nyvCWrqqQyMCpy7ECCQzOJHw6nXbUV13Zji64VWRlLK7Ziy7qcoGx30A0nlVMP0z3KQjJuju4pRUOExdu6ua2wYeW4PQjcH1qaa7jQKUUZoUANihFOmhQA2lTqVAF40KdTSaADUN++qKXYwqiSf3zp5rme2GIJC2Vj7bjqNkHzBMelZlLSrNwjqdGVxbjb3W8UqgPhUcgObdW/LlUEllEGAzAMYmFzjN6TO568t6zcx2M+nMfOnWLkSFgyIAOynkSIJiNNOvKuDPGUlfU6MsLhSLXGLgUpcYyLTIxWel3M7ZeoAFR4Ru7xDKxGW4yIhMtDjKQsnkfEsffFXLqXFN0vbBF62kHR0BQtMef8Rzr0kxWRjktPhkBTKyjIUtEKSyQhObUCQoOmvjBrli9qbPPlyQ9pMuR2EZlDlGgTmtDMGDDX4kmR507jGHEy137EZkD5QVBgZSp0yjQk7mtPjuFsPmZWYI8gFCIKFBBEgkjxHmOXvzfEeIZ8iOuR0tqumqPl0lIE6D6pMjMACYmtwbapO6M0QYa0CLgN05VJaQEAm5DnLI0Bzbax+NVcWiyCXY5WYCAoIzZT4gdDoNxGoorcAzLBDs3hUgqSrIqrk+9HLfy1rouEdiXZFu3i05lIsohdjqR42BgSDqB+WldEU7v/CNKMm9jHwHCWvsv0bOcwyqp1DldSVM6LvJPOekD0Pg3ZO1aUC4TcZQdASEnxFzAhiJk9NQI3rewHB7dkB1VbVxhlOYjOVkNlmd5A2mNhVgWVIMHNEg7iDoSCR9321HrXVHFSuRWKS45KlpkVoGgEARoABsqACAOWlTjJdPd5SQpBaBG+4JHI9Ky7+DvM+VWVVABzxLMCSBzgHQ8q0sIwspkWfMk6k899T71VRsHPcg4/hg65Pq/iuugDETXlfE7j2rjK5Zhb+sCTmssRmZT92J23Q9a9g+jB4NwGJzdNByPrXKdteEpcU2xagiSrWyFORpDT9oSJgzBE+dc2WCT1BKKkr6nFJclwAeeh3AygmQSTp4iJnmNd6bw5mt4h1cxD3TB18JctIIgczUNu+iAA20DLOoEDNAPLcEMDr1FX8VfRrLNAVkBZWBUlT3gA0mfEGK/j0qVJP8Aic6Lly9LZs0FEUZhDeLxEhvulSPmdeRmuOxAJEEjQaaLAifzqhgHFx1nw5tmEQYiSB0mCfTzqwdTAIIBjUmd9D71mKbZ1fht5X2Bh7ty22e05RhppzHQg6EeRrsOBdpVvEW7kJdO0fA56LOzeXPlXHXY56ev7/flULD8Pn+/SuiEmjqnBSPVc1Ka53s1xo3lKOf4lsCSd3TYN6jY+oPOtwPXQnZyNNOmTTQqPPRzUxD6VMzUqKA0WpppxFNoYAeuD7RXT9Ju+WXbcAIu4PLfXUeYruia4ztZai7m6xrMEMOatyMD8Kll4L4PuMhyGGuvQ/vaoLtojlI8vi5zpSJjXX1A/wCJBt/iXTqtSJfGgO0SNojqp5jzEjXltXPuuDqH4XidxSkS2V/DqNnBQgg6R4p9jVLG4mwlxTcVchuN3yjMHEgqhhTplPi8wpgEmrGItSCy7+X5MvTzG+m9Yb451uBiMzJ9S5BBXbRiNvMbHpUHi3uPscuXB1ibmNUG0i2WXJEAM2bKGaQ2YTKjpyG0aVzuDvzcPiAYL/DYlVUsRDBjsDzGusHnExcT4yrrkByDLEZTI1BHKCdORg1XxfHrbqAoW2dZQLlUanaBEaj8KUMU6drk5aa5Nbs1hjcxGdxJQAqOZuO0IR5CGM9Qtev8LtHKiFg3MkTAA10A08UxrsB714P2c4jlxdlUuEZ3CPA0KkyRr6QD1r3jgNkmwbhYy+UhtPhyDL1G0eldmGGme/YcWkmjL41w22+I7y54oEAGYHkPs+1a9iyba97AkADLtnQSQAObCWInqRpmJDmRF8ZMkDQDmQNSSKjw5a8wzSFAkkbb7D8a629S356CX0srcQEgXbUsQGZCpHjH1k12kDY7NB5VbwL22RLi+IOoYFt4I+zyPlUeM+I3EtlrakB1QeNfCfHbUasdBKjU6HkZPAcQua7btlXWTcUDKGTMQLismhXx5jB1lmB2rEeaZt7q0XHYnSDr5aDzNZXGMASCM+URvynrB30J005e22GeYygep/SqPGLLGy8nUGRHQQT66g/hRliqDG9zxbtfgO6xGUEZSsZthmDToBz8YmoFS0UbvruUaSR9kMGA28XwgUe3yubiJB0N1swbcsVUrO5jICSd81c6lqfikx1kkfOuXHHVBO/liUGzb4biIX4mBiIBECRBy7k+526Vp4a9rv8Av0P8qwbFojYSNNwT+Woq/aUnfSOvn0I1quldDoxrT0NZb2uonoenqN6mF0ER/wDn9DWdbc7H8d/Y1KrcmG3qPl1rLRZM0+F3+7v23H2gp65X8JB+c+wrvFevN8KmZ0AP10310zCda9BRq3jI5lui2GpwNQpUq1UgPzUabRoA1jTGFPNNNNgiNqwOP4TMDIMaSQAY/GZkDauhIqK6vlPUdRU8ibWxXE0pHmd6w1ttDmHI/v4T5fKahPynUgyVJHMqNj99dRua7vHcLRxoI09o6a8vwrleJcMZCZBjr+9j+55VzXZ1mMbpG07SBOoHMqy6Ouu46iQDrUd11ceL/MB5aTGw21GhipL1j858ifMaEHXcEN67VXzD62hJ0YA69ZjfnqIPVSBrNq9zSdFHG4Eeo67jz9PWsu7wyDty6H9/y9K6UMR7idhlaOem/qPcCq92zm+HQ75Tt6qR+Y89DTjkaFLGpHNHA6yPCRqGEhlI1BEecGRXsHCePd7bVs+nc25HLNAzq0bNKx5Qfbzq5ZmdNR7Ee38xUaM9syjldQZU6ErzI57b/lVJSciMsW9o9f4Ze71QTnCAbkfMTFaWOxGRMiaARr1rh+GdqB3dq2pAaLaEMPCdIInYyRz2mtvhuMN66ACSqE5m0iRBABGka7b7VuGStkQlG2dZwa3FsTuZY+p3/SsnuwuIa5bADFTMAAMFKjWBMxHP6g852M4Fs+Y/OsS1iP4yruSj6DU8jt7V0OSpIlTNb6fIn8NN6x+0WJbKsayGlfQA78hy96jGKAvBd1bfTSR/U1hdo71zOQLkJdzBZAJGUnMFb7Jld9tY8+fNkenk2koqzh+090M1sEjMO8JI++VgT6q2nnWYLXlPnMH51p8dBe6TaghUCFDrmILEmdplonYxvVLDqD4V3G9ttPkTqKljVQR0YlUUmGzbI8x1A1HqKvWmnz8+fvQtID5MNwdCKf3Bnz6jQ+451uytUPCj+h2/ofWpMg5fInn5Hl71EGI+IaDmNh/MflVa7jDsvzj96fKnTFsavCRN5BGuYHXy1/lXb2a4/snhSWN07CVB6sfij0GnvXZWVqsEc+V2yzaqdRUdtamFUIiilTqVMRqEUIp9CK0AyKBWn0qVDspXbJGq/LkfQ8jVW/aVgRA0Gx5H+W9apFV72HB/kRoR71zzxXui8MtcnFcU4WVMgSDyA8Q9Dz9CPQ8qxLuCnVSDPIgDN03Me0yK9BxGGYfeHMaT8joR+4rmuJ4PKSVU9WT6w+8Af2a5pKUeTpjKMuDlntMhPhJB1KkHf7Q5nTmPEPvcgQGErJXmPrD5bj7y+4OtaNxz+o5ETvlOmv751Su2p8SQrzOkiTHONj5xSpM1bRE6AgaTpII+IDaQRuPMVUu2iNTqNPEP/Uu3y/rVw8RXmkHmQYIP3hyP3hofOn/TE1lWB9F19dY9xofKlUojtMzvopjwnfXeQQeYPMVpcC462FzIUlGMmCQVMBTHUQBpy96jN+zHhaOqsjZfaAY9fzqJ7lttJ15CGnflp4h+99KdvqjEoJnojdqFa0hV1OZVIGUzEfCdRB5T1FZWK4y1r+KoCksEkeIgXGAMDnG8TynlXEF2UAIxC9PFA11gEeHXl1qhftYgtmW688vF4ddPhPh5dK0tbe7OZ45x4pnoVziKwVuXZlfEygqcszo2ynnPLTWuOxPHLrkILmdbYZLdwiGZJOp1gtBjNE6A1m3VxLgC68rroSoGm8hRr1g+1FMNH1tR8vXWtqD/AHtxRg39xewt2AAwkD/Mvp19RVx8OtwTM6aMNGX9x/SqdtwNInzJOnoAJ/Gm/SGBkMR5rpPrGp+dOjosuEBR/FIgbOTBHv8Ay1B/Co7nEFA0Afo05fwOtU+8A1Ma7nr89aWGwb3TFm0G+9ACj1bb+daUUwcqGX8YzHU/LYfyrQ4LwZ75DN4bX2ub+S/rt61scK7MAQ19u8bfKP7sH0Or+8DyrqbGGqiiQnk7EeCwoUBVEACABsBWnatxStWoqdVqtEGwgU8CkBTgKBAilTopUAaVKKdQitCBSo0qKAbTSKfFA0qHZEy1XvYcMIIB8iJq1FNNZoaZzmN7N22krmQnocyz1hv5EVh4rsteXW21t+oMoY5QNR+Nd8RTGtVh4ovoUWWS6nlfEOC4kamxdBGxQC57Hu80rWLeuFDFxSsbAqy/KQPLT5V7Q2HFRtaO0n51jwUjfjM8UW8u6mffUe1FrgJhhpvp+YHWvX73DbbfFbtn/Ein8xVO52fwxMnDWCevdW5/Kjwx+MeWga6Nvz1hhy9/36t7+OY9/wAvXX98/UP/AObwv+jWP9jb/SnrwPDjaxaH/hJ+lGgPF8jye7iVn4xOmk/EPTr+nlolR2jIlxuhRHbTocoNewJgEHwqo9FA/Kn/AEWtKJl5DyrD8Gxb7WWUdXKr8wTm/CtTCdkLp1uXFXyQFj/mMflXoi4UdKlWwK1pM+IzkMH2UsrqVLnrcOYf5BC/hW5awEaRoOXT0FbC2qeLdaSMOVmcmFjlVlLNWclELTMkK26eqVLloxTAjy0QtPilFADctCn0qAL1KjQrZkVKlSpAA0qVKgYwimmpDTaVAMigRT6FIYyKBWnkUqAISlN7urEUCKVDKxt0026skU2KVAV8lICpytDLRQEQWnZaeBRimAwCnAU8ChFMQAKMUop0UACKD6CToIJk6CBuZ6Vmdo+Kdxb8JGdjC8yq7s8HSB1OmtebYbiKMLuIuXSxZyqSCzEBQdAeeYiTyAAnU1HJlcXpjG2B6Lie02FtsFa5E88pK/rHtVn+2cNlzG/bABjxNlM+h1ryHgV8XL/8Q5oBIiNzEZjzXz8q0sVdAYzcLt10j2J/TaufJ+JyY3TSfuLpZ6X/AG7hP9Ks/wC0X9aVeXfQz1b/AGbfpSpfpr/KLUe2UaFKa9IBGlSpUAKhSpUDAaBomhSAEUIpxoUgGxSinGhQMbSp1CKQAihFGlFADTTTT4oRSoBpFGKNKmAopUqQpiFVfH3mS27LGZVJE7Tyn3qxXF9qeI3JeHcC2+VrSmA1s6HMOcjWfMVHPlWON99gMDjCPiHtJculs+fvWUwwtgG4I8oIUeZrN7SWkRdwuigWlAAtoNACfrHnPWr6Y62GuXswyW7FpV01Lu0xA3AyJoOsVCiLaIe6DdxTAQoXN3U/VUbFwDq3lp5+XDJOL35+fPIWllbA3glsqEaW1nKQxA+ESeQ1OnU+0eCw6tcDXWyxl9dpOnpz86dfut9J7xlYwNAQTJAgZpmNtZipbGNtEEd0uo5AbdTFOTr6u43GuTV/tq39o/JaVY/0rD/Y/wB3/wC1Ksa32+e4r8/6Ht9KkaVe8AKVKhQAopUqVAwUiKVKkAKVGhQAKVGgaABQijNKkA2lRoUDFNCKRpUACaVKlQAppUKFAiDiN0radlMMFOUn7X1R6k6e9eX9ouK3VQ5luSy+LOS4ynnInL8QMyPh8q7ztZf/AIa2wYa4TlIPiBSNl+t8deTX7dwO7XbveKJGW0SEuNlnu8zDxnLMxoIJmuHNLVlUe3QEm5DuF4db5W27vltObmS0CzXchAXIMsrBAlunTeuvZMRbBWzh8kg+JrlvvNdRmJYknUVg8F4cFa3mLW0KPBtuwOcZDlLc4lt99dK6Di6gKYuXFLKPEoN0KSeaEgn2JqH4h3Or+ehat6OPszdZQ7DLm8Uasx1IB5A7+cVr93aDBVRRI00AJ56R5U18LbS2wbEG8rEMVVFtqWGxlpbcDaNqtWcVbt2g6KoQmCQqhwxGkwBmGm9TnT+18dEKWwvo1v73+R//AJ0qr/2svn/lX9KVS1S/K/f/AILxX2+ex7NSpUq+gJANClSoAVI0qVAANA0aVIYBSpUqABSNKlQADQNKlSAVNpUqBhptKlQAKFGlSABpUqVMRzXa7+8wv+K//wAsV5+/9zhv/N/8dClXl5f2l+n9mNcP0Ng/9Uw//ebv/NuVV4luv+L+RpUq5cv62X8xRcmFj+fv+SVef+4tf4v/AG3o0qvInPkvUqVKskj/2Q==" alt="Custard-Apple">
            <h3>Custard-Apple</h3>
			<p class="price">Rs.144</p>
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590009674/kiwi-imported-3-pcs-pack-product-images-o590009674-p590317377-0-202408070949.jpg?im=Resize=(360,360)" alt="Kiwis">
            <h3>Kiwis</h3>
            <p class="price">Rs.229</p>
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590000070/pineapple-queen-1-pc-approx-700-g-1200-g-product-images-o590000070-p590000070-0-202409041925.jpg?im=Resize=(360,360)" alt="Pineapples">
            <h3>Pineapples</h3>
            <p class="price">Rs.85</p>
        </div>
		<div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590003068/sapota-6-pcs-pack-approx-450-g-550-g-product-images-o590003068-p590309513-0-202409271101.jpg?im=Resize=(360,360)" alt="Blueberrys">
            <h3>Sapota</h3>
            <p class="price">Rs.129</p>
        </div>
        <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/rvqdzxcgba/namelix-art-organic-original-natural-papaya-soap-base-500-g-pack-of-3-product-images-orvqdzxcgba-p600155998-0-202304041814.jpg?im=Resize=(360,360)" alt="Papayas">
            <h3>Papaya</h3>
            <p class="price">Rs.56</p>
        </div>
        <div class="product-card" data-category="fruits">
            <img src="https://www.jiomart.com/images/product/original/590009518/mango-totapuri-4-pcs-approx-1200-g-1400-g-product-images-o590009518-p590177429-0-202408070949.jpg?im=Resize=(360,360)" alt="Mangos">
            <h3>Mangos</h3>
            <p class="price">Rs.37</p>
         </div>
            </main>
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
                    <script src="storeCart.js"></script>
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
function ok(){
    alert("Thank You, <%= user %>! 🎉");
}
 function toggleDropdown() {
            var dropdown = document.getElementById("dropdownMenu");
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        }
        document.addEventListener("click", function(event) {
            var profileMenu = document.querySelector(".profile-menu");
            if (!profileMenu.contains(event.target)) {
                document.getElementById("dropdownMenu").style.display = "none";
            }
        });
</script>
    </body>
</html>
