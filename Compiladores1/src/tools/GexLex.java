/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.io.File;

/**
 *
 * @author Alexander
 */
public class GexLex {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String archivo = "Expresiones.flex";
        String ruta = "src"+File.separator+"Principal"+File.separator+archivo;
        jflex.Main.generate(new File(ruta));
    }
    
}
