package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.util.List;

public interface CRUDRepository<E> {

    List<E> findAll();

    void insertNewRecord(E e);

    boolean delete(int id);

    boolean save(E e);

    E findById(Integer id);

    Customer findCustomerById(String id);

    List<E> searchByMultipleKeyword(String nameKeyword, String idKeyword, String emailKeyword);

}
