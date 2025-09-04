import 'package:ecom/features/personalization/screens/settings/settings.dart';
import 'package:ecom/features/shop/screens/home/home.dart';
import 'package:ecom/features/shop/screens/store/store.dart';
import 'package:ecom/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(), permanent: true);
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        backgroundColor: darkMode ? Colors.black : Colors.white,
        indicatorColor: darkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      )),
      body: Obx(() {
        return controller.screens[controller.selectedIndex.value] ?? Container(color: Colors.white);
      }),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),    // Replace with actual screen for Home
    const StoreScreen(),   // Replace with actual screen for Store
    const FavouriteScreen(), // Replace with actual screen for Wishlist
    const SettingsScreen(),  // Replace with actual screen for Profile
  ];
}



