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
    public List<Customer> searchByMultipleKeyword(String nameKeyword, String idKeyword, String emailKeyword) {
        return customerRepository.searchByMultipleKeyword(nameKeyword,idKeyword,emailKeyword);
    }

}
