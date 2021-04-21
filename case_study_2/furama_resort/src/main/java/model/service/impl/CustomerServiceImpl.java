package model.service.impl;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.CRUDRepository;
import model.repository.impl.CustomerRepositoryImpl;
import model.service.CRUDService;

import java.util.List;

public class CustomerServiceImpl implements CRUDService<Customer> {

    private CRUDRepository<Customer> customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public boolean save(Customer customer) {
        if (customer.getName().matches("[A-Za-z ]+")) {
            return this.customerRepository.save(customer);
        }
        return false;
    }

    @Override
    public Customer findById(Integer id) {
        return null;
    }

    @Override
    public List<Customer> searchByName(String keywordJSP) {
        return customerRepository.searchByName(keywordJSP);
    }

    @Override
    public List<Customer> searchById(String keywordJSP) {
        return customerRepository.searchById(keywordJSP);
    }

    @Override
    public List<Customer> searchByEmail(String keywordJSP) {
        return customerRepository.searchByEmail(keywordJSP);
    }

}
