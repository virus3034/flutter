// import 'package:calculatesum/Rigistar_Screen.dart';
// import 'package:calculatesum/The_Course_Discription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  String _email = "";
  String _password = "";

  void SignIn() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password);

    FirebaseFirestore.instance
        .collection('users')
        .doc('Virus2023')
        .get()
        .then((value) => print(value.data()));
  }

  var emailControllar = TextEditingController();
  var passwordControllar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('LOGIN PAGE '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextFormField(
              controller: emailControllar,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                print(value);
              },
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Enter Your Email',
                prefixIcon: Icon(
                  Icons.email,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: passwordControllar,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onFieldSubmitted: (value) {
                print(value);
              },
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: () {
                  // set email,password
                  // call function login
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => TheCoursesDiscribtion()))  ;
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ?',
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))  ;
                  },
                  child: Text(
                    'Registier Now',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
