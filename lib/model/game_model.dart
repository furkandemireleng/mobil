import 'package:flutter/material.dart';

class GameModel {
  final int id;
  String symbol;
  Color color;
  bool enable;

  GameModel(
    this.id, {
    this.symbol = '',
    this.color = Colors.black26,
    this.enable = true,
  });
}
