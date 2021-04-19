<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/js/bootstrap.min.js">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<html>
<head>
    <title>List employee by JSTL</title>
</head>
<style>
    th {
        text-align: center;
    }
</style>
<body>
<h2 style="text-align: center">Employee Management</h2>
<h6>
    <a href="/employees?actionClient=create"><i class="fas fa-user-plus" style="font-size: 1.5rem">  Add New Employee</i></a>
</h6>
<form action="/employees">
    <input type="hidden" name="actionClient" value="search" />
    <input type="text" name="keyword" value="${keywordJSP}" placeholder="Search by name"/>
    <input type="submit" value="Search" />
</form>
<table border="1" width="100%">
    <tr>
        <th>No</th>
        <th>Id</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>ID Card</th>
        <th>Salary</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position</th>
        <th>Education</th>
        <th>Department</th>
        <th>Username</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach var="employee" items="${employeeListServlet}" varStatus="loop">
        <tr>
            <td>${loop.index + 1}</td>
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td>${employee.dateOfBirth}</td>
            <td>${employee.idCard}</td>
            <td>${employee.salary}</td>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
            <td>${employee.positionName}</td>
            <td>${employee.educationDegree}</td>
            <td>${employee.departmentName}</td>
            <td>${employee.userName}</td>
            <td><a href="/employees?actionClient=update&id=${employee.id}">
                <i class="far fa-edit" style="font-size: 1.5rem"></i>
            </a></td>
            <td>
                <button type="button" class="btn btn-danger" onclick="sendIdToForm(${employee.id})" >
                    <i class="far fa-trash-alt"></i>
            </button>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Delete Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">Do you want to delete?
                <form action="/employees">
                    <input type="hidden" name="actionClient" value="delete">
                    <input type="hidden" name="id" value="idDelete" id="idDelete">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Confirm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../jquery-3.6.0.min.js"></script>
<script src="../bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<script>
    function sendIdToForm(employeeId) {
        $('#staticBackdrop').modal('show');
        document.getElementById("idDelete").value = employeeId;
    }
</script>
</body>
</html>