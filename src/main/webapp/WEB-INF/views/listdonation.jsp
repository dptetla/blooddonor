<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 12.07.2022
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section class="dashboard-section">
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
                    <table>
                        <tr>
                            <th scope="col" class="col-5">Data</th>
                            <th scope="col" class="col-5">Składnik krwi</th>
                            <th scope="col" class="col-5">Ilość</th>
                            <th scope="col" class="col-5">description</th>
                            <th scope="col" class="col-5"></th>
                        </tr>
                        <c:forEach var="list" items="${list}">
                            <tr>
                                <td align="center">${list.dayOfDonation}</td>
                                <td align="center">${list.component}</td>
                                <td align="center">${list.amount}</td>
                                <td align="center">${list.description}</td>
                                <td>
                                    <a href="<c:url  value="/login/confirm?id=${list.id}"/> " button class="btn btn-color rounded-0">Usuń </a>
                                </td>
                                <td>
                                    <a href="<c:url  value="/login/editdonation?id=${list.id}"/> " button class="btn btn-color rounded-0">Edytuj </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </h2>
            </div>
        </div>
        </div>
    </section>
</section>
</body>
</html>
