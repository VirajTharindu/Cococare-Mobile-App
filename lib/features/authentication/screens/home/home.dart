import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:coconut_disease_detection/common/custom_shapes/containers/circular_containers.dart';
import 'package:coconut_disease_detection/common/custom_shapes/containers/primary_header_container.dart';
import 'package:coconut_disease_detection/common/custom_shapes/curved_edges/cureved_edges.dart';
import 'package:coconut_disease_detection/common/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:coconut_disease_detection/common/notification/notification.dart';
import 'package:coconut_disease_detection/features/authentication/screens/home/home_appbar.dart';
import 'package:coconut_disease_detection/utils/constants/colors.dart';
import 'package:coconut_disease_detection/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CPrimaryHeaderContainer(
                child: Column(
              children: const [
                CHomeAppBar(),
              ],
            )),
            const Text('hi')
          ],
        ),
      ),
    );
  }
}
