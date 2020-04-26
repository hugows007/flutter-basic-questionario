import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns: ${pontuacao}';
    } else if (pontuacao < 12) {
      return 'Você é bom : ${pontuacao}';
    } else if (pontuacao < 20) {
      return 'Impressionante: ${pontuacao}';
    } else {
      return 'Nível Jedi: ${pontuacao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(fontSize: 28),
            ),
          ),
          FlatButton(
            child: Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            textColor: Colors.blue,
            onPressed: quandoReiniciarQuestionario,
          )
        ],
      ),
    );
  }
}
