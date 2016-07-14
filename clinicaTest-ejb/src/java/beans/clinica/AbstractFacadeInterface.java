/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import java.util.List;

/**
 *
 * @author kari
 */
public interface AbstractFacadeInterface<T> {

    T create(T entity);

    T edit(T entity);

    T remove(T entity);

    /*
    boolean create(T entity);

    boolean edit(T entity);

    boolean remove(T entity);
     */
    T find(Object id);

    List<T> findAll();

    List<T> findRange(int[] range);

    int count();
}
