import 'package:flutter/material.dart';

const int BOARD_SIZE = 9;

const Color PLAYER1_COLOR = Colors.red;
const Color PLAYER2_COLOR = Colors.blue;

String PLAYER1_SYMBOL;
String PLAYER2_SYMBOL;

int xScore = 0, oScore = 0;

//const String PLAYER1_SYMBOL = 'X';
//const String PLAYER2_SYMBOL = 'O';

const String GAME_TITLE = 'Tic Tac Toe';
const String TIED_TITLE = 'Game Tied!';
const String WIN_TITLE = 'Player [SYMBOL] won!';
const String DIALOG_MESSAGE = 'Press the reset button to start again!';
const String SINGLE_PLAYER_MODE_LABEL = 'Single Player';
const String MULTIPLAYER_MODE_LABEL = 'Two Players';
const String RESET_BUTTON_LABEL = 'Reset';

enum PlayerType { player1, player2 }
enum WinnerType { none, player1, player2 }

final themeApp = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.red,
  buttonTheme: ButtonThemeData(
    height: 52,
    textTheme: ButtonTextTheme.primary,
  ),
);

const winnerRules = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7],
];
/*
X-X-X
=========
---
XXX
---
========
---
---
XXX
======
X
X
X
==========

 */
