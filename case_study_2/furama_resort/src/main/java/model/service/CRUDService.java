package model.service;

import model.bean.Employee;

import java.util.List;

public interface CRUDService<E> {

    List<E> findAll();

    boolean save(E e);

    E findById(Integer id);

    List<E> searchByName(String keywordJSP);

    List<E> searchById(String keywordJSP);

    List<E> searchByEmail(String keywordJSP);
}
