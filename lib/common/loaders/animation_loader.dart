import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//to display lottie animation as indicator with optional text & action buttons
class CAnimationLoaderWidget extends StatelessWidget {
  //default constructor for this widget
  const CAnimationLoaderWidget({
    super.key,
    required this.animation,
    required this.text,
    this.showAction = false,
    this.actionText,
    this.actionOnPressed,
  });

  final String animation;
  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? actionOnPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: CSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: actionOnPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: CColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: CColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
