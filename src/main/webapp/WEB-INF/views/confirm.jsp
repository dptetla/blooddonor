<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 12.07.2022
  Time: 14:48
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
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
<%--                <button class="btn btn-color rounded-0" type="submit">Zaloguj</button>--%>
                <a href="<c:url  value="/login/remove?id=${id}" /> " button class="btn btn-color rounded-0">Usuń </a>
                <a href="<c:url  value="/login/listdonation"/> " button class="btn btn-color rounded-0">Anuluj </a>
<%--                    <h1 class="text-color-darker">Logowanie</h1>--%>
<%--                    <div class="form-group">--%>
<%--                        <div><label> Nazwa Użytkownika : <input type="text" name="username"/> </label></div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <div><label> Hasło : <input type="password" name="password"/> </label></div>--%>
<%--                    </div>--%>
<%--                    <button class="btn btn-color rounded-0" type="submit">Zaloguj</button>--%>
<%--                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><br/>--%>

            </div>
        </div>
    </div>
</section>


</body>
</html>
