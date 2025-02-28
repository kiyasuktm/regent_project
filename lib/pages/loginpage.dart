import 'package:flutter/material.dart';
import 'package:flutter_pro_test/pages/bottom_nave_bar.dart';
import 'package:flutter_pro_test/reuseble/bitext.dart';
import 'package:flutter_pro_test/reuseble/midtext.dart';
import 'package:flutter_pro_test/reuseble/smalltext.dart';
import 'package:flutter_pro_test/reuseble/textf.dart';
import 'package:gap/gap.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool ischeck = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.text_fields,
                      size: 35,
                    ),
                    Gap(5),
                    Midtext(
                        text: 'slothul', clr: Color.fromARGB(255, 26, 93, 209))
                  ],
                ),
                const Gap(15),
                const Bitext(text: 'Sign To Your Account', clr: Colors.black),
                const Gap(10),
                const Midtext(
                    text: 'Unleash your inner sloth 4.0 right now',
                    clr: Colors.black),
                const Gap(20),
                const Textf(labtext: 'Email', priicon: Icons.email),
                const Gap(30),
                const TextField(
                  
                  obscureText: true,
                  decoration: InputDecoration(
                    suffix: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.remove_red_eye_outlined,color: Colors.black,),
                    ),
                      contentPadding: EdgeInsets.only(left: 45),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.password),
                      ),
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(80),
                          ),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        ),
                      )),
                ),
                const Gap(20),
                Row(
                  children: [
                    Checkbox(
                        value: ischeck,
                        onChanged: (bool? newValue) {
                          setState(() {
                            ischeck = newValue!;
                          });
                        }),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Midtext(
                          text: 'Remember For 30 Days', clr: Colors.black),
                    ),
                  ],
                ),
                const Gap(37),
                Container(
                  height: size.height * 0.06,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Midtext(text: 'Sign in', clr: Colors.white),
                      Gap(5),
                      Icon(
                        Icons.exit_to_app_outlined,
                        color: Colors.white,
                      )
                    ],
                  )),
                ),
                const Gap(15),
                const Midtext(
                    text: "Dont't have an account?  Sign Up",
                    clr: Colors.black),
                const Midtext(text: "Forgot Password", clr: Colors.deepPurple),
                const Gap(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Smalltext(text: 'OR', clr: Colors.black),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ))
                  ],
                ),
                const Gap(30),
                InkWell(
                  onTap: () {
                    Get.to(const BottomNaveBar());
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.white),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        Gap(10),
                        Midtext(text: 'Sign in With Google', clr: Colors.black)
                      ],
                    ),
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
