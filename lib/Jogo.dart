import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('images/padrao.png');
  var _mensagem = 'Escolha uma opção abaixo:';

  void _opcaoSelecionada(String escolhaUsuario) {
    var _opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(_opcoes.length);
    var _escolhaApp = _opcoes[numero];

    switch (_escolhaApp) {
      case 'pedra':
        setState(() {
          this._imagemApp = AssetImage('images/pedra.png');
        });
        break;

      case 'papel':
        setState(() {
          this._imagemApp = AssetImage('images/papel.png');
        });
        break;

      case 'tesoura':
        setState(() {
          this._imagemApp = AssetImage('images/tesoura.png');
        });
        break;
    }

    if ((escolhaUsuario == 'pedra' && _escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && _escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && _escolhaApp == 'pedra')) {
      setState(() {
        this._mensagem = "Você venceu :) !!!";
      });
    } else if ((_escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (_escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (_escolhaApp == 'papel' && escolhaUsuario == 'pedra')) {
      setState(() {
        this._mensagem = "Você Perdeu :( !!!";
      });
    } else
      () {
        setState(() {
          this._mensagem = 'EMPATE :| !!!';
        });
      };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Jokenpo',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset(
                  'images/pedra.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset(
                  'images/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset(
                  'images/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
