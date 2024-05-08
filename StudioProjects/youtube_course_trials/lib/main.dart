//Cupertino is used when you want an ios app
//m3 el container lazm a3ml el alignment bta3o
import 'package:flutter/cupertino.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('ios app'),  //el middle bdl el title
        ),
        child: Container(
            alignment: Alignment.center,
          color: CupertinoColors.activeGreen,
          child: Text('child of ios app', style: TextStyle(
              fontSize: 30, color: CupertinoColors.black
    ))
        )
      )
    );
  }

}