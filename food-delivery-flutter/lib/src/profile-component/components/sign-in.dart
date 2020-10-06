import 'package:flutter/material.dart';
import 'package:food_delivery/src/profile-component/components/sign-up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    'Forgetten Password?',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Your email or user name',
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: showPassword ? Icon(Icons.visibility): Icon(Icons.visibility_off),
                          )
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                      obscureText: !showPassword,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Center(
                child: Text('Sign In',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    )),
                SizedBox(width: 10,),
                GestureDetector(
                  child: Text('Sign Up',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
