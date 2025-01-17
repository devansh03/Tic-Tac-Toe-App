import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  Delay(){
    Future.delayed(const Duration(milliseconds: 3000),(){
      setState(() {
        this.resetGame();
      });
    });
  }

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      // if any user Win update the message state
      setState(() {
        this.message = '${this.gameState[0]} wins';
        this.Delay();
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} wins';
        this.Delay();
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins';
        this.Delay();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
        this.Delay();
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins';
        this.Delay();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
        this.Delay();
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
        this.Delay();
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
        this.Delay();
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'Game Draw';
        this.Delay();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("Tic Tac Toe", style: TextStyle(
          color: Colors.white,
          fontSize: 28.0,
          fontWeight: FontWeight.w800
        ),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body:Column(
            children: <Widget>[
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(isCross ? "images/cross.png" : "images/circle.png",height: 50.0,width: 50.0,),
                  SizedBox(width: 5.0,),
                  Text("'s Chance", style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500),),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.fromLTRB(20.0,5.0,20.0,0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: this.gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: MaterialButton(
                      onPressed: () {
                        this.playGame(i);
                      },
                      child: Image(
                        image: this.getImage(this.gameState[i]),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0,0,20,10),
                child: Text(
                  this.message.toUpperCase(),
                  style: TextStyle(
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.deepPurpleAccent,
                minWidth: 300.0,
                height: 50.0,
                child: Text(
                  "Restart Game",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () {
                  this.resetGame();
                },
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Text(
                  "Developed by Devansh Baldwa",
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          )
    );
  }
}
