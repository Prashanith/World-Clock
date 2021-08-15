import 'package:flutter/painting.dart';
import 'worldtime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey=GlobalKey<FormState>();
  String time;
  final cityController = TextEditingController();
  final continentController=TextEditingController();
  bool pressed=false;
  static const myStyle =TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 16,
  );

  void validateInput(String cty,String cont) async {
    WorldTime instance= WorldTime(city:cty,continent: cont);
    await instance.getTime();
    setState(() {
      time=instance.time;
      pressed=true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
            onPressed: (){
              setState(() {
                cityController.clear();
                continentController.clear();
                pressed=false;
              });
              },
          ),
        ],
        title: Text('World-Time'),
        backgroundColor: Colors.red[600],

      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Enter the Continent';
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.public),
                            labelText: 'Continent',
                          ),
                          controller:continentController,
                        ),
                        SizedBox(height: 15.0,),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Enter the City';
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_city),
                            labelText: 'City',
                          ),
                          controller:cityController,
                        ),
                        SizedBox(height: 20.0),
                        FlatButton(
                          color: Colors.red[600],
                          onPressed: (){
                            validateInput(cityController.text,continentController.text);
                          },
                         child: Text('Get Time',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white
                          ),),
                        ),
                      ]
                  )
              ),
              SizedBox(height: 50.0,),
              pressed?Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.location_on,size: 10.0,color: Colors.pink[300],),
                        Text("${cityController.text}",style:TextStyle(
                            fontSize: 15.0,
                            color:Colors.pink[300],
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        )),
                      ],
                    ),
                    Text("$time",style:TextStyle(
                        fontSize: 20.0,
                        color:Colors.pink[700],
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal
                    )),
                  ],
                ):SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
