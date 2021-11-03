import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat bubble example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'chat bubble example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomCard(
                msg: '111111111',
                additionalInfo: '09:41',
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomCard extends StatelessWidget {
  final String msg;
  final String additionalInfo;

  CustomCard({required this.msg, required this.additionalInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Card(
        color: Colors.lightGreen,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    //real message
                    TextSpan(
                      text: msg + "       ",
                    ),

                    //fake additionalInfo as placeholder
                    TextSpan(
                      text: additionalInfo,
                      style: TextStyle(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //real additionalInfo
            Positioned(
              child: Row(
                children: [
                  SvgPicture.asset('lib/assets/read_indicator.svg'),
                  SizedBox(width: 5),
                  Text(
                    additionalInfo,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(109, 120, 133, 1),
                    ),
                  ),
                ],
              ),
              right: 8.0,
              bottom: 4.0,
            )
          ],
        ),
      ),
    );
  }
}
