<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/js/bootstrap.min.js">
<link rel="stylesheet" href="../bootstrap-4.6.0-dist/css/bootstrap.min.css">
<html>
<head>
    <title>List Customer</title>
</head>
<style>
    th {
        background-color: #b9bbbe;
        text-align: center;
    }
    td {
        text-align: center;
    }
</style>
<body>
<h2 style="text-align: center">Customer Management</h2>
<h6>
    <a href="/customers?actionClient=create"><i class="fas fa-user-plus" style="font-size: 1.5rem"> Add New Customer</i></a>
</h6>
<form class="form-inline my-2 my-lg-0">
    <input type="hidden" name="actionClient" value="searchByName" />
    <input class="form-control mr-sm-2" name="keywordName" value="${keywordName}" type="search" placeholder="Search by name" aria-label="Search">
    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
</form>
<br>
<form class="form-inline my-2 my-lg-0">
    <input type="hidden" name="actionClient" value="searchById" />
    <input class="form-control mr-sm-2" name="keywordId" value="${keywordId}" type="search" placeholder="Search by id" aria-label="Search">
    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
</form>
<br>
<form class="form-inline my-2 my-lg-0">
    <input type="hidden" name="actionClient" value="searchByEmail" />
    <input class="form-control mr-sm-2" name="keywordEmail" value="${keywordEmail}" type="search" placeholder="Search by email" aria-label="Search">
    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
</form>
<br>
<table class="table table-striped">
    <thead>
    <tr>
        <th>No</th>
        <th>Id</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Gender</th>
        <th>ID Card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Customer Type</th>
        <th colspan="2">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerListServlet}" varStatus="loop">

        <tr>
            <td>${loop.index + 1}</td>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>
                <c:if test="${customer.gender == true}">
                    Male
                </c:if>
                <c:if test="${customer.gender == false}">
                    Female
                </c:if>
            </td>
            <td>${customer.idCard}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <c:forEach var="customerType" items="${customerTypeServlet}">
                <c:if test="${customerType.typeId == customer.typeId}">
                    <td>${customerType.customerType}</td>
                </c:if>
            </c:forEach>
            <td><a href="/customers?actionClient=update&id=${customer.id}">
                <i class="far fa-edit" style="font-size: 1.5rem"></i>
            </a></td>
            <td>
                <button type="button" class="btn btn-danger"
                        onclick="sendIdToForm('${customer.id}','${customer.name}')">
                    <i class="far fa-trash-alt"></i>
                </button>
            </td>
        </tr>

    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Delete Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">Do you want to delete <span id="nameDelete"></span>
                <form action="/customers">
                    <input type="hidden" name="actionClient" value="delete">
                    <input type="hidden" name="id" value="idDelete" id="idDelete">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
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
    function sendIdToForm(employeeId,employeeName) {

        $('#staticBackdrop').modal('show');
        document.getElementById("idDelete").value = employeeId;
        document.getElementById("nameDelete").innerText = employeeName;
    }
</script>
</body>
</html>
