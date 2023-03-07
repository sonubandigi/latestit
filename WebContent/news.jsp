<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 
<%@ page import="javax.sql.*" %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News & Events</title>
    <link href="news.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!--ICONS LINK-->
    <link rel="stylesheet" href="https://kit.fontawesome.com/fafd4002bd.css" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/fafd4002bd.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
    <link href="http://fonts.googleapis.com/css?family=Raleway" rel='stylesheet' type='text/css'>
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
</head>
<body>


<%

Connection conn = null;

conn = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "1234");

PreparedStatement stmt = conn.prepareStatement("select input from  newsevents where id=1");

ResultSet rs = stmt.executeQuery();

String name=null; 

while(rs.next())
{
	name=rs.getString(1);
}

%>
  <div class="fixed">
    <ul class="topnav">
      <li><a href=""><i class="fa-brands fa-facebook"></i></a></li>
      <li><a href=""><i class="fa-brands fa-instagram"></i></a></li>
      <li><a href=""><i class="fa-brands fa-twitter"></i></a></li>
      <li><a href=""><i class="fa-brands fa-whatsapp"></i></a></li>
      <li><a href=""><i class="fa-brands fa-linkedin"></i></a></li>
    </ul>
  </div>
  <div class="mananav">
    <div class="container">
      <div class="row">
        <div class="col-md-10">
          <div class="naree">
            <marquee>We transform businesses of most major sectors with powerful and adaptable digital solutions that satisfy the needs of today.</marquee>
          </div>
        </div>
        <div class="col-md-2">
          <button class="login">Login Here</button>
        </div>
      </div>
    </div>
  </div>
  
  <nav class="navbar navbar-expand-sm fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.html"><img src="images/logo.png" class="img-fluid" alt="..."></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mynavbar">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">About us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="training.html">Trainings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="service.html">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="solution.html">Solutions</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="news.html">News & Events</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="careers.html">Careers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contactus.html">Contact Us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="gallery.html">Gallery</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="payment.html"><button class="payment">Client Payment</button></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

<!--text on image-->
<div class="overview">
  <div class="inover">
    <div class="overtext">
      <a href="index.html"><span>Home</span></a>&nbsp;<i class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;<a href="#"><span>News & Events</span></a>&nbsp;&nbsp;<i class="fa-solid fa-angle-right"></i>&nbsp;&nbsp;
    </div>
    <div class="company">
      <h2>News & Events</h2>
      </div>
  </div>
</div>

<!--Content-->
<div class="container-fluid jquery sai">
  <div class="container">
  <h5 class="first">
  
  <p width="60%" direction="right" height="100px">
   
   <%=name %>
   
    </p>
    </h5>
    
  <br>
  

  
</div>
</div>
   

<!--FOOTER-->
<div class="container-fluid footer" style="background-color: #272626;  margin-top: -47px;">
  <div class="container">
    <div class="row" style="color: #fff;">

      <div class="col-md-4">
        <h3 class="footerh3">COMPANY</h3>
        <ul class="footerservice">
          <li><a href="index.html"><h5><i class="fa fa-angle-right"></i>&nbsp;&nbsp;HOME</h5></a></li>
          <li><a href="about.html"><h5><i class="fa fa-angle-right"></i>&nbsp;&nbsp;ABOUT US</h5></a></li>
          <li><a href="training.html"><h5><i class="fa fa-angle-right"></i>&nbsp;&nbsp;TRAININGS</h5></a></li>
        </ul>
          <br><br><br><br><br><br><br><br><br><br>
        <a href="refund.html" class="footanchor">Refund Policy</a>
      </div>

      <div class="col-md-4">
        <h3 class="footerh3">OUR SERVICES</h3>
        <ul class="footerservice">
          <li><a href="service.html"><h5><i class="fa fa-angle-right"></i>&nbsp;&nbsp;SERVICES</h5></a></li>
          <li><a href="soltion.html"><h5><i class="fa fa-angle-right"></i>&nbsp;&nbsp;SOLUTIONS</h5></a></li>
          <li><a href="newsandevents.html"><h5><i class="fa fa-angle-right"></i>&nbsp;&nbsp;NEWS & EVENTS</h5></a></li>
        </ul> <br><br><br><br><br><br><br><br><br><br>
        <a href="privacy.html" class="footanchor">Privacy Policy</a>
      </div>

      <div class="col-md-4">
        <h3 class="footerh3">CONTACT INFO</h3>
        <ul class="footerservice">
          <h6>APT IT SOLUTIONS</h6><br>
          <div class="corporate">
              <h5>Corporate Office:</h5>
              <prev><p>1-98/7/3/83 Vaibhav Enclave, 2nd Floor, Block-B, Arunodaya Colony, Madhapur,          Hyderabad-500081, India.
              E-mail: info@aptits.com</p></prev>
          </div>

          <div class="corporate">
              <h5>Branch Office:</h5>
              <prev><p>3rd Floor, Sahithi Arcade,
                  Besides SR Nagar Police Station,
                  S R Nagar,
                  Hyderabad 500 038,  India.</p></prev>
          </div>

          <div class="corporate">
              <h5>Branch Office:</h5>
              <prev><p>Office No: 301, 3rd Floor,
                  Walchand House Happy Colony Lane-1,
                  Warje Malwadi Rd, Kothrud, Pune, Maharashtra, India
                  Pin: 411 038</p></prev>
          </div>
        </ul> <br><br><br>
        <a href="condition.html" class="footanchor">Terms and Conditions</a>
      </div>
    </div>
  </div>
</div>

<!--LAST FOOTER -->
<div class="container-fluid" style="background-color: black; color: #fff;">
  <div class="container">
    <div class="row lastfooter">
      <div class="col-sm-6">
        <p>© 2023 Apt It Solutions • All Rights Reserved</p>
      </div>

      <div class="col-sm-6" style="float: right;">
        <p>Developed by: Apt It Solutions&nbsp;&nbsp;<a href=""><i class="fa-brands fa-instagram"></i></a><a href=""><i class="fa-brands fa-whatsapp"></i></a></p>
      </div>
    </div>
  </div>
</div>


<a href="#" class="to-top">
  <i class="fa-solid fa-chevron-up"></i>
</a>






  <script>
    //Change navbar styles on scrolling
window.addEventListener('scroll', () =>{
    document.querySelector('nav').classList.toggle
    ('window-scroll', window.scrollY > 0)
    document.getElementById("mananav").style.display="none";
    
})
</script>

<script>
  const toTop = document.querySelector(".to-top");

  window.addEventListener("scroll", ()=>{
    if(window.pageYOffset > 100){
      toTop.classList.add("active");
    }
    else{
      toTop.classList.remove("active");
    }
  })
</script>
</body>
</html>