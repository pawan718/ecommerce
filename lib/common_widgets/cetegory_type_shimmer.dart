import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CetegoryTypeShimmer extends StatelessWidget {
  const CetegoryTypeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.90,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 25, top: 13),
              child: Container(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
