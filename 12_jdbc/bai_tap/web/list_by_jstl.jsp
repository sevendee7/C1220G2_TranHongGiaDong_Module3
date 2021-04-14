<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List user by JSTL</title>
</head>
<body>
<h2>User Management</h2>
<h2>
    <a href="/users?actionClient=create">Add New User</a>
</h2>
<form action="/users">
    <input type="hidden" name="actionClient" value="search" />
    <input type="text" name="keyword" value="${keywordJSP}" placeholder="Search by country"/>
    <input type="submit" value="Search" />
</form>
<table border="1">
    <tr>
        <th>No</th>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="2">Action</th>
    </tr>
    <%--        for (Student student : studentListJSP) {--%>
    <c:forEach var="user" items="${userListServlet}" varStatus="loop">
        <tr>
            <td>${loop.index + 1}</td>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/users?actionClient=update&id=${user.id}">Update</a></td>
            <td><a href="/users?actionClient=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>