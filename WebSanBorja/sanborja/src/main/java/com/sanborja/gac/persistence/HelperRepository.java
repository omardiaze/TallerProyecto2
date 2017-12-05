/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sanborja.gac.persistence;

import java.sql.CallableStatement;
import java.sql.SQLException;
import org.hibernate.SessionFactory;
import org.hibernate.engine.spi.SessionImplementor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Marlon Cordova
 */
@Repository
@Transactional
public class HelperRepository {
    
    @Autowired
    SessionFactory sessionFactory;
    	
    public String GenerateCode(String tabla) {
        String codigo="";

        SessionImplementor sim = (SessionImplementor) sessionFactory.getCurrentSession();

        CallableStatement callableStatement;
            try {
                
                callableStatement = sim.connection().prepareCall("call uspEntidadGenerarCodigo(?,?)");
                callableStatement.setString(1,tabla);
                callableStatement.registerOutParameter(2, java.sql.Types.VARCHAR);
                callableStatement.executeUpdate() ;
                codigo = callableStatement.getString(2);
                
            } catch (SQLException e) {
                                                            // TODO Auto-generated catch block
                    e.printStackTrace();
            }	 

            return codigo;
    }
}
