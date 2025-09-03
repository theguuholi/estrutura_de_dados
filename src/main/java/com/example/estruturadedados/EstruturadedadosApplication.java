package com.example.estruturadedados;

import java.util.Scanner;

import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EstruturadedadosApplication {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("Bem vindo aluno, digite o seu nome ");
		var nome = in.nextLine();
		System.out.println("Bem vindo aluno, " + nome);

		System.out.println("Digite sua idade ");
		var idade = in.nextInt();
		System.out.println("Sua idade é " + idade);

		var dias = idade * 365;
		System.out.println("voce ja viveu: " + dias + " dias");

		in.close();
	}

}
