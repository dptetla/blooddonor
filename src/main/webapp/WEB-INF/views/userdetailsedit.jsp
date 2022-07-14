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
                    <form:form method='post' modelAttribute="details">
                        <h1 class="text-color-darker">Zmień dane</h1>
                        <div class="form-group">
                            <form:input path="age" placeholder="Wiek"/>
                        </div>
                        <div class="form-group">
                            Mężczyzna : <form:radiobutton path="sex" value="M"/><br/>
                            Kobieta : <form:radiobutton path="sex" value="W"/><br/>
                        </div>
                        <div class="form-group">
                            Grupa Krwi :<form:select path="bloodGroup">
                            <form:option value="ARh+">ARh+</form:option>
                            <form:option value="BRh+">BRh+</form:option>
                            <form:option value="ABRh+">ABRh+</form:option>
                            <form:option value="0Rh+">0Rh+</form:option>
                            <form:option value="ARh-">ARh-</form:option>
                            <form:option value="BRh-">BRh-</form:option>
                            <form:option value="ABRh-">ABRh-</form:option>
                            <form:option value="0Rh-">0Rh-</form:option>
                        </form:select>
                        </div>
                        <div class="form-group">
                            <form:input path="amountOfBlood"  placeholder="Ilość oddanej krwi"/>
                        </div>
                        <button class="btn btn-color rounded-0" type="submit">Zapisz</button>
                    </form:form>
                </h2>

            </div>
        </div>
        </div>
    </section>
</section>
</body>
</html>
