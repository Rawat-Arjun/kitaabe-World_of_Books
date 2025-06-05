import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/color_extension.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/custom_text_field.dart';
import '../../../../common/text_controllers.dart';
import '../../../../util/model/user_model.dart';
import '../../../../util/storage/local_storage_helper.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final textController = TextControllers();

  File? image;
  final ImagePicker imagePicker = ImagePicker();
  bool haveImage = true;

  Future<void> photoFromCamera() async {
    final XFile? photo = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (photo != null) {
      setState(() {
        image = File(photo.path);
      });
    }
  }

  Future<void> photoFromGallery() async {
    final XFile? photo = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (photo != null) {
      setState(() {
        image = File(photo.path);
      });
    }
  }

  void saveProfile() async {
    String imagePath = '';
    if (image != null) {
      imagePath = await LocalStorageHelper.saveImageToLocal(image!);
    }

    final user = UserModel(
      firstName: textController.firstNameController.text,
      lastName: textController.lastNameController.text,
      userName: textController.userNameController.text,
      dob: textController.dobController.text,
      email: textController.emailController.text,
      phoneNumber: textController.phoneNumberController.text,
      gender: int.tryParse(textController.genderController.text) ?? 0,
      address: textController.addressController.text,
      bio: textController.bioController.text,
      imagePath: imagePath,
    );

    await LocalStorageHelper.saveUserProfile(user);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Profile saved locally',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 280,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: OverflowBox(
                      maxHeight: mediaQuery.height,
                      alignment: Alignment.topCenter,
                      child: Transform.scale(
                        scale: 2,
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
                    left: 100,
                    top: 20,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: TColor.primaryLight,
                          ),
                          child: CircleAvatar(
                            radius: 80,
                            child: image != null
                                ? CircleAvatar(
                                    radius: 75,
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
                  Positioned(
                    left: 105,
                    top: 200,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(16),
                            child: SizedBox(
                              height: 150,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.camera_alt,
                                      color: TColor.primary,
                                    ),
                                    title: Text('Take Photo'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      photoFromCamera();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.photo_library,
                                      color: TColor.primary,
                                    ),
                                    title: Text('Choose from Gallery'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      photoFromGallery();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_camera_outlined,
                              color: TColor.primary,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Edit Photo',
                              style: textTheme.labelMedium?.copyWith(
                                color: TColor.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60, right: 12, left: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          text: 'First Name',
                          controller: textController.firstNameController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomTextField(
                          text: 'Last Name',
                          controller: textController.lastNameController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    text: 'User Name',
                    controller: textController.userNameController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    text: 'DD/MM/YY',
                    controller: textController.dobController,
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    text: 'Email',
                    controller: textController.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    text: 'Phone Number',
                    controller: textController.phoneNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    text: 'Address',
                    controller: textController.addressController,
                    keyboardType: TextInputType.text,
                    maxlines: 2,
                    maxLength: 150,
                  ),
                  CustomTextField(
                    text: 'Bio',
                    controller: textController.bioController,
                    keyboardType: TextInputType.text,
                    maxlines: 3,
                    maxLength: 250,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    minHeight: 50,
                    onPressed: saveProfile,
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: TColor.primary,
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
