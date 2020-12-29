import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int pixelsPerChar = 485;
  int a = 0;
  double _fontSize = 100;
  var fontFamily = 'OpensSans';
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;

  var color = Colors.white;

  var book_text = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
  // var book_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  // var bookTextSplitted = book_text.split(' ');

  void _changePixelPerChar(){
    if (_fontSize == 18) {
      setState(() {
        pixelsPerChar = 295;
      });
    } else if (_fontSize == 23) {
      setState(() {
        pixelsPerChar = 485;
      });
    } else if (_fontSize == 28) {
      setState(() {
        pixelsPerChar = 721;
      });
    } else if (_fontSize == 33) {
      setState(() {
        pixelsPerChar = 946;
      });
    } else if (_fontSize == 38) {
      setState(() {
        pixelsPerChar = 1398;
      });
    } else if (_fontSize == 43) {
      setState(() {
        pixelsPerChar = 1799;
      });
    } else if (_fontSize == 48) {
      setState(() {
        pixelsPerChar = 2272;
      });
    } else if (_fontSize == 53) {
      setState(() {
        pixelsPerChar = 2885;
      });
    }
  }


  void _incrementFontSize() {
    setState(() {
      _fontSize = _fontSize + 5;
      _changePixelPerChar();
      print('font size is: $_fontSize');
    });
  }

  void _decrementFontSize() {
    setState(() {
      _fontSize = _fontSize - 5;
      _changePixelPerChar();
      print('font size is: $_fontSize');
    });
  }

  void _showPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(child: const Text('+'), value: '1'),
        PopupMenuItem<String>(child: const Text('-'), value: '2'),
        PopupMenuItem<String>(child: const Text('Roboto'), value: '3'),
        PopupMenuItem<String>(child: const Text('Montserrat'), value: '4'),
        PopupMenuItem<String>(child: const Text('Blue'), value: '5'),
        PopupMenuItem<String>(child: const Text('White'), value: '6'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1" && _fontSize < 53) {
        _incrementFontSize();
      } else if (itemSelected == "2" && _fontSize > 18) {
        _decrementFontSize();
      } else if (itemSelected == "3") {
        setState(() {
          fontFamily = 'Roboto';
        });
      } else if (itemSelected == "4") {
        setState(() {
          fontFamily = 'Montserrat';
        });
      } else if (itemSelected == "5") {
        setState(() {
          color = Colors.blue;
        });
      } else if (itemSelected == "6") {
        setState(() {
          color = Colors.white;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var s = _width * _height;
    var bAsDouble = s / pixelsPerChar;
    int b = bAsDouble.toInt();

    print( book_text.length);
    print('width is $_width');
    print('height is $_height');
    print('the b is $b');
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(
                Icons.language,
              ),
              onPressed: () {
                _showPopupMenu();
              },
          )
        ],
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            if (dragEndDetails.primaryVelocity > 0){
              setState(() {
                a = a - 10;
                // b = b - 10;
              });
            } else if (dragEndDetails.primaryVelocity < 0) {
              setState(() {
                a = a + a;
                // b = b + 10;
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: _height,
            width: _width,
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            child: Text(
                book_text.substring(a, b),
                style: TextStyle(
                    fontSize: _fontSize,
                    fontFamily: '$fontFamily'
                )
            ),
          ),
        )
      ),
    );
  }
}
//.substring(a, b)