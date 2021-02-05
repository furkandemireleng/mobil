import 'dart:math';
import 'package:furkandemirel_proje/controller/constants.dart';
import 'package:furkandemirel_proje/model/game_model.dart';

class GameController {
  List<GameModel> gameModelList = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  PlayerType currentPlayer; //hamle sirasi hangi oyuncudaysa o current playerdir
  bool isSinglePlayer;

  bool get hasMoves =>
      (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  GameController() {
    initialize();
  }

  void initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.player1;
    isSinglePlayer = false;
    gameModelList =
        List<GameModel>.generate(BOARD_SIZE, (index) => GameModel(index + 1));
  }

  void reset() {
    initialize();
  }

  void kutuIsaretlet(index) {
    final model = gameModelList[index];
    if (currentPlayer == PlayerType.player1) {
      isaretlePlayer1(model);
    } else {
      isaretlePlayer2(model);
    }

    model.enable = false;
  }

  void isaretlePlayer1(GameModel model) {
    model.symbol = PLAYER1_SYMBOL;
    model.color = PLAYER1_COLOR;
    movesPlayer1.add(model.id);
    currentPlayer = PlayerType.player2;
  }

  void isaretlePlayer2(GameModel model) {
    model.symbol = PLAYER2_SYMBOL;
    model.color = PLAYER2_COLOR;
    movesPlayer2.add(model.id);
    currentPlayer = PlayerType.player1;
  }

  //contains metodunun ozelligini kullanarak 1=2=3 veya 3-2-1 oynamasi
  //sonucu degistirmemis oluyor bu sayede her durum icin ayri liste yapmaktan kurtulmnus oluyoruz
  bool checkPlayerWinner(List<int> moves) {
    return winnerRules.any((rule) =>
        moves.contains(rule[0]) &&
        moves.contains(rule[1]) &&
        moves.contains(rule[2]));
  }

  WinnerType checkWinner() {
    if (checkPlayerWinner(movesPlayer1)) return WinnerType.player1;
    if (checkPlayerWinner(movesPlayer2)) return WinnerType.player2;
    return WinnerType.none;
  }

  int otomatikHamle() {
    var list =
        new List.generate(9, (i) => i + 1); //1 den 9 a kadar sayi olusturuyor
    //player1'in hamlelelerini olsuturdugu listeden siliyor
    list.removeWhere((element) => movesPlayer1.contains(element));
    //player2'in hamlelelerini olsuturdugu listeden siliyor
    list.removeWhere((element) => movesPlayer2.contains(element));

    var random = new Random();
    //liste uzunlugundan bir eksik ornegin 8 den basliyor cunku player1 hamlesini yapmis oluyor
    //daha sonra bu liste giderek kisaliyor
    //buradan aldigi random degeri de gamle model listte
    // midel id 'ye veriyor boylelikle model id 3 3. kutuya oynamis oluyor
    var index = random.nextInt(list.length - 1);
    return gameModelList.indexWhere((model) => model.id == list[index]);
  }
}
