import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quize.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz quiz=new Quiz();

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Home(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> icons=[];

  void _increasing(bool answer){
    setState(() {
      if(quiz.nextQuestion()){
      if(answer==quiz.getAnswers()){
        icons.add(
            Icon(
              Icons.check,
              color: Colors.green,
            )
        );
      }else{
        icons.add(
            Icon(
              Icons.close,
              color: Colors.red,
            )
        );
      }
      }else{
        Alert(context: context,title: 'Finish',desc: 'You reached the end' ,buttons: [
          DialogButton(
            child: Text('Ok'),
            onPressed: (){
              setState(() {
                quiz.setIndex(0);
                icons=[];
              });
              Navigator.pop(context);
            },
          )
        ],
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  quiz.getGuestions(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                ),
               ),
               ),
            ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.yellow,
                child: Text(
                    'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                ),
                onPressed: (){
                  _increasing(true);
                },
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  _increasing(false);
                },
              ),
            )
        ),
        Row(
          children: icons,
        )
      ]
    );
  }
}

