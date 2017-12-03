/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.bean.BeanEstudioPIP;
import java.util.List;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Juanka
 */
public class EstudioPIPDAO {
    JdbcTemplate template;
    
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }  
    
    public List<BeanEstudioPIP> getEstudiosPIP() {
        return template.query(" select id, identificadorPIP, descripcion, montoInversionViable, fechaDeclaracion" +
                              " from estudiopreinversion", new RowMapper<BeanEstudioPIP>() {
            public BeanEstudioPIP mapRow(ResultSet rs, int row) throws SQLException {
                BeanEstudioPIP e = new BeanEstudioPIP();
                e.setId(rs.getString(1));
                e.setIdentificadorPIP(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setMontoInversionViable(rs.getString(4));
                e.setFechaDeclaracion(util.Utils.formatGetDate(rs.getString(5)));
                return e;
            }
        });
    }  
    
    public BeanEstudioPIP getEstudioPIPByCode(String code){  
        String sql=" select identificadorPIP, descripcion, montoInversionViable, fechaDeclaracion, id " +
                   " from estudiopreinversion where id=?";  
        return template.queryForObject(sql, new Object[]{code}, new BeanPropertyRowMapper<BeanEstudioPIP>(BeanEstudioPIP.class) {
            public BeanEstudioPIP mapRow(ResultSet rs, int row) throws SQLException {
                BeanEstudioPIP e = new BeanEstudioPIP();
                e.setIdentificadorPIP(rs.getString(1));
                e.setDescripcion(rs.getString(2));
                e.setMontoInversionViable(rs.getString(3));
                e.setFechaDeclaracion(util.Utils.formatGetDate(rs.getString(4)));
                e.setId(rs.getString(5));
                return e;
            }
        }); 
    } 
    
    public int update(BeanEstudioPIP p) throws DuplicateKeyException {
        
        String sql = "update estudiopreinversion"
                + " set identificadorPIP='" + p.getIdentificadorPIP()+ "', "
                + " descripcion='" + p.getDescripcion()+ "', "
                + " montoInversionViable='" + p.getMontoInversionViable()+ "', "
                + " fechaDeclaracion = STR_TO_DATE('" + p.getFechaDeclaracion() + "', '%d/%m/%Y') "
                + " where id=" + p.getId();
        
        return template.update(sql);
    }    
 
    public int save(BeanEstudioPIP p) throws DuplicateKeyException{
        String sql = "insert into estudiopreinversion(identificadorPIP, descripcion, montoInversionViable, fechaDeclaracion) "
                + " values('" + p.getIdentificadorPIP() + "', "
                + "        '" + p.getDescripcion() + "', "
                + "         " + p.getMontoInversionViable() + ", "
                + "         STR_TO_DATE('" + p.getFechaDeclaracion() + "', '%d/%m/%Y'))";
        return template.update(sql);
    }    
    
}
