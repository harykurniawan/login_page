import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';


class Awal extends StatefulWidget {
  @override
  _AwalState createState() => _AwalState();
}

class _AwalState extends State<Awal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column (
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue
                    ),
                    child: RaisedButton(
                      padding: const EdgeInsets.only(left: 57, right: 57, top: 10, bottom: 10),
                      child : Text('Login',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                      onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute (builder: (context){
                      return LoginPage();
                      }));
                    },
                    ),
                  )
                ),
                SizedBox(height:10,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue
                    ),
                    child: RaisedButton(
                      padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                      child: Text('Sign Up',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                      onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute (builder: (context){
                      return LoginPage();
                      }));
                    },
                    ),
                  )
                ),
                SizedBox(height: 20,)
              ],
              ),
            ),
        ],
      ),
    );
  }
}

class CachedNetworkImage {
}