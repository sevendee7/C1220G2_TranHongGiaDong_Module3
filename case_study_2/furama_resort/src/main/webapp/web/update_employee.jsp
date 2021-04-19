
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
<h2>Update Employee</h2>
<p style="color: red">${msg}</p>
<form action="/employees" method="post">
    <input type="hidden" name="actionClient" value="update">
    <input type="hidden" name="id" value="${employeeObj.id}">
    <p>
        Name:
        <input type="text" name="name" value="${employeeObj.name}"/>
    </p>
    <p>
        Date of Birth:
        <input type="text" name="birthday" value="${employeeObj.dateOfBirth}"/>
    </p>
    <p>
        ID Card:
        <input type="text" name="idCard" value="${employeeObj.idCard}"/>
    </p>
    <p>
        Salary:
        <input type="text" name="salary" value="${employeeObj.salary}"/>
    </p>
    <p>
        Phone:
        <input type="text" name="phone" value="${employeeObj.phone}"/>
    </p>
    <p>
        Email:
        <input type="text" name="email" value="${employeeObj.email}"/>
    </p>
    <p>
        Address:
        <input type="text" name="address" value="${employeeObj.address}"/>
    </p>
    <p>
        Position:
        <input type="text" name="position" value="${employeeObj.positionName}"/>
    </p>
    <p>
        Education:
        <input type="text" name="education" value="${employeeObj.educationDegree}"/>
    </p>
    <p>
        Department:
        <input type="text" name="department" value="${employeeObj.departmentName}"/>
    </p>
    <input type="hidden" name="userName" value="${employeeObj.userName}">
    <p>
        <input type="submit" value="Update">
    </p>
</form>
</body>
</html>
