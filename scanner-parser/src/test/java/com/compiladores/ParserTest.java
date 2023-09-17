package com.compiladores;

import org.junit.jupiter.api.Test;

import java.io.StringReader;

public class ParserTest {

    @Test
    public void ParserAnalysis() throws Exception {
        String expresion = "2*4+6*3";
        Lexer lexer = new Lexer(new StringReader(expresion));
        Parser p = new Parser(lexer);
        Integer resultado = (Integer) p.parse().value;

    }

}
