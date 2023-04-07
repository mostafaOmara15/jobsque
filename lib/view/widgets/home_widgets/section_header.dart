import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';

class SectionsHeader extends StatelessWidget {
  String title;
  bool viewAll;

  SectionsHeader({required this.title, required this.viewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: ColorManager.darkBlue, fontSize: 23.5, fontWeight: FontWeight.w500),
        ),
        viewAll == true
            ? TextButton(
                child: const Text(
                  "View all",
                  style: TextStyle(
                      color: ColorManager.primaryColor, fontSize: 19.5),
                ),
                onPressed: () {},
              )
            : const SizedBox()
      ],
    );
  }
}
