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
                    <form action="<c:url value="/logout"/>" method="get">
                        <input type="submit" value="Wyloguj">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <i class="fas fa-angle-right"></i>
                </a>
            </li>
        </ul>
        <div class="m-4 p-4 border-dashed">
            <h2 class="dashboard-content-title">
                <form:form modelAttribute="center">
                    <h1 class="text-color-darker">Wybierz</h1>
                    <h1 class="text-color-darker">województwo</h1>
                    <div class="form-group">
                        <form:hidden path="id"/>
                        <form:select path="province" items="${provinces}"
                                     itemLabel="name" itemValue="id"/>
                    </div>
                    <button class="btn btn-color rounded-0" type="submit">Znajdź</button>
                </form:form>
            </h2>
        </div>

        <div class="m-4 p-4 border-dashed">
            <h2 class="dashboard-content-title">
                <table>
                    <tr>
                        <th scope="col" class="col-5">Miasto</th>
                        <th scope="col" class="col-5">Adres</th>
                        <th scope="col" class="col-5">Godziny otwarcia</th>
                        <th scope="col" class="col-5"></th>
                        <th scope="col" class="col-5"></th>
                    </tr>
                    <c:forEach var="blood" items="${bloodcenter}">
                        <tr>
                            <td align="center">${blood.town}</td>
                            <td align="center">${blood.address}</td>
                            <td>
                                <table>
                                    <tr>
                                        <th>Poniedziałek</th>
                                        <td>${blood.monday}</td>
                                    </tr>
                                    <tr>
                                        <th>Wtorek</th>
                                        <td>${blood.tuesday}</td>
                                    </tr>
                                    <tr>
                                        <th>Środa</th>
                                        <td>${blood.wednesday}</td>
                                    </tr>
                                    <tr>
                                        <th>Czwartek</th>
                                        <td>${blood.thursday}</td>
                                    </tr>
                                    <tr>
                                        <th>Piątek</th>
                                        <td>${blood.friday}</td>
                                    </tr>
                                    <tr>
                                        <th>Sobota</th>
                                        <td>${blood.saturday}</td>
                                    </tr>
                                    <br/>
                                </table>

                            </td>
                            <td>
                                <a class="btn btn-color rounded-0" href="${blood.webPage}">Strona www</a>
                            </td>

                        </tr>
                    </c:forEach>
                </table>
            </h2>
        </div>


    </div>
</section>
</body>
</html>
