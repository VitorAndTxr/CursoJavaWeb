/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Cogeti
 */
public class ConectaBanco {
    Connection con = null;
    String caminho = "jdbc:postgresql://localhost:5432/";
    String usuario = "postgres";
    String senha = "04091995";
    
    public Connection conectaPostgre(String banco) throws ClassNotFoundException{
        try{
            Class.forName("org.postgresql.Driver");
            try{
                con = DriverManager.getConnection(caminho+banco, usuario, senha);
            } catch(SQLException ex){
                System.out.println("Caminho, senha ou usuário incorretos");
            }
        }catch(ClassNotFoundException ex){
            System.out.printf("Driver não encontrado");
        }
        return con;
    }
}
