import 'package:coconut_disease_detection/common/custom_shapes/curved_edges/cureved_edges.dart';
import 'package:flutter/material.dart';

class CCurvedEdgeWidget extends StatelessWidget {
  const CCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CCustomCurvedEdges(), child: child);
  }
}
