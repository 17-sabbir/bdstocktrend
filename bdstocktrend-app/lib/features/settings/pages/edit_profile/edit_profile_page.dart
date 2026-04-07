import 'dart:io';

import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/auth.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile_params.dart';
import 'package:bd_stock_trend/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> with MainBoxMixin {
  final _conName = TextEditingController();
  final _conMobile = TextEditingController();
  final _conPhotoUrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize with current data if available
    _conName.text = getData(MainBoxKeys.username) ?? "";
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        // For now we literally just put the path, real implementation would upload to storage first
        // or convert to base64 if backend supports it.
        // Assuming backend handles plain URL, we might need a separate upload endpoint
        // but for this task we just simulate picking.
        _conPhotoUrl.text = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text("Edit Profile"),
          centerTitle: true,
        ),
      ),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              context.showSnackBar("Profile updated successfully");
            },
            failure: (message) {
              context.dismiss();
              context.showSnackBar(message);
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimens.space24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Palette.primary.withOpacity(0.1),
                        backgroundImage:
                            _imageFile != null ? FileImage(_imageFile!) : null,
                        child: _imageFile == null
                            ? const Icon(Icons.person,
                                size: 50, color: Palette.primary)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(Dimens.space4),
                          decoration: const BoxDecoration(
                            color: Palette.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SpacerV(value: 24),
                TextF(
                  controller: _conName,
                  key: const Key("name"),
                  hint: "Name",
                  hintText: "Enter your name",
                  prefixIcon: const Icon(Icons.person),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SpacerV(value: 24),
                TextF(
                  controller: _conMobile,
                  key: const Key("mobile"),
                  hint: "Mobile Number",
                  hintText: "Enter your mobile number",
                  prefixIcon: const Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
                ),
                const SpacerV(value: 24),
                Button(
                  title: "Update Profile",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<AuthCubit>().updateProfile(
                            UpdateProfileParams(
                              name: _conName.text,
                              mobile: _conMobile.text,
                              photoUrl: _conPhotoUrl.text,
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
