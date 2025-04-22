import 'package:flutter/material.dart';
import 'package:ocr/screens/Register.dart';
import 'package:ocr/screens/login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(size: 80, color: Colors.blueAccent, Icons.camera_alt_rounded),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // TextButton(onPressed: () {
                //   print("Hello world");
                // }, child: const Text("Text Button"),),
                const SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: ElevatedButton(
                      onPressed: () {
                        //Navigate to Login Page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: const Text("Login")),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                    },
                    child: const Text("Registration"),
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
