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
                            <h3>Create a user</h3>
                            <hr/>
                            <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                                       enctype="multipart/form-data" class="mt-4">
                                <div class="row mb-3">
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="form-label">Email</label>
                                        <c:set var="emailHasBindError">
                                            <form:errors path="email"/>
                                        </c:set>
                                        <form:input type="email"
                                                    class="form-control ${not empty emailHasBindError? 'is-invalid' : ''}"
                                                    path="email"/>
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="form-label">Password</label>
                                        <c:set var="passwordHasBindError">
                                            <form:errors path="password"/>
                                        </c:set>
                                        <form:input type="password"
                                                    class="form-control ${not empty passwordHasBindError? 'is-invalid' : ''}"
                                                    path="password"/>
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="form-label">Phone number</label>
                                        <form:input type="text" class="form-control" path="phone"/>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label class="form-label">Full Name</label>
                                        <c:set var="fullNameHasBindError">
                                            <form:errors path="fullName"/>
                                        </c:set>
                                        <form:input type="text"
                                                    class="form-control ${not empty fullNameHasBindError? 'is-invalid' : ''}"
                                                    path="fullName"/>
                                        <form:errors path="fullName" cssClass="invalid-feedback"/>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">Address</label>
                                    <form:input type="text" class="form-control" path="address"/>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-group col-md-6 mb-3">
                                        <label>Role</label>
                                        <form:select path="role.name" class="form-select">
                                            <form:option value="ADMIN">ADMIN</form:option>
                                            <form:option value="USER">USER</form:option>
                                        </form:select>
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <label>Avatar</label>
                                        <input class="form-control" type="file" id="avatarFile" name="avatarNameFile"
                                               accept=".png,.jpeg,.jpg,.jpeg"/>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img src="" style="max-height: 250px; display: none;" alt="avatar preview"
                                             id="avatarPreview"/>
                                    </div>
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
