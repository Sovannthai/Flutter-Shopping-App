import 'package:flutter/material.dart';

class SignupUser extends StatefulWidget{
  const SignupUser ({super.key});

  @override
  State<SignupUser> createState() => _SignupUserState();
}
class _SignupUserState extends State<SignupUser>{
  bool ispassword = true;
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  void toggle_password() {
    setState(() {
      ispassword = !ispassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => GestureDetector,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blue,
          elevation: 0.0,
          centerTitle: true,
          title: const Text('Signup User',
          style: TextStyle(
            color: Colors.black
            ),
          ),
        ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Image.asset(
              'assets/images/image.png',
              width: 100,
              height: 100,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: TextField(
              focusNode: _usernameFocusNode,
              controller: controllerUsername,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                prefixIcon: Icon(Icons.person_2_rounded),
                fillColor: Color.fromARGB(210, 222, 219, 219),
                filled: true,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: TextField(
              focusNode: _passwordFocusNode,
              obscureText: ispassword,
              controller: controllerPassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: const Icon(Icons.key_off_rounded),
                fillColor: const Color.fromARGB(210, 222, 219, 219),
                filled: true,
                suffixIcon: GestureDetector(
                  onTap: () => toggle_password(),
                  child: Icon(
                    ispassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: TextField(
              focusNode: _phoneFocusNode,
              controller: controllerPhone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
                prefixIcon: Icon(Icons.phone_android_rounded),
                fillColor: Color.fromARGB(210, 222, 219, 219),
                filled: true,
              ),
            ),
          ),
          Container(
            height: 65,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 10, 154, 225),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                String strName = controllerUsername.text;
                String strPass = controllerPassword.text;
                String strPhone = controllerPhone.text;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$strName \n $strPass \n $strPhone")));
              },
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Have account already?'),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Login Account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 154, 225),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}