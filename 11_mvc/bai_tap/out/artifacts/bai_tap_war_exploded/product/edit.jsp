<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/12/2021
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit Product</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/products">Back to product list</a>
    </p>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>
                    <input type="text" name="name" id="name" value="${requestScope["product"].getName()}">
                </td>
            </tr>
            <tr>
                <td>Brand: </td>
                <td>
                    <input type="text" name="brand" id="brand" value="${requestScope["product"].getBrand()}">
                </td>
            </tr>
            <tr>
                <td>Price: </td>
                <td>
                    <input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Update product">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
