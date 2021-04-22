<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/js/bootstrap.min.js">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<html>
<head>
    <title>Customer Management Application</title>
</head>
<body>
<h1 style="text-align: center">Add New Customer</h1>
<h2 style="text-align: center">
    <a href="/customers?actionClient=">List All Customer</a>
</h2>
<br>
<div>
    <h2 style="text-align:center; color: darkblue">${result}</h2>
    <h2 style="text-align:center; color: red">
        <c:if test="${mapError.get('error') != null}"/>
        <c:out value="${mapError.get('error')}"/>
    </h2>
    <form method="post">
        <table border="1" cellpadding="5" style="border: 5px solid grey; margin: auto">
            <tr>
                <th>Customer ID:</th>
                <td>
                    <input type="text" name="id" id="customerId" size="45"/>
                    <p style="color: red"><c:if test="${mapError.get('id') != null}"/>
                        <c:out value="${mapError.get('id')}"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                    <p style="color: red"><c:if test="${mapError.get('name') != null}"/>
                        <c:out value="${mapError.get('name')}"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Date of Birth:</th>
                <td>
                    <input type="date" name="dateOfBirth" id="dateOfBirth" size="45"/>
                </td>
            </tr>
            <tr>
                <th>
                    <label for="gender">Gender:</label>
                <td>
                    <select name="gender" id="gender">
                        <option value="true">Male</option>
                        <option value="false">Female</option>
                    </select>
                </td>
                </th>
            </tr>
            <tr>
                <th>Id Card:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="15"/>
                    <p style="color: red"><c:if test="${mapError.get('idCard') != null}"/>
                        <c:out value="${mapError.get('idCard')}"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="45"/>
                    <p style="color: red"><c:if test="${mapError.get('phone') != null}"/>
                        <c:out value="${mapError.get('phone')}"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15"/>
                    <p style="color: red"><c:if test="${mapError.get('email') != null}"/>
                        <c:out value="${mapError.get('email')}"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="45"/>
                    <p style="color: red"><c:if test="${mapError.get('address') != null}"/>
                        <c:out value="${mapError.get('address')}"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th>
                    <label for="customerType">Choose Customer Type:</label>
                <td>
                    <select name="customerType" id="customerType">
                        <option value="1">Diamond</option>
                        <option value="2">Platinum</option>
                        <option value="3">Gold</option>
                        <option value="4">Silver</option>
                        <option value="5">Member</option>
                    </select>
                </td>
                </th>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" class="btn btn-lg btn-primary" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<script src="../jquery-3.6.0.min.js"></script>
<script src="../bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
</body>
</html>
