package br.dev.rplus;

import br.dev.rplus.lexico.AnalisadorLexico;
import br.dev.rplus.sintatico.Parser;
import br.dev.rplus.sintatico.Tokens;
import java_cup.runtime.Symbol;

import java.io.*;


public class Main {
    public static void main(String[] args) {

        final String ROOT_PATH = "src/test/java/main.rp";

        try {
            AnalisadorLexico al = new AnalisadorLexico(new FileReader(ROOT_PATH));
            System.out.println("Analise lexica...");
            System.out.println("Lista de tokens:");
            Symbol s = al.next_token();

            while (s.sym != Tokens.EOF) {
                System.out.printf("|%d, %s|\n", s.sym, s.value);
                s = al.next_token();
            }

            System.out.println("Analise sintática...");
            Parser parser = new Parser(new AnalisadorLexico(new FileReader(ROOT_PATH)));
            Symbol ret = parser.parse();
            System.out.println(ret.toString());
//            p.debug_parse();

            System.out.println("Sucesso!");
        } catch (FileNotFoundException e) {
            System.out.println("Erro: Arquivo não encontrado!");
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}