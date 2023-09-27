import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 372,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 22),
                child: Container(
                  width: 163,
                  height: 27,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 24),
                child: Container(
                  width: 40,
                  height: 18,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34, left: 24, right: 24),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  width: double.infinity,
                  height: 56,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  width: double.infinity,
                  height: 56,
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          color: Colors.grey.shade300,
          height: 80,
          width: double.infinity,
        ),
      )
    ]);
  }
}
