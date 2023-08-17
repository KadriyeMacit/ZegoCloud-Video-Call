import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:video_call/model/call_model.dart';
import 'package:video_call/ui/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final Uuid uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    CallModel.userID = uuid.v4();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 220,
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Phone Number',
                    ),
                    onChanged: (value) => () {},
                  ),
                  const SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                      ),
                      onChanged: (value) => () {}),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
