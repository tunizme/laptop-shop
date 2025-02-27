<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="bg-custom shadow-sm"><!--header-->
    <div class="container">
        <div class="row align-items-center py-3">
            <!-- Logo/Tên Shop và Danh mục -->
            <div class="col-md-6 d-flex align-items-center">
                <a href="/" class="navbar-brand text-white fw-bold fs-3 me-4">Price Comparison</a>
                <nav>
                    <ul class="nav d-inline-flex">
                        <li class="dropdown position-relative">
                            <span class="nav-link text-white d-flex align-items-center" data-toggle="dropdown"
                                  role="button" aria-expanded="false">
                                Danh mục
                                <i class="fa fa-caret-down ms-2"></i> <!-- Icon sau -->
                            </span>
                            <ul class="dropdown-menu position-absolute bg-white shadow">
                                <vc:categories-header></vc:categories-header>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="col-md-3 text-end">
                <form method="post">
                    <div class="search_box position-relative d-inline-block">
                        <input type="text" name="searchString" class="form-control pe-5" placeholder="Search...">
                        <button type="submit"
                                class="btn position-absolute end-0 top-0 mt-1 me-2 border-0 bg-transparent">
                            <i class="fa fa-search text-muted"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="col-md-1 text-end">
                <a href="/cart"><i class="fa badge fa-lg" value=${sessionScope.sum}>&#xf07a;</i></a>
            </div>
            <div class="col-md-2">
                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <div class="dropdown text-end d-flex">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="/images/avatar/${sessionScope.avatar}" alt="mdo" width="32" height="32"
                                 class="rounded-circle">
                            <c:out value="${sessionScope.fullName}"/>
                        </a>
                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                            <li><a class="dropdown-item" href="#">New project...</a></li>
                            <li><a class="dropdown-item" href="#">Settings</a></li>
                            <li><a class="dropdown-item" href="#">Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <form action="/logout" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <button class="dropdown-item">Sign out</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${empty pageContext.request.userPrincipal}">
                    <a href="/login">Đăng nhập</a>
                </c:if>
            </div>
        </div>
    </div>
</header>

