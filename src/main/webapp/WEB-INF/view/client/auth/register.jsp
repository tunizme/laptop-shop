<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Price Comparison</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/css/font-awesome.min.css" rel="stylesheet">
    <link href="/client/css/price-range.css" rel="stylesheet">
    <link href="/client/css/animate.css" rel="stylesheet">
    <link href="/client/css/main.css" rel="stylesheet">
    <link href="/client/css/responsive.css" rel="stylesheet">

</head><!--/head-->
<body>
<section class="vh-100" style="background-color: #eee;">
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                <form:form method="post" action="/register" class="mx-1 mx-md-4" modelAttribute="registerUser">

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <c:set var="firstNameHasBindError">
                                                <form:errors path="firstName"/>
                                            </c:set>
                                            <form:input type="text" class="form-control ${not empty firstNameHasBindError? 'is-invalid' : ''}" path="firstName" />
                                            <label class="form-label">First Name</label>
                                            <form:errors path="firstName" cssClass="invalid-feedback"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <form:input type="text" class="form-control" path="lastName" />
                                            <label class="form-label">Last Name</label>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <c:set var="emailHasBindError">
                                                <form:errors path="email"/>
                                            </c:set>
                                            <form:input type="email" class="form-control ${not empty emailHasBindError? 'is-invalid' : ''}" path="email"/>
                                            <label class="form-label">Your Email</label>
                                            <form:errors path="email" cssClass="invalid-feedback"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <c:set var="passwordHasBindError">
                                                <form:errors path="password"/>
                                            </c:set>
                                            <form:input type="password" class="form-control ${not empty passwordHasBindError? 'is-invalid' : ''}" path="password" />
                                            <label class="form-label">Password</label>
                                            <form:errors path="password" cssClass="invalid-feedback"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <c:set var="confirmPasswordHasBindError">
                                                <form:errors path="confirmPassword"/>
                                            </c:set>
                                            <form:input type="password" class="form-control ${not empty confirmPasswordHasBindError? 'is-invalid' : ''}" path="confirmPassword"/>
                                            <label class="form-label">Repeat your password</label>
                                            <form:errors path="confirmPassword" cssClass="invalid-feedback"/>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg">Register</button>
                                    </div>

                                </form:form>

                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                     class="img-fluid" alt="Sample image">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>

</body>
</html>
