import 'package:projeto_inicial/projeto_inicial.dart' as projeto_inicial;
import 'package:test/expect.dart';
import 'dart:io';

void main() {
  final inicio = iniciarSistema();

  if (inicio != "1") return;

  final calculadora = Calculadora();
  final escolha = opcoesDeCalculo();
  verificaEscolha(escolha, calculadora);
}

String iniciarSistema() {
  print(
      "Seja bem-vindo à calculadora.\nDigite '0' para sair ou '1' para iniciar:");
  return stdin.readLineSync() ?? "0";
}

String opcoesDeCalculo() {
  print("Por favor, escolha uma operação:\n0 - soma\n1 - subtração "
          "\n2 - multiplicação \n3 - divisao"
  );
  return stdin.readLineSync() ?? "";
}

void verificaEscolha(String escolha, Calculadora calculadora) {
  if (escolha != "0" && escolha != "1" && escolha != "2" && escolha != "3") return;

  String operacao = '';
  if(escolha == "0"){
    operacao = "somar";
  }else if(escolha == "1"){
    operacao = "subtrair";
  }else if(escolha == "2"){
    operacao = "multiplicar";
  }else{
    operacao = "dividir";
  }

  final listaDeNumeros = recolheNumeros(operacao);
  if (operacao == "somar") calculadora.somar(listaDeNumeros);
  if (operacao == "subtrair") calculadora.subtrair(listaDeNumeros);
  if (operacao == "multiplicar") calculadora.multiplicar(listaDeNumeros);
  if (operacao == "dividir") calculadora.dividir(listaDeNumeros);
}

List<num> recolheNumeros(String nome) {
  final valores = <num>[];
  print("Por favor, insira os valores que deseja $nome");

  while (true) {
    final valor = stdin.readLineSync() ?? "";
    if (valor.isEmpty) {
      print("Você digitou um valor inválido, por favor digite outro.");
      continue;
    }
    if (valor == "q") break;
    valores.add(num.parse(valor));
  }

  return valores;
}

class Calculadora {
  void somar(List<num> numeros) {
    final resultado = numeros.reduce((a, b) => a + b);
    print("Resultado da soma: $resultado");
  }

  void subtrair(List<num> numeros) {
    final resultado = numeros.reduce((a, b) => a - b);
    print("Resultado da subtração: $resultado");
  }

  num multiplicar(List<num> numeros) {
    final resultado = numeros.reduce((a, b) => a * b);
    print("Resultado da multiplicação: $resultado");
    return resultado;
  }

  num dividir(List<num> numeros) {
    final resultado = numeros.reduce((a, b) => a / b);
    print("Resultado da divisão: $resultado");
    return resultado;
  }
}
