package model.bean;

public class Employee {
    private String id;
    private String name;
    private String dateOfBirth;
    private String idCard;
    private Double salary;
    private String phone;
    private String email;
    private String address;
    private Integer positionId;
    private String positionName;
    private Integer educationId;
    private String educationDegree;
    private Integer departmentId;
    private String departmentName;
    private String userName;

    public Employee() {
    }

    public Employee(String id, String name, String dateOfBirth, String idCard, Double salary, String phone, String email, String address, String positionName, String educationDegree, String departmentName, String userName) {
        this.id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionName = positionName;
        this.educationDegree = educationDegree;
        this.departmentName = departmentName;
        this.userName = userName;
    }

    public Employee(String name, String dateOfBirth, String idCard, Double salary,
                    String phone, String email, String address, Integer positionId, Integer educationId,
                    Integer departmentId, String userName) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionId = positionId;
        this.educationId = educationId;
        this.departmentId = departmentId;
        this.userName = userName;
    }

    public Employee(String id, String name, String dateOfBirth, String idCard, Double salary, String phone,
                    String email, String address, Integer positionId, Integer educationId, Integer departmentId,
                    String userName) {
        this.id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionId = positionId;
        this.educationId = educationId;
        this.departmentId = departmentId;
        this.userName = userName;
    }

    public Employee(String name, String dateOfBirth, String idCard, Double salary, String phone, String email, String address, String positionName, String educationDegree, String departmentName) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionName = positionName;
        this.educationDegree = educationDegree;
        this.departmentName = departmentName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public Integer getEducationId() {
        return educationId;
    }

    public void setEducationId(Integer educationId) {
        this.educationId = educationId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(String educationDegree) {
        this.educationDegree = educationDegree;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", birthday='" + dateOfBirth + '\'' +
                ", idCard='" + idCard + '\'' +
                ", salary=" + salary +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", position=" + positionName +
                ", education=" + educationDegree +
                ", department=" + departmentName +
                ", userName='" + userName + '\'' +
                '}';
    }
}
