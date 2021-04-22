package model.service.impl;

import model.bean.Employee;
import model.repository.CRUDRepository;
import model.repository.impl.EmployeeRepositoryImpl;
import model.service.CRUDService;

import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements CRUDService<Employee> {

    private CRUDRepository<Employee> employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return this.employeeRepository.findAll();
    }

    @Override
    public boolean save(Employee employee) {
        if (employee.getName().matches("[A-Za-z ]+")) {
            return this.employeeRepository.save(employee);
        }
        return false;
    }

    @Override
    public Map<String, String> insert(Employee employee) {
        return null;
    }

    @Override
    public Employee findById(Integer id) {
        return this.employeeRepository.findById(id);
    }

    @Override
    public List<Employee> searchByMultipleKeyword(String nameKeyword, String idKeyword, String emailKeyword) {
        return employeeRepository.searchByMultipleKeyword(nameKeyword,idKeyword,emailKeyword);
    }

}
