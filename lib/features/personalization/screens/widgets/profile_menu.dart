import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class profile_menu extends StatelessWidget {
  const profile_menu({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title;
  final String value;

  // final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: CSizes.spaceBtwItems / 1.5),
          child: Row(children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 4,
                child: Text(value,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis)),
            const Expanded(child: Icon(Iconsax.arrow_right_34, size: 18)),
          ]),
        ));
  }
}
