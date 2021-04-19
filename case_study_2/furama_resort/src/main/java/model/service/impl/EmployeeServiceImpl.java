package model.service.impl;

import model.bean.Employee;
import model.repository.CRUDReopsitory;
import model.repository.impl.EmployeeRepositoryImpl;
import model.service.CRUDService;

import java.util.List;

public class EmployeeServiceImpl implements CRUDService<Employee> {

    private CRUDReopsitory<Employee> employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return this.employeeRepository.findAll();
    }

    @Override
    public void insertUser(Employee employee) {

    }

    @Override
    public boolean save(Employee employee) {
        if (employee.getName().matches("[A-Za-z ]+")) {
            return this.employeeRepository.save(employee);
        }
        return false;
    }

    @Override
    public Employee findById(Integer id) {
        return this.employeeRepository.findById(id);
    }

    @Override
    public List<Employee> searchByKeyword(String keywordJSP) {
        return this.employeeRepository.searchByKeyword(keywordJSP);
    }
}
