import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginPageState();
}

class _LoginPageState extends State<Register> {
  String title = "Registration";

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(
      //       context
      //     );
      //     //Navigator.pop(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      //   },
      //   child: const Icon(Icons.add_a_photo_outlined),
      // ),
      body: Center(
        // Wrap the Column with Center widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: usernameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'example@gmail.com',
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: rePasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Re-Enter your password',
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Checkbox(value: true, onChanged: (val) {}),
                ),
                const Text("I Agree")
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                onPressed: () async {
                  print("Username : ${usernameController.text}");
                  print("Password : ${passwordController.text}");

                  final dio = Dio();

                  var response = await dio.post("https://example.com/api/registration/UserLogin", data: {
                    "ReqHeader": {
                      "DeviceID": "your_device_id",
                      "SessionId": "your_session_id",
                      "Lang": "en",
                      "pushToken": "your_push_token",
                      "version": "your_version",
                      "platform": "your_platform",
                      "DeviceDet": {
                        "imei": "your_imei",
                        "deviceOSVersion": "your_device_os_version",
                        "deviceModel": "your_device_model",
                        "deviceManufacturer": "your_device_manufacturer",
                        "deviceOS": "your_device_os",
                        "ipAddress": "your_ip_address"
                      }
                    },
                    "userName": "your_username",
                    "password": "your_password"
                  });

                  print(response.data);
                },
                child: const Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
