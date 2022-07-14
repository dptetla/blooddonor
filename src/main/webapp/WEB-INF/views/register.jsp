<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 07.07.2022
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pl">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Aplikacja Krwiodawcy</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
<body>
<header class="page-header">
    <nav class="navbar navbar-expand-lg justify-content-around">
        <a href="/" class="navbar-brand main-logo">
            Aplikacja <span>Krwiodawcy</span>
        </a>
        <ul class="nav nounderline text-uppercase">
            <li class="nav-item ml-4">
                <a class="nav-link color-header" href="/login">logowanie</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link color-header" href="/register">rejestracja</a>
            </li>

        </ul>
    </nav>
</header>

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <form:form class="padding-small text-center" method='post' modelAttribute="user">
                    <h1 class="text-color-darker">Rejestracja</h1>
                    <div class="form-group">
                        <form:input path="userName" placeholder="Nazwa użytkownika"/>
                        <form:errors path="userName" cssClass="error"></form:errors>
                    </div>
                    <div class="form-group">
                        <form:input path="firstName" placeholder="Imię"/>
                        <form:errors path="firstName" cssClass="error"></form:errors>

                    </div>
                    <div class="form-group">
                        <form:input path="lastName" placeholder="Nazwisko"/>
                        <form:errors path="lastName" cssClass="error"></form:errors>

                    </div>
                    <div class="form-group">
                        <form:input path="email" placeholder="Email"/>
                        <form:errors path="email" cssClass="error"></form:errors>

                    </div>
                    <div class="form-group">
                        <form:input path="password" type="password" placeholder="Hasło"/>
                        <form:errors path="password" cssClass="error"></form:errors>

                    </div>
                    <div class="form-group">
                        <input type="password" id="repassword" name="repassword" placeholder="Powtórz hasło">
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Zarejestruj</button>
                </form:form>
                <%--                <form class="padding-small text-center" action="/login" method="post">--%>
                <%--                    <h1 class="text-color-darker">Logowanie</h1>--%>
                <%--                    <div class="form-group">--%>
                <%--                        <div><label> Nazwa Użytkownika : <input type="text" name="username"/> </label></div>--%>
                <%--                    </div>--%>
                <%--                    <div class="form-group">--%>
                <%--                        <div><label> Hasło : <input type="password" name="password"/> </label></div>--%>
                <%--                    </div>--%>
                <%--                    <button class="btn btn-color rounded-0" type="submit">Zaloguj</button>--%>
                <%--                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><br/>--%>

                <%--                </form>--%>
            </div>
        </div>
    </div>
</section>


</body>
</html>
