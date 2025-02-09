import 'package:coconut_disease_detection/common/custom_shapes/containers/circular_containers.dart';
import 'package:coconut_disease_detection/common/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CPrimaryHeaderContainer extends StatelessWidget {
  const CPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CCurvedEdgeWidget(
      child: Container(
        color: CColors.primaryColor,
        padding: const EdgeInsets.all(0),

        //if ['size.isFinite': is not true.in stack] error occured =>
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                top: -200,
                right: -250,
                child: CCircularContainer(
                    backgroundColor:
                        CColors.textSecondaryColor.withOpacity(0.1)),
              ),
              Positioned(
                top: 50,
                right: -300,
                child: CCircularContainer(
                    backgroundColor:
                        CColors.textSecondaryColor.withOpacity(0.1)),
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
