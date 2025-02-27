<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/css/font-awesome.min.css" rel="stylesheet">
    <link href="/client/css/price-range.css" rel="stylesheet">
    <link href="/client/css/animate.css" rel="stylesheet">
    <link href="/client/css/main.css" rel="stylesheet">
    <link href="/client/css/responsive.css" rel="stylesheet">

</head><!--/head-->

<body>

<jsp:include page="../layout/header.jsp"></jsp:include>
<section class="section">
    <div class="container mt-5">
        <div class="row">
            <div class="features_items mb-5">
                <h2 class="title text-center">Xu hướng thịnh hành</h2>
                <c:forEach var="product" items="${products}">
                    <div class="col-md-3 mb-5">
                        <div class="main-card">
                            <img src="/images/product/${product.image}" class="card-img-top"
                                 alt="Apple iPhone 15 Pro Max">
                            <div class="card-body text-center">
                                <h5 class="card-title fw-bold fw-bold">${product.name}</h5>
                                <div class="mb-3">
                        <span class="text-danger fw-bold">
                                <fmt:formatNumber value="${product.price}"/>đ
                        </span>
                                </div>
                                <form action="/add-product-to-cart/${product.id}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <button class="btn-price btn btn-info text-white fw-bold">Add to cart
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/js/jquery.js"></script>
<script src="/client/js/bootstrap.min.js"></script>
<script src="/client/js/jquery.scrollUp.min.js"></script>
<script src="/client/js/price-range.js"></script>
<script src="/client/js/jquery.prettyPhoto.js"></script>
<script src="/client/js/main.js"></script>
<script>
    const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 5,
        spaceBetween: 15,
        freeMode: true,
        rewind: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
</script>
</body>
</html>