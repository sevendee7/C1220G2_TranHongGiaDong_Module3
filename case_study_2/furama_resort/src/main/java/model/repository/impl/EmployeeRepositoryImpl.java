package model.repository.impl;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.BaseRepository;
import model.repository.CRUDRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements CRUDRepository<Employee> {

    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();

        try {
            Statement statement = this.baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select e.id, e.employee_name,e.employee_birthday,e.employee_id_card,e.employee_salary,e.employee_phone,e.employee_email,e.employee_address,p.position_name,edu.education_degree_name,d.department_name,e.user_username\n" +
                    "from employee e\n" +
                    "left join position p on e.position_id = p.id\n" +
                    "left join education_degree edu on e.education_degree_id = edu.id\n" +
                    "left join department d on e.department_id = d.id\n" +
                    "order by employee_name;");

            Employee employee = null;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setId(resultSet.getString(1));
                employee.setName(resultSet.getString(2));
                employee.setDateOfBirth(resultSet.getString(3));
                employee.setIdCard(resultSet.getString(4));
                employee.setSalary(Double.parseDouble(resultSet.getString(5)));
                employee.setPhone(resultSet.getString(6));
                employee.setEmail(resultSet.getString(7));
                employee.setAddress(resultSet.getString(8));
                employee.setPositionName(resultSet.getString(9));
                employee.setEducationDegree(resultSet.getString(10));
                employee.setDepartmentName(resultSet.getString(11));
                employee.setUserName(resultSet.getString(12));

                employeeList.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public void insertNewRecord(Employee employee) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("insert into employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,department_id,user_username)\n" +
                            "values\n" +
                            "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationId());
            preparedStatement.setInt(10, employee.getDepartmentId());
            preparedStatement.setString(11, employee.getUserName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted = false;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("delete from employee\n" +
                            "where id = ?");
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean save(Employee employee) {
        boolean rowUpdated = false;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("update employee\n" +
                            "set employee_name = ?,employee_birthday = ?,employee_salary = ?,employee_phone = ?,employee_address = ?,position_id = ?,education_degree_id = ?,department_id = ?\n" +
                            "where id =" + employee.getId());
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setDouble(3, employee.getSalary());
            preparedStatement.setString(4, employee.getPhone());
            preparedStatement.setString(5, employee.getAddress());
            preparedStatement.setInt(6, employee.getPositionId());
            preparedStatement.setInt(7, employee.getEducationId());
            preparedStatement.setInt(8, employee.getDepartmentId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public Employee findById(Integer id) {
        Employee employee = new Employee();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select *" +
                            "from employee\n" +
                            "where id = ?");

            preparedStatement.setString(1, id + "");

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                employee.setId(resultSet.getString(1));
                employee.setName(resultSet.getString(2));
                employee.setDateOfBirth(resultSet.getString(3));
                employee.setIdCard(resultSet.getString(4));
                employee.setSalary(Double.parseDouble(resultSet.getString(5)));
                employee.setPhone(resultSet.getString(6));
                employee.setEmail(resultSet.getString(7));
                employee.setAddress(resultSet.getString(8));
                employee.setPositionName(resultSet.getString(9));
                employee.setEducationDegree(resultSet.getString(10));
                employee.setDepartmentName(resultSet.getString(11));
                employee.setUserName(resultSet.getString(12));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employee;
    }

    @Override
    public Customer findCustomerById(String id) {
        return null;
    }

    @Override
    public List<Employee> searchByName(String keywordJSP) {
        List<Employee> employeeList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select e.id, e.employee_name,e.employee_birthday,e.employee_id_card,e.employee_salary,e.employee_phone,e.employee_email,e.employee_address,p.position_name,edu.education_degree_name,d.department_name,e.user_username\n" +
                            "from employee e\n" +
                            "left join position p on e.position_id = p.id\n" +
                            "left join education_degree edu on e.education_degree_id = edu.id\n" +
                            "left join department d on e.department_id = d.id\n" +
                            "where (e.employee_name like ?\n" +
                            "or e.employee_name like ?);");
            preparedStatement.setString(1,'%' + keywordJSP + '%');
            preparedStatement.setString(2, keywordJSP + '%');
            ResultSet resultSet = preparedStatement.executeQuery();

            Employee employee = null;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setId(resultSet.getString(1));
                employee.setName(resultSet.getString(2));
                employee.setDateOfBirth(resultSet.getString(3));
                employee.setIdCard(resultSet.getString(4));
                employee.setSalary(Double.parseDouble(resultSet.getString(5)));
                employee.setPhone(resultSet.getString(6));
                employee.setEmail(resultSet.getString(7));
                employee.setAddress(resultSet.getString(8));
                employee.setPositionName(resultSet.getString(9));
                employee.setEducationDegree(resultSet.getString(10));
                employee.setDepartmentName(resultSet.getString(11));
                employee.setUserName(resultSet.getString(12));

                employeeList.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public List<Employee> searchById(String keywordJSP) {
        List<Employee> employeeList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select e.id, e.employee_name,e.employee_birthday,e.employee_id_card,e.employee_salary,e.employee_phone,e.employee_email,e.employee_address,p.position_name,edu.education_degree_name,d.department_name,e.user_username\n" +
                            "from employee e\n" +
                            "left join position p on e.position_id = p.id\n" +
                            "left join education_degree edu on e.education_degree_id = edu.id\n" +
                            "left join department d on e.department_id = d.id\n" +
                            "where e.id like ? or e.id like ?\n" +
                            "order by e.employee_name;");
            preparedStatement.setString(1,'%' + keywordJSP + '%');
            preparedStatement.setString(2, keywordJSP + '%');
            ResultSet resultSet = preparedStatement.executeQuery();

            Employee employee = null;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setId(resultSet.getString(1));
                employee.setName(resultSet.getString(2));
                employee.setDateOfBirth(resultSet.getString(3));
                employee.setIdCard(resultSet.getString(4));
                employee.setSalary(Double.parseDouble(resultSet.getString(5)));
                employee.setPhone(resultSet.getString(6));
                employee.setEmail(resultSet.getString(7));
                employee.setAddress(resultSet.getString(8));
                employee.setPositionName(resultSet.getString(9));
                employee.setEducationDegree(resultSet.getString(10));
                employee.setDepartmentName(resultSet.getString(11));
                employee.setUserName(resultSet.getString(12));

                employeeList.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public List<Employee> searchByEmail(String keywordJSP) {
        List<Employee> employeeList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select e.id, e.employee_name,e.employee_birthday,e.employee_id_card,e.employee_salary,e.employee_phone,e.employee_email,e.employee_address,p.position_name,edu.education_degree_name,d.department_name,e.user_username\n" +
                            "from employee e\n" +
                            "left join position p on e.position_id = p.id\n" +
                            "left join education_degree edu on e.education_degree_id = edu.id\n" +
                            "left join department d on e.department_id = d.id\n" +
                            "where (e.employee_email like ?\n" +
                            "or e.employee_email like ?);");
            preparedStatement.setString(1,'%' + keywordJSP + '%');
            preparedStatement.setString(2, keywordJSP + '%');
            ResultSet resultSet = preparedStatement.executeQuery();

            Employee employee = null;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setId(resultSet.getString(1));
                employee.setName(resultSet.getString(2));
                employee.setDateOfBirth(resultSet.getString(3));
                employee.setIdCard(resultSet.getString(4));
                employee.setSalary(Double.parseDouble(resultSet.getString(5)));
                employee.setPhone(resultSet.getString(6));
                employee.setEmail(resultSet.getString(7));
                employee.setAddress(resultSet.getString(8));
                employee.setPositionName(resultSet.getString(9));
                employee.setEducationDegree(resultSet.getString(10));
                employee.setDepartmentName(resultSet.getString(11));
                employee.setUserName(resultSet.getString(12));

                employeeList.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    public static void main(String[] args) {
        EmployeeRepositoryImpl employeeRepository = new EmployeeRepositoryImpl();
        List<Employee> employeeList = employeeRepository.findAll();
        for (Employee employee : employeeList) {
            System.out.println(employee);
        }
    }
}
