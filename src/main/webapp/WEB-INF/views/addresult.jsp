<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 13.07.2022
  Time: 00:00
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

            <div class="container pt-4 pb-4">
            <div class="border-dashed view-height">
                <div class="container w-25">
                    <form:form class="padding-small text-center" method='post' modelAttribute="result">
                        <h1 class="text-color-darker">Dodaj badanie</h1>
                        <div class="form-group">
                            <form:input path="dayOfTest" type="Date" placeholder="Data badania"/>
                        </div>
                        <div class="form-group">
                            <form:input path="RBC" placeholder="RBC"/>
                        </div>
                        <div class="form-group">
                            <form:input path="HGB" placeholder="HGB"/>
                        </div>
                        <div class="form-group">
                            <form:input path="HCT" placeholder="HCT"/>
                        </div>
                        <div class="form-group">
                            <form:input path="MCV" placeholder="MCV"/>
                        </div>
                        <div class="form-group">
                            <form:input path="MCH" placeholder="MCH"/>
                        </div>
                        <div class="form-group">
                            <form:input path="MCHC" placeholder="MCHC"/>
                        </div>
                        <div class="form-group">
                            <form:input path="RDW" placeholder="RDW"/>
                        </div>
                        <button class="btn btn-color rounded-0" type="submit">Dodaj</button>
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
        </div>
        </div>
    </section>
</section>

</body>
</html>