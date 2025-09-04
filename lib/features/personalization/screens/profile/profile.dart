import 'package:ecom/Common/widgets/appbar/appbar.dart';
import 'package:ecom/Common/widgets/images/t_circular_Image.dart';
import 'package:ecom/Common/widgets/texts/section_heading.dart';
import 'package:ecom/features/personalization/controllers/user_controller.dart';
import 'package:ecom/features/personalization/screens/change_name/change_name.dart';
import 'package:ecom/features/personalization/screens/profile/profile_menu.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),
      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details

              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info

              TSectionHeading(title: 'Profile Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(title: 'UserName', value: 'Maaz Javed', onPressed: () {}),

              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading  Personal Info

              TProfileMenu(title: 'User ID', value: controller.user.value.id,icon: Iconsax.copy, onPressed: (){}),
              TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: (){}),
              TProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: (){}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: (){}),
              TProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: (){}),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),


              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text('Close Account', style: TextStyle(color: Colors.red)),
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










