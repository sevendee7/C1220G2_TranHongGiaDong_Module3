<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/js/bootstrap.min.js">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
<h2 style="text-align: center">Update Employee</h2>
<c:if test="${msg.equals('Update successfully!')}">
    <p style="color: blue">${msg}</p>
</c:if>
<c:if test="${msg.equals('Update failed!')}">
    <p style="color: red">${msg}</p>
</c:if>
<br>
<form action="/employees" method="post">
    <table class="table table-striped" style="width: 30%; margin: auto;border: 1px solid black">
        <tr>
            <th>Name:</th>
            <td><input type="text" name="name" value="${employeeObj.name}"/></td>
        </tr>
        <tr>
            <th>Date of Birth:</th>
            <td><input type="text" name="birthday" value="${employeeObj.dateOfBirth}"/></td>
        </tr>
        <tr>
            <th>ID Card:</th>
            <td><input type="text" name="idCard" value="${employeeObj.idCard}"/></td>
        </tr>
        <tr>
            <th>Salary:</th>
            <td><input type="text" name="salary" value="${employeeObj.salary}"/></td>
        </tr>
        <tr>
            <th>Phone:</th>
            <td><input type="text" name="phone" value="${employeeObj.phone}"/></td>
        </tr>
        <tr>
            <th>Email:</th>
            <td><input type="text" name="email" value="${employeeObj.email}"/></td>
        </tr>
        <tr>
            <th>Address:</th>
            <td><input type="text" name="address" value="${employeeObj.address}"/></td>
        </tr>
        <tr>
            <th>
                <label for="position">Position:</label>
            </th>
            <td>
                <select name="positionId" id="position">
                    <option value="1">Receptionist</option>
                    <option value="2">Operator</option>
                    <option value="3">Captain</option>
                    <option value="4">Supervisor</option>
                    <option value="5">Manager</option>
                    <option value="6">General Manager</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>
                <label for="eduction">Education:</label>
            </th>
            <td>
                <select name="educationId" id="eduction">
                    <option value="1">High School</option>
                    <option value="2">College</option>
                    <option value="3">University</option>
                    <option value="4">Post Graduate</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>
                <label for="department">Department:</label>
            </th>
            <td>
                <select name="departmentId" id="department">
                    <option value="1">Sale Marketing</option>
                    <option value="2">Operation</option>
                    <option value="3">Server</option>
                    <option value="4">Manager</option>
                </select>
            </td>
        </tr>
        <tr>
            <input type="hidden" name="actionClient" value="update">
            <input type="hidden" name="id" value="${employeeObj.id}">
        </tr>
        <tr>
            <td>
                <input type="hidden" name="userName" value="${employeeObj.userName}"/>
                <input type="submit" class="btn btn-lg btn-primary" value="Update Employee"/>
            </td>
        </tr>
    </table>
</form>
<script src="../jquery-3.6.0.min.js"></script>
<script src="../bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
</body>
</html>
