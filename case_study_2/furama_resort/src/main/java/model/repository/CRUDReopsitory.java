package model.repository;

import model.bean.Employee;

import java.util.List;

public interface CRUDReopsitory<E> {

    List<E> findAll();

    void insertEmployee(E e);

    boolean delete(int id);

    boolean save(E e);

    Employee findById(Integer id);

    List<Employee> searchByKeyword(String keywordJSP);

}
