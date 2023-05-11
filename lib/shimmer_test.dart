import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerAnimation extends StatelessWidget {
  const ShimmerAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Shimmer(
        duration: const Duration(seconds: 2),
        interval: const Duration(seconds: 2),
        child: Container(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
