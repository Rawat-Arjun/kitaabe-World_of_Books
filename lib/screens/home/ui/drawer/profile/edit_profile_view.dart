import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../components/color_extension.dart';
import '../../../../../components/custom_button.dart';
import '../../../../../components/custom_text_field.dart';
import '../../../../../components/text_controllers.dart';
import '../../../../../services/model/user_model.dart';
import '../../../../../services/storage/local_storage_helper.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final textController = TextControllers();
  final _formKey = GlobalKey<FormState>();

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
      address: textController.addressController.text,
      bio: textController.bioController.text,
      imagePath: imagePath,
    );

    await LocalStorageHelper.saveUserProfile(user);

    textController.firstNameController.clear();
    textController.lastNameController.clear();
    textController.userNameController.clear();
    textController.dobController.clear();
    textController.emailController.clear();
    textController.phoneNumberController.clear();
    textController.addressController.clear();
    textController.bioController.clear();

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

      Navigator.pop(context, true);
    }
  }

  String? validateDate(String value) {
    final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

    if (!regex.hasMatch(value)) {
      return '* Enter date as DD/MM/YYYY';
    }

    // Split the string into parts
    final parts = value.split('/');
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    try {
      // Try to construct a valid DateTime object
      final date = DateTime(year!, month!, day!);

      // Check if components match (e.g., 31/02/2024 becomes 02/Mar/2024)
      if (date.day != day || date.month != month || date.year != year) {
        return '* Invalid calendar date';
      }
    } catch (e) {
      return '* Invalid date';
    }

    return null; // Valid date
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
            Navigator.pop(context, true);
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
              child: Form(
                key: _formKey,
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
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return '* First name is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: CustomTextField(
                            text: 'Last Name',
                            controller: textController.lastNameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return '* Last name is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      text: 'User Name',
                      controller: textController.userNameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '* Username is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      text: 'DD/MM/YYYY',
                      controller: textController.dobController,
                      keyboardType: TextInputType.datetime,
                      validator: (value) => validateDate(value!),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      text: 'Email Address',
                      controller: textController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Email Address is required';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return '* Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      text: 'Phone Number',
                      controller: textController.phoneNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Phone number is required';
                        }
                        if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                          return '* Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      text: 'Address',
                      controller: textController.addressController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '* Address is required';
                        }
                        return null;
                      },
                      maxlines: 2,
                      maxLength: 150,
                    ),
                    CustomTextField(
                      text: 'Bio',
                      controller: textController.bioController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '* Bio is required';
                        }
                        return null;
                      },
                      maxlines: 3,
                      maxLength: 250,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      minHeight: 50,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          saveProfile();
                        }
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
