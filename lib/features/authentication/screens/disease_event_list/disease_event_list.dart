import 'package:coconut_disease_detection/common/appbar/appbar.dart';
import 'package:flutter/material.dart';

class Disease_Event_List extends StatelessWidget {
  const Disease_Event_List({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        title: Text('Disease Event List'),
      ),
    );
  }
}
