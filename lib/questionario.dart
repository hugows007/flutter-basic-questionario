import 'package:flutter/material.dart';
import 'package:projetoperguntas/questao.dart';
import 'package:projetoperguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas.elementAt(perguntaSelecionada)['resposta']
        : null;

    return Container(
      child: Column(
        children: <Widget>[
          Questao(perguntas.elementAt(perguntaSelecionada)['texto']),
          ...respostas.map((resp) {
            return Resposta(
              resp['texto'],
              () => responder(resp['pontuacao']),
            );
          }).toList()
        ],
      ),
    );
  }
}
