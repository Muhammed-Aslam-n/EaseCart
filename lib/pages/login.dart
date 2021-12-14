import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import './home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String name = 'aslamshahma';
  String pas = '123456789';
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late SharedPreferences loginData;
  late bool newUser;

  //
  // Widget userInputSection(){
  //   return
  // }

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);
    print("Login Data in is  Logged Function is : $loginData");
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(107, 206, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
                const Spacer(), //Rowing as One Line
                Container(
                  padding: const EdgeInsets.only(bottom: 0, right: 32),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.7,
            padding: const EdgeInsets.only(top: 62),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 255),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Form(
                key: formKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: Validators.compose(
                          [
                            Validators.required("Username is Required"),
                            Validators.minLength(6, "Minimum 8 Characters"),
                          ],
                        ),
                        decoration: InputDecoration(
                          hintText: 'Username',
                          // border: InputBorder.none,
                          icon: const Icon(
                            Icons.person,
                            color: Color.fromRGBO(107, 206, 255, 1),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: password,
                        obscureText: true,
                        validator: Validators.compose([
                          Validators.required("Password is Required"),
                          Validators.minLength(8, "Password must be 8 Digits")
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          // border: InputBorder.none,
                          icon: const Icon(
                            Icons.vpn_key,
                            color: Color.fromRGBO(107, 206, 255, 1),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                    // Expanded(
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgott Password ?',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          var uname = username.text;
                          var pswd = password.text;
                          if (uname == name && pswd == pas) {
                            print('entered Successfull');
                            loginData.setBool('login', false);
                            print(
                                "Login Data before Logged in is : $loginData");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Invalid Username or Password',
                                  style: TextStyle(color: Colors.red),
                                ),
                                backgroundColor: Colors.white,
                              ),
                            );
                          }

                          if (formKey.currentState!.validate()) {
                            print("Success");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 30),
                          primary: const Color.fromRGBO(107, 206, 255, 1),
                          elevation: 0,
                        ),
                        child: Text(
                          'LOGIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Don't have an account ?",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(107, 206, 255, 1)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
