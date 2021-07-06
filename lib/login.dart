import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  signIn(String username, String password) async{
    var url = Uri.parse ("http://localhost/login/slogin.php");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"username" : username, "password":password};
    var jsonResponse;
    var res = await http.post(url, body: body);

    if(res.statusCode == 200){
      jsonResponse = json.decode(res.body);

      print("Response status : ${res.statusCode}");

      print("Response status : ${res.body}");

      if(jsonResponse != null){
        setState(() {
          _isLoading = false;
        });

        sharedPreferences.setString("token", jsonResponse['token']);

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context)=> HomePage()), 
          (Route<dynamic> route) => false);
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(8.0), 
                      ),
                    child: Container(
                      height:200, 
                      width: MediaQuery.of(context).size.width,
                      decoration: 
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextField(
                              controller: _usernameController,
                              decoration : InputDecoration(hintText: "Username"),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextField(
                              controller: _passwordController ,
                              obscureText: true,
                              decoration : InputDecoration(hintText: "Password"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      onPressed: 
                        _usernameController.text == "" || _passwordController.text == "" 
                          ? null
                          :(){
                            setState(() {
                              _isLoading = true;
                        });
                        signIn(_usernameController.text, _passwordController.text);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    child: Text ('Forgot password'),
                    onPressed: () {},
                  ),
                ],
              ),
        ),
      ),
    );
  }
}