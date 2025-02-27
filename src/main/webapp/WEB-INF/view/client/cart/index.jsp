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
    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" class="h5">Shopping Bag</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cart" items="${cartDetails}">
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="/images/product/${cart.product.image}" class="img-fluid rounded-3"
                                             style="width: 120px;" alt="Book">
                                        <div class="flex-column ms-4">
                                            <p class="mb-2">${cart.product.name}</p>
                                        </div>
                                    </div>
                                </th>
                                <td class="align-middle">
                                    <p class="mb-0" id = "data-cart-detail-price"><fmt:formatNumber
                                            value="${cart.price}"/>đ</p>
                                </td>
                                <td class="align-middle">
                                    <div class="d-flex flex-row">
                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                            <i class="fas fa-minus"></i>
                                        </button>

                                        <input id="data-cart-detail-quantity" min="0" name="quantity" value=${cart.quantity} type="number"
                                               class="form-control form-control-sm" style="width: 50px;"/>

                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <p class="mb-0" style="font-weight: 500;"><fmt:formatNumber
                                            value="${cart.price * cart.quantity}"/>đ</p>
                                </td>
                                <td class="align-middle">
                                    <i class="bi bi-x-circle fa-2x"></i>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <c:if test="${!cartDetails.isEmpty()}">
                    <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-end align-items-center gap-3">
                                <span> Tổng tiền hàng: <fmt:formatNumber value="${totalPrice}"/>đ</span>
                                <a href="/" data-mdb-button-init data-mdb-ripple-init
                                   class="btn btn-light me-2">TIẾP TỤC MUA SẮM
                                </a>
                                <button type="button" data-mdb-button-init data-mdb-ripple-init
                                        class="btn btn-primary ">XÁC NHẬN ĐẶT HÀNG
                                </button>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>