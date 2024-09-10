import 'package:flutter/material.dart';
import 'login_pg.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 97, 97),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Image.asset('images/logo.png'),
              SizedBox(height: 10),
              /*Text(
                'NAME',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
              ),*/
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color.fromARGB(255, 239, 193, 193),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color.fromARGB(255, 239, 193, 193),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color.fromARGB(255, 239, 193, 193),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                //obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Confirm your password',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color.fromARGB(255, 239, 193, 193),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                //obscureText: true,
              ),
              SizedBox(height: 40),
              const Row(
                children: [
                  SizedBox(width: 50),
                  //Icon(Icons.check_box_outline_blank),
                  SizedBox(
                    width: 10,
                  ),
                  /*Text(
                    textAlign: TextAlign.left,
                    'I agree to the terms & conditions',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),*/
                ],
              ),
              //SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  fixedSize: const Size(350, 40),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  //Navigator.pushNamed(context, '/main');
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
