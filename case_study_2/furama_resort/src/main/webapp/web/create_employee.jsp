
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/js/bootstrap.min.js">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<html>
<head>
    <title>Furama Management Application</title>
</head>
<body>
<h1 style="text-align: center">Employee Management</h1>
<h2 style="text-align: center">
    <a href="/employees?actionClient=">List All Employee</a>
</h2>
<h2 style="text-align: center">Add New Employee</h2>
<div>
    <form method="post" >
        <table border="1" cellpadding="5" style="border: 5px solid grey; margin: auto">
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Date of Birth:</th>
                <td>
                    <input type="text" name="dateOfBirth" id="dateOfBirth" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Id Card:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Salary:</th>
                <td>
                    <input type="text" name="salary" id="salary" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="45"/>
                </td>
            </tr>
            <tr>
                <th>
                    <label for="position">Position:</label>
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
                </th>
            </tr>
            <tr>
                <th>
                    <label for="eduction">Education:</label>
                <td>
                    <select name="educationId" id="eduction">
                        <option value="1">High School</option>
                        <option value="2">College</option>
                        <option value="3">University</option>
                        <option value="4">Post Graduate</option>
                    </select>
                </td>
                </th>
            </tr>
            <tr>
                <th>
                    <label for="department">Department:</label>
                <td>
                    <select name="departmentId" id="department">
                        <option value="1">Sale Marketing</option>
                        <option value="2">Operation</option>
                        <option value="3">Server</option>
                        <option value="4">Manager</option>
                    </select>
                </td>
                </th>
            </tr>

                    <input type="hidden" name="userName" id="userName" size="45"/>

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
