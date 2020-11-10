import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:http/http.dart' as http;

import 'postoffice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _text = TextEditingController();
  bool _validateAgain = false;
  bool _apiCall = false;
  String textValue = "";
  List<PostOffice> postOfficeList = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin Code Finder"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(height: 10),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              getTextInputField(),
              SizedBox(width: 10),
              getButton(),
              SizedBox(width: 10),
            ],
          ),
        ),
        SizedBox(height: 5),
        getProperWidget()
      ]),
    );
  }

  getTextInputField() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: TextFormField(
        controller: _text,
        decoration: new InputDecoration(
          labelText: "Enter Area for Pincode",
          fillColor: Colors.white,
          errorText: _validateAgain ? 'This should not be empty!' : null,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(15.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
        validator: (val) {
          if (val.length == 0) {
            return "This shouldn't be empty!";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.streetAddress,
      ),
    );
  }

  getButton() {
    return new RaisedButton(
      child: Text("Get Pincode"),
      onPressed: () {
        setState(() {
          if (_text.text.isNotEmpty) {
            _validateAgain = false;
            textValue = _text.text;
            _apiCall = true;
            _callAPIForPinCode();
          } else
            _validateAgain = true;
        });
      },
    );
  }

  getProperWidget() {
    if (_apiCall)
      return Expanded(child: Center(child: CircularProgressIndicator()));
    else if (postOfficeList.length == 0)
      return Expanded(child: Center(child:Text("No data found!")));
    else {
      // To bind ListView
      return Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: PostOfficeList(postOfficeList: this.postOfficeList));
    }
  }

  void _callAPIForPinCode() {
    var api = PostOfficeAPI();
    api.fetchPhotos(http.Client(), textValue).then(
        (value) => {
              setState(() {
                _apiCall = false;
                print('Value' + value.message);
                postOfficeList = value.postOffice;
              })
            }, onError: (error) {
      setState(() {
        _apiCall = false;
        print('Value $error');
        postOfficeList = new List();
      });
    });
  }
}

class PostOfficeList extends StatelessWidget {
  final List<PostOffice> postOfficeList;

  PostOfficeList({Key key, this.postOfficeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postOfficeList.length,
      itemBuilder: (context, index) {
        var postOffice = postOfficeList[index];
        return Card(
          child: ListTile(
              title: Text(
            '${postOffice.name} - ${postOffice.district} - ${postOffice.pincode}',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.brown,
                fontWeight: FontWeight.bold),
          )),
        ); //
      },
    );
  }
}
