import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:video_call/model/call_model.dart';
import 'package:video_call/ui/call_page.dart';
import 'package:video_call/ui/login_page.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController usernameController = TextEditingController();
  final Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Call")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Text('Hello World'),
            ),
            ListTile(
              title: const Text('Sing out'),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              trailing: const Icon(Icons.exit_to_app_sharp),
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/cross-collab.png",
                    height: 220,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter username',
                  ),
                  onChanged: (value) => () {},
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    if (ZegoUIKitPrebuiltCallMiniOverlayMachine()
                        .isMinimizing) {
                      /// when the application is minimized (in a minimized state),
                      /// disable button clicks to prevent multiple PrebuiltCall components from being created.
                      return;
                    }
                    setState(() {
                      CallModel.username = usernameController.text;
                      CallModel.callID = uuid.v4();
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CallPage()));
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Join",
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
    );
  }
}
