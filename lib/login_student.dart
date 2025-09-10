import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_attendance_app/scan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class StudentLoginSchema {
  final String regno;
  final String password;
  final bool isStudent;

  StudentLoginSchema(this.regno, this.password, this.isStudent);

  Map<String, dynamic> toJson() => {
        'username': regno,
        'password': password,
        'isStudent': isStudent,
      };
}

class LoginStudentPage extends StatefulWidget {
  const LoginStudentPage({Key? key}) : super(key: key);

  @override
  _LoginStudentPageState createState() => _LoginStudentPageState();
}

class _LoginStudentPageState extends State<LoginStudentPage> {
  final passwordController = TextEditingController();
  final regnoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 1],
                  colors: [Color(0xff661EFF), Color(0xffFFA3FD)])),
        ),
        title: const Text(
          "",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              SvgPicture.asset(
                "assets/student.svg",
                height: 200,
                width: 181,
              ),
              const SizedBox(height: 20),
              const Center(
                  child: Text(
                'LOGIN',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              )),
              const SizedBox(height: 20),
              Container(
                height: 64,
                width: 325,
                decoration: BoxDecoration(
                  color: const Color(0xffEFF0F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: regnoController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.mail_outline),
                      labelText: 'Registration no.'),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 64,
                width: 295,
                decoration: BoxDecoration(
                  color: const Color(0xffFCFCFC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.purple, width: 0.7),
                ),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.remove_red_eye_outlined),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.clear)),
                ),
              ),
              const SizedBox(height: 20),
              buildTextButton("Login"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextButton(String text) {
    return TextButton(
      onPressed: () async {
        final regno = regnoController.text.trim();
        final s1 = StudentLoginSchema(regno, passwordController.text, true);
        final data = s1.toJson();

        final body1 = json.encode(data);
        print(body1);

        final client = http.Client();
        try {
          final uriResponse = await client.post(
            Uri.parse('SERVER TOKEN ENDPOINT'),
            headers: {"Content-Type": "application/json;charset=UTF-8"},
            body: body1,
          );
          print('sent');
          final Map<String, dynamic> response = json.decode(uriResponse.body);
          if (response.containsKey("access_token")) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScanPage(regno)));
          } else {
            Fluttertoast.showToast(
                msg: response['detail'] ?? "Login failed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                fontSize: 12.0);
          }
        } catch (e) {
          print(e);
          Fluttertoast.showToast(
              msg: "Error connecting to server",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              fontSize: 12.0);
        } finally {
          client.close();
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xff5F2EEA),
        padding: const EdgeInsets.all(20),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Color(0xffF7F7FC),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
