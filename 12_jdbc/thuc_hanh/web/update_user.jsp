<%--
  Created by IntelliJ IDEA.
  User: Pato
  Date: 12/04/2021
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Update user</h2>
<p style="color: red">${msg}</p>
<form action="/users" method="post">
    <input type="hidden" name="actionClient" value="update">
    <input type="hidden" name="id" value="${userObj.id}">
    <p>
        Name:
        <input type="text" name="name" value="${userObj.name}"/>
    </p>
    <p>
        Email:
        <input type="text" name="email" value="${userObj.email}"/>
    </p>
    <p>
        Country:
        <input type="text" name="country" value="${userObj.country}"/>
    </p>
    <p>
        <input type="submit" value="Update">
    </p>
</form>
</body>
</html>
