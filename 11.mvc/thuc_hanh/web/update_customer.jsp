<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/12/2021
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
    <h2>Update customer</h2>
    <form>
        <p>
            Name:
            <input type="text" name="name" value="${customerObj.name}"/>
        </p>
        <p>
            Date of birth:
            <input type="date" name="dateOfBirth" value="${customerObj.dateOfBirth}"/>
        </p>
        <p>
            <input type="submit" value="Update"/>
        </p>
    </form>
</body>
</html>
