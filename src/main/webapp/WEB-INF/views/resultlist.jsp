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
        <div class="m-4 p-4 border-dashed" >
            <h2 class="dashboard-content-title">
                <table>
                    <tr>

                        <th style="text-align: center" scope="col" class="col-10">Data</th>
                        <th style="text-align: center" scope="col" class="col-10">RBC</th>
                        <th style="text-align: center" scope="col" class="col-10">HGB</th>
                        <th style="text-align: center" scope="col" class="col-10">HCT</th>
                        <th style="text-align: center" scope="col" class="col-10">MCV</th>
                        <th style="text-align: center" scope="col" class="col-10">MCH</th>
                        <th style="text-align: center" scope="col" class="col-10">MCHC</th>
                        <th style="text-align: center" scope="col" class="col-10">RDW</th>
                    </tr>
                    <tr>
                        <th scope="col" class="col-5">Norma</th>
                        <th scope="col" class="col-10">4.50-5.90</th>
                        <th scope="col" class="col-10">13.50-18.50</th>
                        <th scope="col" class="col-10">40.00-54.00</th>
                        <th scope="col" class="col-10">80.00-98.00</th>
                        <th scope="col" class="col-10">27.00-34.00</th>
                        <th scope="col" class="col-10">31.00-37.00</th>
                        <th scope="col" class="col-10">11.4-14.5</th>
                    </tr>
                    <c:forEach var="test" items="${result}">
                        <tr>
                            <td align="center">${test.dayOfTest}</td>
                            <td align="center">${test.RBC}</td>
                            <td align="center">${test.HGB}</td>
                            <td align="center">${test.HCT}</td>
                            <td align="center">${test.MCV}</td>
                            <td align="center">${test.MCH}</td>
                            <td align="center">${test.MCHC}</td>
                            <td align="center">${test.RDW}</td>
                            <td>
                                <a href="<c:url  value="/login/removeresult?id=${test.id}"/> " button class="btn btn-color rounded-0">Usuń </a>
                            </td>
                            <td>
                                <a href="<c:url  value="/login/editresult?id=${test.id}"/> " button class="btn btn-color rounded-0">Edytuj </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </h2>
        </div>
        <%--        <div class="m-4 p-4 width-medium">--%>
        <%--            <div class="dashboard-header m-4">--%>
        <%--                <div class="dashboard-menu">--%>
        <%--                    <div class="menu-item border-dashed">--%>
        <%--                        <a href="/app/recipe/add">--%>
        <%--                            <i class="far fa-plus-square icon-plus-square"></i>--%>
        <%--                            <span class="title">dodaj przepis</span>--%>
        <%--                        </a>--%>
        <%--                    </div>--%>
        <%--                    <div class="menu-item border-dashed">--%>
        <%--                        <a href="/app/plan/add">--%>
        <%--                            <i class="far fa-plus-square icon-plus-square"></i>--%>
        <%--                            <span class="title">dodaj plan</span>--%>
        <%--                        </a>--%>
        <%--                    </div>--%>
        <%--                    <div class="menu-item border-dashed">--%>
        <%--                        <a href="/app/recipe/plan/add">--%>
        <%--                            <i class="far fa-plus-square icon-plus-square"></i>--%>
        <%--                            <span class="title">dodaj przepis do planu</span>--%>
        <%--                        </a>--%>
        <%--                    </div>--%>
        <%--                </div>--%>

        <%--                <div class="dashboard-alerts">--%>
        <%--                    <div class="alert-item alert-info">--%>
        <%--                        <i class="fas icon-circle fa-info-circle"></i>--%>
        <%--                        <span class="font-weight-bold">Liczba przepisów: ${count}</span>--%>
        <%--                    </div>--%>
        <%--                    <div class="alert-item alert-light">--%>
        <%--                        <i class="far icon-calendar fa-calendar-alt"></i>--%>
        <%--                        <span class="font-weight-bold">Liczba planów: ${countPlans}</span>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>

    </div>
    </div>
</section>
</body>
</html>
