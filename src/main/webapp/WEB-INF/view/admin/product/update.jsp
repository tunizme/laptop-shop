<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Dashboard - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgUrl = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgUrl);
                $("#avatarPreview").css({"display": "block"});
            });
        });
    </script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"></jsp:include>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"></jsp:include>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/user">Users</a></li>
                </ol>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Update a user</h3>
                            <hr/>
                            <form:form method="post" action="/admin/product/update" modelAttribute="newProduct"
                                       enctype="multipart/form-data" class="mt-4">
                                <div class="mb-3 d-none">
                                    <label class="form-label">ID</label>
                                    <form:input type="text" class="form-control" path="id"/>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="form-label">Name</label>
                                        <c:set var="nameHasBindError">
                                            <form:errors path="name"/>
                                        </c:set>
                                        <form:input type="text" class="form-control ${not empty nameHasBindError? 'is-invalid' : ''}" path="name"/>
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="form-label">Price</label>
                                        <c:set var="priceHasBindError">
                                            <form:errors path="price"/>
                                        </c:set>
                                        <form:input type="number" class="form-control ${not empty priceHasBindError? 'is-invalid' : ''}" path="price"/>
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">Detail description</label>
                                    <c:set var="detailDescHasBindError">
                                        <form:errors path="detailDesc"/>
                                    </c:set>
                                    <form:textarea type="text" class="form-control ${not empty detailDescHasBindError? 'is-invalid' : ''}" path="detailDesc"/>
                                    <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-group col-md-6 mb-3">
                                        <c:set var="shortDescHasBindError">
                                            <form:errors path="shortDesc"/>
                                        </c:set>
                                        <label class="form-label">Short description</label>
                                        <form:input type="text" class="form-control ${not empty shortDescHasBindError? 'is-invalid' : ''}" path="shortDesc"/>
                                        <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="form-label">Quantity</label>
                                        <c:set var="quantityHasBindError">
                                            <form:errors path="quantity"/>
                                        </c:set>
                                        <form:input type="number" class="form-control ${not empty quantityHasBindError? 'is-invalid' : ''}" path="quantity"/>
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-group col-md-6 mb-3">
                                        <label>Factory</label>
                                        <form:select path="factory" class="form-select">
                                            <form:option value="APPLE">APPLE</form:option>
                                            <form:option value="LENOVO">LENOVO</form:option>
                                        </form:select>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label>Target</label>
                                        <form:select path="target" class="form-select">
                                            <form:option value="GAMING">GAMING</form:option>
                                            <form:option value="VAN-PHONG">VAN PHONG</form:option>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group col-md-6 mb-3">
                                    <label>Avatar</label>
                                    <input class="form-control" type="file" id="avatarFile" name="avatarNameFile"
                                           accept=".png,.jpeg,.jpg,.jpeg"/>
                                </div>
                                <div class="col-12 mb-3">
                                    <img src="/images/product/${product.image}" style="max-height: 250px;" alt="avatar preview"
                                         id="avatarPreview"/>
                                </div>
                                <button type="submit" class="btn btn-primary">Create</button>
                            </form:form>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>

</body>
</html>
