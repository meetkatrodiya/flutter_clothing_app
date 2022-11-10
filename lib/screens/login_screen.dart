import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_clothing_app_11/screens/home_screen.dart';
import 'package:flutter_clothing_app_11/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clothing_app_11/pages/main/ui/index.dart';
import 'package:flutter_clothing_app_11/Services/AuthServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clothing_app_11/pages/seller/UploadProduct/addproduct.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  int userType = 1;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    // Future checkAuthedUser() async{
    //   if(await FirebaseAuth.instance.currentUser?.uid != null)
    //   {
    //     print("sign in");
    //     await FirebaseFirestore.instance.collection("Buyer").doc(await FirebaseAuth.instance.currentUser?.uid).get().then((DocumentSnapshot documentSnapshot){
    //       if(documentSnapshot.exists)
    //       {
    //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Main()));
    //       }
    //     });
    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()) );
    //   }
    //   else{
    //     return;
    //   }
    // }
    // checkAuthedUser();

    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            checkUser(context);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/logo.jpg",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,

                Row(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(value: 1, groupValue: userType, onChanged: (value){
                      setState(() {
                        userType = 1;
                      });
                    }),
                    Text("Buyer"),

                    Radio(value: 2, groupValue: userType, onChanged: (value){
                      setState(() {
                        userType = 2;
                      });
                    }),
                    Text("Seller")
                  ],
                ),
                    SizedBox(height: 35),
                    loginButton,

                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkUser(context) async{
    String email = emailController.text;
    String pass = passwordController.text;

    var user = await AuthUser().authUser(email, pass, userType);

    if(user == null)
    {
      Fluttertoast.showToast(msg: "Invalid Email or Password");
      passwordController.text = "";
      print("Invalid user");
    }
    else{
      if(userType == 1)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
        }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) =>AddProduct()));
    }
    }
  }

        //   switch (error.code) {
        //     case "invalid-email":
        //       errorMessage = "Your email address appears to be malformed.";
        //
        //       break;
        //     case "wrong-password":
        //       errorMessage = "Your password is wrong.";
        //       break;
        //     case "user-not-found":
        //       errorMessage = "User with this email doesn't exist.";
        //       break;
        //     case "user-disabled":
        //       errorMessage = "User with this email has been disabled.";
        //       break;
        //     case "too-many-requests":
        //       errorMessage = "Too many requests";
        //       break;
        //     case "operation-not-allowed":
        //       errorMessage = "Signing in with Email and Password is not enabled.";
        //       break;
        //     default:
        //       errorMessage = "An undefined Error happened.";
        //   }
        //   Fluttertoast.showToast(msg: errorMessage!);
        //   print(error.code);
      }
