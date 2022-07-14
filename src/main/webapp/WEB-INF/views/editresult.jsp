<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
<jsp:include page="header.jsp"></jsp:include>
<section class="dashboard-section">
    <div class="row dashboard-nowrap">
        <ul class="nav flex-column long-bg">
            <li class="nav-item">
                <a class="nav-link" href="/login/userdetails">
                    <span>Twoje konto</span>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login/listdonation">
                    <span>Twoje donacje</span>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login/adddonation">
                    <span>Dodaj donacje</span>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login/resultlist">
                    <span>Wyniki badań</span>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login/addresult">
                    <span>Dodaj badanie</span>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="/login/edituser">
                    <span>Edytuj dane</span>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="/login/center">
                    <span>Znajdź Centrum Krwiodastwa</span>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
            <li class="nav-item">

                <a class="nav-link" href="#">
                    <form action="<c:url value="/logout"/>" method="post">
                        <input type="submit" value="Wyloguj">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
        </ul>
        <div class="m-4 p-4 border-dashed">
            <h2 class="dashboard-content-title">
                <form:form class="padding-small text-center" method='post' modelAttribute="result">
                    <h1 class="text-color-darker">Dodaj badanie</h1>
                    <div class="form-group">
                        Data badania: <form:input path="dayOfTest" type="Date" placeholder="Data badania"/>
                    </div>
                    <div class="form-group">
                        RBC: <form:input path="RBC" placeholder="RBC"/>
                    </div>
                    <div class="form-group">
                        HGB: <form:input path="HGB" placeholder="HGB"/>
                    </div>
                    <div class="form-group">
                        HCT: <form:input path="HCT" placeholder="HCT"/>
                    </div>
                    <div class="form-group">
                        MCV: <form:input path="MCV" placeholder="MCV"/>
                    </div>
                    <div class="form-group">
                        MCH: <form:input path="MCH" placeholder="MCH"/>
                    </div>
                    <div class="form-group">
                        MCHC: <form:input path="MCHC" placeholder="MCHC"/>
                    </div>
                    <div class="form-group">
                        RDW: <form:input path="RDW" placeholder="RDW"/>
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Zapisz</button>
                </form:form>
            </h2>

        </div>
    </div>
    </div>
</section>
</body>
</html>