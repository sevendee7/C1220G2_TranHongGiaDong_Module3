package model.service.impl;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.CRUDRepository;
import model.repository.impl.CustomerRepositoryImpl;
import model.service.CRUDService;
import model.service.common.Validation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String,String> insert(Customer customer) {
        Map<String,String> mapError = new HashMap<>();
        if (!Validation.validateNameOrAddress(customer.getName())){
            mapError.put("name","Invalid format . (ex : Abc Abc) ");
        }

        if (!Validation.validateCustomerCode(customer.getId())){
            mapError.put("id","Invalid format . (ex : KH-XXXX , X is a number 0->9)");
        }

        if (!Validation.validateIdCard(customer.getIdCard())){
            mapError.put("idCard","Invalid format (ID card has 9 or 12 number) ");
        }

        if (!Validation.validatePhone(customer.getPhone())){
            mapError.put("phone","Invalid format . (ex : 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx)");
        }

        if (!Validation.validateEmail(customer.getEmail())){
            mapError.put("email","Invalid format (ex abc@abc.abc)");
        }

        if (!Validation.validateNameOrAddress(customer.getAddress())){
            mapError.put("address","Invalid format . (ex : Abc Abc) ");
        }

        if(mapError.isEmpty()){
            if(!customerRepository.insertNewRecord(customer)){
                mapError.put("error","Something wrong, try again");
            }
        }

        return mapError;
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
