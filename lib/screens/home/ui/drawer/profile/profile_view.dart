import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kitaabe/components/color_extension.dart';
import 'package:kitaabe/components/user_data_row.dart';
import 'package:kitaabe/screens/home/ui/drawer/profile/edit_profile_view.dart';

import '../../../../../components/custom_button.dart';
import '../../../../../components/text_controllers.dart';
import '../../../../../services/storage/local_storage_helper.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final textController = TextControllers();

  File? image;

  void loadProfile() async {
    final user = await LocalStorageHelper.loadUserProfile();
    if (user != null) {
      setState(() {
        textController.firstNameController.text = user.firstName;
        textController.lastNameController.text = user.lastName;
        textController.userNameController.text = user.userName;
        textController.dobController.text = user.dob;
        textController.emailController.text = user.email;
        textController.phoneNumberController.text = user.phoneNumber;
        textController.addressController.text = user.address;
        textController.bioController.text = user.bio;
        image = File(user.imagePath);
      });
    }
  }

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: image == null
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : AppBar(
              elevation: 0,
              backgroundColor: TColor.primary,
            ),
      body: image == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EditProfileView(),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Add Profile',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                SizedBox(
                  height: 240,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: OverflowBox(
                          maxHeight: mediaQuery.height,
                          alignment: Alignment.topCenter,
                          child: Transform.scale(
                            scale: 3,
                            origin: Offset(0, mediaQuery.width * 0.85),
                            child: Container(
                              height: mediaQuery.height * 0.48,
                              width: mediaQuery.width,
                              decoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius: BorderRadius.circular(
                                  mediaQuery.width * 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 80,
                        top: 20,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: TColor.primaryLight,
                                boxShadow: [
                                  const BoxShadow(
                                    blurStyle: BlurStyle.outer,
                                    spreadRadius: 5,
                                    color: Colors.black87,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 100,
                                child: image != null
                                    ? CircleAvatar(
                                        radius: 95,
                                        backgroundImage: FileImage(image!),
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: 50,
                                        color: TColor.primary,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      textController.userNameController.text,
                      style: textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      textController.bioController.text,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      minHeight: 50,
                      minWidth: 200,
                      onPressed: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => const EditProfileView(),
                          ),
                        )
                            .then((updated) {
                          if (updated == true) {
                            loadProfile();
                            setState(() {});
                          }
                        });
                      },
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: TColor.primaryLight,
                        border: Border.all(
                          color: TColor.primary,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Edit Profile",
                          style: textTheme.labelMedium,
                        ),
                      ),
                    ),
                    Divider(
                      color: TColor.primary,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                        top: 10,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          UserDataRow(
                            icon: Icons.person_2_outlined,
                            text:
                                '${textController.firstNameController.text} ${textController.lastNameController.text}',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          UserDataRow(
                            icon: Icons.calendar_month_outlined,
                            text: textController.dobController.text,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          UserDataRow(
                            icon: Icons.email_outlined,
                            text: textController.emailController.text,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          UserDataRow(
                            icon: Icons.phone,
                            text: textController.phoneNumberController.text,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          UserDataRow(
                            icon: Icons.location_on_outlined,
                            text: textController.addressController.text,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
