<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alumni Association System</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <style>
            body{
                background-color: #ddd497;
            }
            .container{
                width: 100vw;
                height: 100vh;
                background-image: url("images/blue-bg.png");
                background-position: center;
                background-size: cover;
                background-repeat: no-repeat;
                position: relative;
                margin: auto;
                text-align: center;
            }
            a{
                color: white;
            }
            a:hover{
                color: black;
            }
            .btn{
                margin-top: -45px;
                position: relative;
                text-align: center;
                background-color: green;
            }
            #foot{
                margin-top: -35px;
                font-size: 80px;
            }
            .item img{
                margin-top:10px;
                max-height: 510px;
                width: 100%
            }
            .music{
                position: absolute;
            }
            audio::-webkit-media-controls-panel {
                background-color: green;
            }

            audio::-webkit-media-controls-play-button {
                background-color: green;
                border-radius: 20%;
            }

            audio::-webkit-media-controls-play-button:hover {
                background-color: rgba(177,212,224, .7);
            }
        </style>
    </head>
    <body>
        <div class="container responsive"> 

            <div class="image">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                        <li data-target="#myCarousel" data-slide-to="5"></li>
                        <li data-target="#myCarousel" data-slide-to="6"></li>
                        <li data-target="#myCarousel" data-slide-to="7"></li>
                        <li data-target="#myCarousel" data-slide-to="8"></li>
                        <li data-target="#myCarousel" data-slide-to="9" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="10"></li>
                        <li data-target="#myCarousel" data-slide-to="11"></li>
                        <li data-target="#myCarousel" data-slide-to="12"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item">
                            <img src="images/2nd-1.jpg" alt="Second Convocation">
                            <div class="carousel-caption">
                                <h3>2ND Convocation</h3>
                                <p>PCIU Second Convocation</p>
                            </div>
                        </div>

                        <div class="item">
                            <img src="images/2nd-2.jpg" alt="Second Convocation">
                            <div class="carousel-caption">
                                <h3>2ND Convocation</h3>
                                <p>PCIU Second Convocation</p>
                            </div>
                        </div>

                        <div class="item">
                            <img src="images/2nd-3.jpg" alt="Second Convocation">
                            <div class="carousel-caption">
                                <h3>2ND Convocation</h3>
                                <p>PCIU Second Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/2nd-4.jpg" alt="Second Convocation">
                            <div class="carousel-caption">
                                <h3>2ND Convocation</h3>
                                <p>PCIU Second Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/2nd-5.jpg" alt="Second Convocation">
                            <div class="carousel-caption">
                                <h3>2ND Convocation</h3>
                                <p>PCIU Second Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/2nd-6.jpg" alt="Second Convocation">
                            <div class="carousel-caption">
                                <h3>2ND Convocation</h3>
                                <p>PCIU Second Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/1st-1.jpg" alt="First Convocation">
                            <div class="carousel-caption">
                                <h3>1ST Convocation</h3>
                                <p>PCIU First Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/1st-2.jpg" alt="First Convocation">
                            <div class="carousel-caption">
                                <h3>1ST Convocation</h3>
                                <p>PCIU First Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/1st-3.jpg" alt="First Convocation">
                            <div class="carousel-caption">
                                <h3>1ST Convocation</h3>
                                <p>PCIU First Convocation</p>
                            </div>
                        </div>
                        <div class="item active">
                            <img src="images/1st-4.jpg" alt="First Convocation">
                            <div class="carousel-caption">
                                <h3>1ST Convocation</h3>
                                <p>PCIU First Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/1st-5.jpg" alt="First Convocation">
                            <div class="carousel-caption">
                                <h3>1ST Convocation</h3>
                                <p>PCIU First Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/1st-6.jpg" alt="First Convocation">
                            <div class="carousel-caption">
                                <h3>1ST Convocation</h3>
                                <p>PCIU First Convocation</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/1st-7.jpg" alt="First Convocation">
                            <div class="carousel-caption">
                                <h3>1ST Convocation</h3>
                                <p>PCIU First Convocation</p>
                            </div>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="btn btn-success" style="font-size:20px;text-align: center;height: 40px;">
               
                <div class="aa">
                     <a href="blogs.jsp?cId=0" style="color:black" title="Click to Enter to the system">Enter to the system</a>
                </div>
                 <audio controls style="width:250px; height: 30px;" title="Click to Play the PCIU Theme Song ">
                    <source src="images/pciu-theme-song.mp3" type="audio/mpeg">
                </audio>
            </div>
            
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
