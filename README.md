<h1 align="center">Compilador RP ➕</h1>

> Status do projeto: ⏳ Em andamento


## Descrição do projeto 📝

<p align="justify">
Este presente projeto demonstra a implementação de um compilador completo, utilizando a linguagem de programação Java como base, com o auxilio das bibliotecas JFlex e CUP para o desenvolvimento das regras gramaticais e tokens.
</p>

## Definição do Problema 🤔

<p align="justify">
O problema consiste em desenvolver um compilador para a linguagem RP. A linguagem RP é uma linguagem de programação simples que possui uma sintaxe específica e um conjunto de funcionalidades limitadas. O compilador deve ser capaz de analisar o código fonte escrito na linguagem RP, e assim realizar a análise léxica, sintática e semântica.

As principais tarefas que o compilador deve realizar incluem:
</p>

- Análise Léxica: Identificar e tokenizar os diferentes elementos do código fonte, como palavras-chave, identificadores, operadores e símbolos especiais.
- Análise Sintática: Verificar se a estrutura do código está correta de acordo com as regras gramaticais da linguagem RP, utilizando uma gramática formal.
- Análise Semântica: Realizar verificações semânticas para garantir que as operações e tipos de dados utilizados no código estejam corretos e coerentes.

## Tecnologias 👨‍💻

<p align="center">
    <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java"/>
    <img src="https://img.shields.io/badge/JFlex-C22127?style=for-the-badge&logoColor=white" alt="JFlex"/>
    <img src="https://img.shields.io/badge/Cup-0085CA?style=for-the-badge&logoColor=white" alt="JFlex"/>
</p>

## Estrutura do Projeto 📁

A estrutura do projeto está organizada da seguinte maneira:

```
$PWD/
└── src/
    ├── main/
    │   └── java/
    │       └── br.dev.rplus/
    │           ├── lexico/
    │           │   ├── AnalisadorLexico.java
    │           │   └── Linguagem.flex
    │           ├── sintatico/
    │           │   ├── Parser.java
    │           │   ├── Tokens.java
    │           │   └── Gramatica.cup
    │           └── Main.java
    ├── test/
    │   └── java/
    │       └── main.rp
    └── README.md
```

## Configuração ⚙️

### Instalação

Para instalar as dependências do projeto é necessário possuir o gerenciador de pacotes Maven instalado. A seguir, siga estes passos:

1. Execute o comando `mvn install`.
2. Verifique se todas as dependências foram instaladas corretamente.

### Mudanças no projeto

Caso seja necessário modificar alguma parte da estrutura do projeto, siga estes passos:

1. Altere o arquivo `Linguagem.flex` com os novos elementos.
2. Altere o arquivo `Gramatica.cup` com as novas regras.
3. Execute o comando `mvn generate-sources`, para atualizar o projeto.

## Como executar ▶️

Para executar este projeto, siga estes passos:

1. Clone o repositório para sua máquina local.
2. Abra o projeto em seu ambiente de desenvolvimento Java.
3. Execute o arquivo `Main.java` para ver a demonstração.

## Sintaxe da linguagem RP 📄

Os detalhes sobre a sintaxe da linguagem podem ser encontrados na [documentação do compilador](https://github.com/rafandoo/compilador-rp/blob/0308020fca45f22c437abe1e90fe1e16c208f872/SINTAXE-RP.md)

## Licença 🔑

The [MIT License](https://github.com/rafandoo/compilador-rp/blob/33f514856c997842ee0218a6194bb5ef3f278dd7/LICENSE) (MIT)

Copyright :copyright: 2024 - Rafael Camargo
