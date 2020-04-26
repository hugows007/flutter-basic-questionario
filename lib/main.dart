import 'package:flutter/material.dart';
import 'package:projetoperguntas/questao.dart';
import 'package:projetoperguntas/questionario.dart';
import 'package:projetoperguntas/resposta.dart';
import 'package:projetoperguntas/resultado.dart';

//main() {
//  runApp(new PerguntaAPP());
//}

main() => runApp(PerguntaAPP());

class _PerguntaAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 2},
        {'texto': 'Branco', 'pontuacao': 3}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 8},
        {'texto': 'Elefante', 'pontuacao': 9},
        {'texto': 'Leão', 'pontuacao': 6},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': [
        {'texto': 'Maria', 'pontuacao': 1},
        {'texto': 'João', 'pontuacao': 6},
        {'texto': 'Leo', 'pontuacao': 8},
        {'texto': 'Pedro', 'pontuacao': 7},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_perguntaSelecionada);
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: Text('Flutter')
        home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas'),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder,
                  )
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario)));
  }
}

class PerguntaAPP extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
