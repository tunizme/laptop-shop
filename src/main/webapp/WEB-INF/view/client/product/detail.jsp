
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

<jsp:include page="../layout/header.jsp"></jsp:include>
<section class="section">
    <div class="container mt-5">
        <div class="row">
<div class="col">
    <div class="product-details"><!--product-details-->
        <div class="col-sm-3">
            <div class="view-product">
                <img src="/images/product/${product.image}" alt="" width="60%"/>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="product-information"><!--/product-information-->
                <h2>${product.name}</h2>
                <p>${product.detailDesc}</p>
            </div><!--/product-information-->
        </div>
    </div><!--/product-details-->


<%--    <div class="product-price mb-5">--%>
<%--        <h2 class="title text-center">Giá so sánh</h2>--%>
<%--        @foreach (var productPrice in Model.Prices)--%>
<%--        {--%>
<%--        <div class="row price-container">--%>
<%--            <div class="col-sm-6">--%>
<%--                    <span class="shop-name">--%>
<%--                        @productPrice.ShopName--%>
<%--                    </span>--%>
<%--            </div>--%>
<%--            <div class="col-sm-3">--%>
<%--                <h4 class="product-price">--%>
<%--                    @productPrice.Price.ToString("#,##0") đ--%>
<%--                </h4>--%>
<%--            </div>--%>
<%--            <div class="col-sm-3 d-flex justify-content-end">--%>
<%--                <a href="@productPrice.ShopUrl" target="_blank" class="btn btn-primary">--%>
<%--                    Xem giá mới nhất--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        }--%>
<%--    </div>--%>

    <div class="recommended_items mb-5 pt-5">
        <h2 class="title text-center">recommended items</h2>
        <div class="swiper-container">
            <div class="swiper-wrapper m-3">
<%--                @if (ViewData["RecommendedItems"] is List<price_comparison.Models.ProductModel> recommendedItems && recommendedItems.Any())--%>
<%--                {--%>
<%--                foreach (var item in recommendedItems)--%>
<%--                {--%>
<%--                var minPrice = item.Prices.Any() ? item.Prices.Min(p => p.Price) : 0;--%>
<%--                var maxPrice = item.Prices.Any() ? item.Prices.Max(p => p.Price) : 0;--%>
<%--                <div class="swiper-slide">--%>
<%--                    <div class="card text-center">--%>
<%--                        <img src="/media/products/@item.Image" class="card-img-top" alt="@item.Name">--%>
<%--                        <div class="card-body">--%>
<%--                            <h5 class="card-title">@item.Name</h5>--%>
<%--                            <span class="text-danger fw-bold">--%>
<%--                                        @minPrice.ToString("#,##0")đ ---%>
<%--                                        @maxPrice.ToString("#,##0")đ--%>
<%--                                    </span>--%>
<%--                            <a href="/Product/Details/@item.Id" class="btn btn-primary mt-4">Xem chi tiết</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                }--%>
<%--                }--%>
<%--                else--%>
<%--                {--%>
<%--                <p>Không có sản phẩm gợi ý.</p>--%>
<%--                }--%>

<%--            </div>--%>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <!-- Navigation buttons -->


            <!-- Pagination (dots) -->
            <div class="swiper-pagination"></div>
        </div>
    </div><!--/recommended_items-->
</div>
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