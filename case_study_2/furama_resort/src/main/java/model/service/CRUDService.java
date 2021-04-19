package model.service;

import model.bean.Employee;

import java.util.List;

public interface CRUDService<E> {
    List<E> findAll();

    void insertUser(E e);

    boolean save(E e);

    Employee findById(Integer id);

    List<E> searchByKeyword(String keywordJSP);
}
