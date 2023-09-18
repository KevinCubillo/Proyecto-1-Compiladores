package com.compiladores;

import java_cup.runtime.Symbol;
import org.junit.jupiter.api.Test;
import java.io.FileReader;
import java.io.FileWriter;



import java.io.StringReader;

public class ParserTest {

    @Test
    public void TestLexer() throws Exception {

        String expresion = "int#Getedad(vaso){}string#getNombre(2.5){}";
        Lexer lexer = new Lexer(new StringReader(expresion));

        //Lexer lexer = new Lexer((new FileReader("src/test/java/com/compiladores/test.txt")));
        //FileWriter fw = new FileWriter("src/test/java/com/compiladores/tokens.txt", true);

        Symbol s;
        do {
            s = lexer.next_token();
            System.out.println("Token: " + s.value);

        } while (s.sym != ParserSym.EOF);
       // fw.flush();
        //fw.close();
    }

    @Test
    public void TestParser() throws Exception {
        String expresion = "int#Getedad(vaso){}string#getNombre(2.5){}";
        Lexer lexer = new Lexer(new StringReader(expresion));
        Parser parser = new Parser(lexer);
        parser.parse();

    }


}
