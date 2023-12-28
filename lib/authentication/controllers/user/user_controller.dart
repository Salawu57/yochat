import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yo_chat/authentication/models/user_model.dart';
import 'package:yo_chat/authentication/screens/login/login.dart';
import 'package:yo_chat/authentication/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/data/repositories/user/user_repository.dart';
import 'package:yo_chat/utils/Network/network_manager.dart';
import 'package:yo_chat/utils/constants/images_strings.dart';
import 'package:yo_chat/utils/constants/sizes.dart';
import 'package:yo_chat/utils/popups/full_screen_loader.dart';
import 'package:yo_chat/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final user = UserModel(
            id: userCredentials.user!.uid,
            fullName: userCredentials.user!.displayName ?? '',
            username: UserModel.generateUserName(
                userCredentials.user!.displayName ?? ''),
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackbar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information, you can try again later');
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(YoAppSize.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: YoAppSize.lg),
              child: Text('Delete'))),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingdialog(
          'Processing', YoAppImages.docerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Re-Authenticate before deleteing

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingdialog(
          'Processing..', YoAppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmalAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  selectPhoto(BuildContext context) async {
    try {
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Take a Photo'),
                onTap: () {
                  // Handle the action
                  Navigator.pop(context); // Close the bottom sheet
                  uploadUserProfilePicture(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  // Handle the action
                  Navigator.pop(context); // Close the bottom sheet
                   uploadUserProfilePicture(ImageSource.gallery);
                },
              ),
              // Add more options or content as needed
            ],
          );
        },
      );
    } catch (e) {
      Loaders.errorSnackbar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }

  uploadUserProfilePicture(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
          source: source,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512
          );

      if (image != null) {

        imageUploading.value = true;
        
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;

        user.refresh();

        Loaders.successSnackbar(
            title: 'Congratulations!',
            message: 'Your profile picture has been updated!');
      }
    } catch (e) {
      Loaders.errorSnackbar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }


  // void showBottomSheetModal(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           ListTile(
  //             leading: const Icon(Icons.camera),
  //             title: const Text('Take a Photo'),
  //             onTap: () {
  //               // Handle the action
  //               Navigator.pop(context); // Close the bottom sheet
  //               uploadUserProfilePicture(ImageSource.camera);
  //             },
  //           ),
  //           ListTile(
  //             leading: const Icon(Icons.photo),
  //             title: const Text('Choose from Gallery'),
  //             onTap: () {
  //               // Handle the action
  //               Navigator.pop(context);
  //              uploadUserProfilePicture(ImageSource.gallery); // Close the bottom sheet
  //             },
  //           ),
  //           // Add more options or content as needed
  //         ],
  //       );
  //     },
  //   );
  // }

  // Future _pickImage(ImageSource camera) async {
  //   final pickFile =
  //       await ImagePicker().pickImage(source: camera, imageQuality: 70);
  //   if (pickFile == null) {
  //     return;
  //   }

  //   var file = await ImageCropper().cropImage(
  //       sourcePath: pickFile.path,
  //       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));

  //   if (file == null) {
  //     return;
  //   }

  //   file = (await compressImage(file.path, 35)) as CroppedFile?;

  //   XFile xFile = XFile(file!.path);

  //   imageUploading.value = true;

  //   final imageUrl =
  //       await userRepository.uploadImage('Users/Images/Profile/', xFile);

  //   Map<String, dynamic> json = {'ProfilePicture': imageUrl};

  //   await userRepository.updateSingleField(json);

  //   user.value.profilePicture = imageUrl;

  //   user.refresh();

  //   Loaders.successSnackbar(
  //       title: 'Congratulations!',
  //       message: 'Your profile picture has been updated!');
  // }

  // Future<XFile> compressImage(String path, int quality) async {
  //   final newPath = p.join((await getTemporaryDirectory()).path,
  //       '${DateTime.now()}.${p.extension(path)}');

  //   final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
  //       quality: quality);

  //   return result!;
  // }
}
