import 'package:flutter/material.dart';
import 'package:furkandemirel_proje/controller/constants.dart';
import 'package:furkandemirel_proje/controller/game_controller.dart';
import 'package:furkandemirel_proje/widgets/custom_dialog.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          buildBoard(),
          ResetButton(),
          PlayerMode(),
        ],
      ),
    );
  }

  ResetButton() {
    return RaisedButton(
      padding: const EdgeInsets.all(20),
      child: Text(
        RESET_BUTTON_LABEL,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      onPressed: resetGame,
    );
  }

  resetGame() {
    setState(() {
      controller.reset();
    });
  }

  //grid view yapisi ayri ayri butonlar yapmaktansa cok daha pratik bir cozum getiriyor
  //
  buildBoard() {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: BOARD_SIZE,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: buildGame,
      ),
    );
  }

//her bir kutuya tiklandiginda olan islemler
  Widget buildGame(context, index) {
    return GestureDetector(
      onTap: () => isaretle(index),
      child: Container(
        color: controller.gameModelList[index].color,
        child: Center(
          child: Text(
            controller.gameModelList[index].symbol,
            style: TextStyle(
              fontSize: 72.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // isaretlemeleri yapan fonksiyon arka planda controller ile
  isaretle(index) {
    if (!controller.gameModelList[index].enable) return;

    setState(() {
      controller.kutuIsaretlet(index);
    });

    checkWinner();
  }

  //winner type enumdan check winner
  checkWinner() {
    var winner = controller.checkWinner();
    if (winner == WinnerType.none) {
      if (!controller.hasMoves) {
        showBerabereDialog();
      } else if (controller.isSinglePlayer && //tekli oyunda kotnrol
          controller.currentPlayer == PlayerType.player2) {
        final index = controller.otomatikHamle();
        isaretle(index);
      }
    } else {
      //coklu oyuncu konrol
      String symbol =
          winner == WinnerType.player1 ? PLAYER1_SYMBOL : PLAYER2_SYMBOL;
      showWinnerDialog(symbol);
    }
  }

  showWinnerDialog(String symbol) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomDialog(
          title: WIN_TITLE.replaceAll('[SYMBOL]', symbol),
          message: DIALOG_MESSAGE,
          onPressed: resetGame,
        );
      },
    );
  }

  showBerabereDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomDialog(
          title: TIED_TITLE,
          message: DIALOG_MESSAGE,
          onPressed: resetGame,
        );
      },
    );
  }

  PlayerMode() {
    return SwitchListTile(
      title: Text(controller.isSinglePlayer ? 'Single Player' : 'Two Players'),
      secondary: Icon(controller.isSinglePlayer
          ? Icons.person_outline
          : Icons.group_outlined),
      value: controller.isSinglePlayer,
      onChanged: (value) {
        setState(() {
          controller.isSinglePlayer = value;
        });
      },
    );
  }
}
