import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();

  double finalResult = 0.0;
  String formattedText ="";
  String shape="";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Body Mass Index Text"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            padding: EdgeInsets.all(5.0),
            children: <Widget>[
              new Image.asset(
                "images/bmi.png",
                height: 100.0,
                width: 150.0,
              ),
              new Container(
                  margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    decoration: new InputDecoration(
                        hintText: 'Enter your age',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.deepPurple))),
                  )),
              new Container(
                  margin: EdgeInsets.only(right: 5.0, left: 5.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                    decoration: new InputDecoration(
                        hintText: 'Enter your height in cm',
                        prefixIcon: Icon(
                          Icons.android,
                          color: Colors.deepPurple,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.deepPurple))),
                  )),
              new Container(
                  margin: EdgeInsets.only(right: 5.0, left: 5.0, top: 5.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    decoration: new InputDecoration(
                        hintText: 'Your weight in kg',
                        prefixIcon: Icon(
                          Icons.announcement,
                          color: Colors.deepPurple,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.deepPurple))),
                  )),
              new Container(
                height: 50.0,
                margin:
                    const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                child: new RaisedButton(
                    onPressed: _showResult,
                    color: Colors.deepPurple,
                    child: new Text(
                      "Calculate",
                      style:
                          new TextStyle(color: Colors.white70, fontSize: 20.0),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0))),
              ),
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new Text("$formattedText",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black45,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400)),
                      new Text(
                        "$shape",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                          color: shape.toUpperCase()=='OVER WEIGHT' || shape.toUpperCase()=='UNDER WEIGHT'? Colors.red : Colors.green,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400))
            ],
          ),
        ));
  }

  String _showResult() {
    setState(() {
    double _height = double.parse(_heightController.text);
    double _weight = double.parse(_weightController.text);
    finalResult = _weight / ((_height / 100) * (_height / 100));
    formattedText="Your BMI :"+" "+ finalResult.toStringAsFixed(1);
    shape=shapeDeterminator(finalResult);
        return formattedText;
        });
      }
    
      String shapeDeterminator(double finalResult) {
        if(finalResult>18.5 && finalResult<24.999){
          return shape="Normal";
        }
        else if(finalResult>25){
             return shape="Over Weight";
        }
        else{
          return shape="Under Weight";
        }
      }
}
