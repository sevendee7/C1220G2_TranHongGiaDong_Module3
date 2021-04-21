<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/js/bootstrap.min.js">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<html>
<head>
    <title>Update Customer</title>
</head>
<body>
<h2 style="text-align: center">Update Customer</h2>
<c:if test="${msg.equals('Update successfully!')}">
    <p style="color: blue">${msg}</p>
</c:if>
<c:if test="${msg.equals('Update failed!')}">
    <p style="color: red">${msg}</p>
</c:if>
<form action="/customers" method="post">
    <table style="margin: auto">
        <tr>
            <input type="hidden" name="id" value="${customerObj.id}"/>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" value="${customerObj.name}"/></td>
        </tr>
        <tr>
            <td>Date of Birth:</td>
            <td><input type="text" name="dateOfBirth" value="${customerObj.dateOfBirth}"/></td>
        </tr>
        <tr>
            <td>
                <label for="gender">Gender:</label>
            </td>
            <td>
                <select name="gender" id="gender">
                    <option value="true">Male</option>
                    <option value="false">Female</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>ID Card:</td>
            <td><input type="text" name="idCard" value="${customerObj.idCard}"/></td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><input type="text" name="phone" value="${customerObj.phone}"/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email" value="${customerObj.email}"/></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" name="address" value="${customerObj.address}"/></td>
        </tr>
        <tr>
            <td>
                <label for="customerType">Choose Customer Type:</label>
            </td>
            <td>
                <select name="customerType" id="customerType">
                    <option value="1">Diamond</option>
                    <option value="2">Platinum</option>
                    <option value="3">Gold</option>
                    <option value="4">Silver</option>
                    <option value="5">Member</option>
                </select>
            </td>
        </tr>
        <input type="hidden" name="actionClient" value="update">
        <input type="hidden" name="id" value="${customerObj.id}">
        <tr>
            <td>
                <input type="submit" class="btn btn-lg btn-primary" value="Update Customer" style="font-size: 1rem"/>
            </td>
        </tr>
    </table>
</form>
<script src="../jquery-3.6.0.min.js"></script>
<script src="../bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
</body>
</html>
