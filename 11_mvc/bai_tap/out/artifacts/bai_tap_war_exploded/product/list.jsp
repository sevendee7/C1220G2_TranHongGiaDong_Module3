<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Brand</td>
        <td>Price</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>
                <a href="/products?action=view&id=${product.getId()}">${product.getName()}</a>
            </td>
            <td>
                ${product.getBrand()}
            </td>
            <td>
                ${product.getPrice()}
            </td>
            <td>
                <a href="/products?action=edit&id=${product.getId()}">Edit</a>
            </td>
            <td>
                <a href="/products?action=delete&id=${product.getId()}">delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
