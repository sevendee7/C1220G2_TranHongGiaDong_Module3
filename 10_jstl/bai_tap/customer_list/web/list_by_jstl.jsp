<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
    <style>
        table {
            border-collapse: collapse;
            border: 1px solid black;
            background-color: antiquewhite;
        }

        table th, td {
            text-align: center;
            padding: 0;
        }

    </style>
</head>
<body>
<h2>List customer by JSTL</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Date of Birth</th>
        <th>Address</th>
        <th>Picture</th>
    </tr>
    <c:forEach var="customer" items="${customerListServlet}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.image}" width="300px" height="300px"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
