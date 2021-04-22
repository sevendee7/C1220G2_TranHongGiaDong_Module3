package model.service;

import model.bean.Employee;

import java.util.List;
import java.util.Map;

public interface CRUDService<E> {

    List<E> findAll();

    boolean save(E e);

    Map<String, String> insert(E e);

    E findById(Integer id);

    List<E> searchByMultipleKeyword(String nameKeyword, String idKeyword, String emailKeyword);}
