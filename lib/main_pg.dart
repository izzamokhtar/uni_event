import 'package:flutter/material.dart';
import 'package:uni_event/login_pg.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/Main Page.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 500),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: Color.fromARGB(255, 223, 123, 156),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      fixedSize: const Size(350, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                      //Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Login Page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 213, 172, 186),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
