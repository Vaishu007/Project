import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/loginBloc/login_bloc.dart';
import '../bloc/registrationBloc/registratioin_state.dart';
import '../bloc/registrationBloc/registration_bloc.dart';
import '../bloc/registrationBloc/registration_event.dart';
import 'login.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<registrationBloc,registrationState>(builder: (context, state) {
               if(state is regErrorState){
                 return Text(state.msg);
               }else{
                 return Container();
               }
                },),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black54)),
                      labelText: "Name",
                    ),
                    onChanged: (value) {
                      BlocProvider.of<registrationBloc>(context).add(
                          regTextChangedEvent(
                              value,
                              addressController.text,
                              emailController.text,
                              mobileController.text,
                              passwordController.text));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    maxLength: 10,
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black54)),
                      labelText: "Mobile No",
                    ),
                    onChanged: (value) {
                      BlocProvider.of<registrationBloc>(context).add(
                          regTextChangedEvent(
                              nameController.text,
                              addressController.text,
                              emailController.text,
                              mobileController.text,
                              passwordController.text));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black54)),
                      labelText: "Email",
                    ),
                    onChanged: (value) {
                      BlocProvider.of<registrationBloc>(context).add(
                          regTextChangedEvent(
                              nameController.text,
                              addressController.text,
                              emailController.text,
                              mobileController.text,
                              passwordController.text));

                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    maxLength: 8,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,

                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black54)),
                      labelText: "Password",
                    ),
                    onChanged: (value) {
                      BlocProvider.of<registrationBloc>(context).add(
                          regTextChangedEvent(
                              nameController.text,
                              addressController.text,
                              emailController.text,
                              mobileController.text,
                              passwordController.text));

                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<registrationBloc,registrationState>(builder: (context, state) {
                  return  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Select Gender :   ",
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                          child: SizedBox(
                            width: 15,
                            child: Radio(
                              value: "male",
                              groupValue: gender,
                              onChanged: (value) {
                                gender=value!;
                              },
                            ),
                          ),
                        ),
                        const Text("Male "),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                          child: SizedBox(
                            width: 15,
                            child: Radio(
                              value: "female",
                              groupValue: gender,
                              onChanged: (value) {
                                gender=value!;
                              },
                            ),
                          ),
                        ),
                        const Text("Female "),
                      ],
                    ),
                  );
                })
               ,
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 130,
                  child: TextField(
                    maxLines: 5,
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.start,
                    controller: addressController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.black54)),
                        labelText: "Address",
                        alignLabelWithHint: true),
                    onChanged: (value) {BlocProvider.of<registrationBloc>(context).add(
                        regTextChangedEvent(
                            nameController.text,
                            addressController.text,
                            emailController.text,
                            mobileController.text,
                            passwordController.text));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<registrationBloc,registrationState>(builder: (context, state) {
                  return SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width/2,
                      child: (state is regValidState)?ElevatedButton(
                          onPressed: () {
                            if(state is regValidState){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfull Login'),backgroundColor: Colors.green),);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider(create: (context) => loginBLoc() , child:  LoginPage(),)
                                  ));
                            }
                          },
                          child: const Text('Sign Up',style: TextStyle(fontSize: 20),)
                      ):
                      ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade400)),
                          onPressed: null,
                          child: const Text('Sign Up',style: TextStyle(fontSize: 20,),)
                      )
                  );

                },),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                          text: "Already have an Account? ",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          children: const [
                            TextSpan(
                                text: "Login",
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
                            builder: (context) =>
                            BlocProvider(create: (context) => loginBLoc() , child:  LoginPage(),)
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
