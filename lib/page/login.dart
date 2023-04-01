import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smit_project/page/registration.dart';


import '../Bottom/bottom.dart';
import '../bloc/loginBloc/login_bloc.dart';
import '../bloc/loginBloc/login_event.dart';
import '../bloc/loginBloc/login_state.dart';
import '../bloc/registrationBloc/registration_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController contactContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  var passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              color: Colors.red.shade50,
              shadowColor: Colors.red[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      maxLength: 10,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.name,
                      controller: contactContoller,
                      decoration: InputDecoration(
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        labelText: "Mobile No",
                      ),
                      onChanged: (value) {
                        BlocProvider.of<loginBLoc>(context).add(
                            logTextchangedEvent(
                                contactContoller.text, passwordContoller.text));
                      },
                      inputFormatters: [],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      maxLength: 8,
                      obscureText: passwordVisible,
                      obscuringCharacter: "*",
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordContoller,
                      decoration: InputDecoration(
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade900),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5)),
                        contentPadding: const EdgeInsets.all(10),
                        labelText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: passwordVisible
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<loginBLoc>(context).add(
                            logTextchangedEvent(
                                contactContoller.text, passwordContoller.text));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<loginBLoc, loginState>(
                      builder: (context, state) {
                        return SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            child: (state is logValidState)
                                ? ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavPage(),
                                          ));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.grey.shade400)),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black38),
                                    ),
                                  ));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: RichText(
                          text: TextSpan(
                              text: "Don't Have an Account? ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              children: const [
                                TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13))
                              ]),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => registrationBloc(),
                                        child: RegistrationPage(),
                                      )));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
