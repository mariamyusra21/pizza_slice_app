import 'package:flutter/material.dart';
import 'package:pizza_slice_app/widgets/action_button.dart';
import 'package:pizza_slice_app/widgets/round_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameC.text = "Sumera Karim";
    emailC.text = "sumera.karimm@gmail.com";
    passwordC.text = "123456789";
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: media.width * 0.3,
                  height: media.width * 0.3,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                      "assets/images/116153-female-avatar-profile-picture-003 1.png"),
                ),
                SizedBox(
                  height: media.width * 0.005,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RoundTextField(
                    hintText: "Name",
                    controller: firstNameC,
                    icon: Icons.person_outline_rounded,
                    obsecure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RoundTextField(
                    hintText: "Email",
                    controller: emailC,
                    icon: Icons.mail_outline_rounded,
                    obsecure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RoundTextField(
                    hintText: "Password",
                    controller: passwordC,
                    icon: Icons.lock_outline_rounded,
                    obsecure: true,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Details",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order History",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.2,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: ActionButton(
                        text: "Edit Profile",
                        isPlain: false,
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: ActionButton(
                        text: "Log out",
                        isPlain: true,
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
