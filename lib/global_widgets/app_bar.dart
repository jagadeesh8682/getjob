import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isWeb;

  const CustomAppBar({
    super.key,
    this.isWeb = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          const Text(
            'GetJob',
            style: TextStyle(
              color: Color(0xFF486DF5),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          if (isWeb) ...[
            const SizedBox(width: 32),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Search Jobs',
                style: TextStyle(
                  color: Color(0xFF486DF5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Companies',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Post Jobs',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          GetX<HomeController>(
            builder: (controller) => GestureDetector(
              onTap: () => controller.navigateToProfile(),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.amber,
                    child: Text(
                      'JW',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isWeb)
                    Text(
                      'Hello, ${controller.userName.value}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
