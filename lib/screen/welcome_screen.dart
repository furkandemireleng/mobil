import 'package:flutter/material.dart';
import 'package:furkandemirel_proje/screen/game_screen.dart';
import 'package:furkandemirel_proje/controller/constants.dart';
import 'package:furkandemirel_proje/controller/game_controller.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Lutfen sembolunuzu secin...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Semboller :',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.white,
                child: Text(
                  '❌',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    PLAYER1_SYMBOL = 'X';
                    PLAYER2_SYMBOL = 'O';
                  });
                },
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.white,
                child: Text(
                  '⭕️',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    PLAYER1_SYMBOL = 'O';
                    PLAYER2_SYMBOL = 'X';
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            color: Colors.white,
            child: Text(
              'Play 🎮 ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              PLAYER1_SYMBOL != null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GameScreen(),
                      ),
                    )
                  : Text('bos');
            },
          ),
        ],
      ),
    );
  }
}
