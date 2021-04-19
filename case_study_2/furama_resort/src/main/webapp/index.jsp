<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/16/2021
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/style_of_me.css">
</head>
<body>
<div class="container-fluid" >
  <div class="h-auto">
    <div class="row head">
      <div class="col-3">
        <img src="../img/FURAMA.png" alt="Furama" height="100%" width="40%">
      </div>
      <div class="col-6"></div>
      <div class="col-3 text-center" style="line-height: 150px; font-size: 20px"><b>Tran Hong Gia Dong - C1220G2</b></div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: teal">
      <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8090/employees">Employee <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Customer <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Service <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Contact <span class="sr-only">(current)</span></a>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="color: black">Search</button>
        </form>
      </div>
    </nav>
  </div>
  <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="carousel-inner ">
      <div class="carousel-item active">
        <img src="../img/furama-da-nang-1.jpg" class="d-block w-100" alt="..." >
      </div>
      <div class="carousel-item">
        <img src="../img/furama.jpg" class="d-block w-100" alt="..." >
      </div>
      <div class="carousel-item">
        <img src="../img/Furama-Resort-Danang-3-750x450.jpg" class="d-block w-100" alt="..." >
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="footer text-center"><h3>Furama Resort</h3></div>
</body>
<script src="../jquery-3.6.0.min.js"></script>
<script src="../bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
</html>
