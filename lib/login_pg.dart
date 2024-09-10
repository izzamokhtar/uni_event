import 'package:flutter/material.dart';
import 'package:uni_event/profile.dart';
import 'package:uni_event/settings_pg.dart';
import 'signup_pg.dart';
import 'home_pg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Sign In to continue',
                style: TextStyle(fontSize: 20),
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
                    MaterialPageRoute(builder: (context) => const EachPage()),
                  );
                },
                child: Text('Login'),
              ),
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
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

class EachPage extends StatefulWidget {
  const EachPage({super.key});
  // This widget is the root of your application.
  @override
  State<EachPage> createState() => _EachPageState();
}

class _EachPageState extends State<EachPage> {
  int currentIndex = 0;
  final screens = [
    Profile(),
    HomePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 235, 138, 190),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
