import 'package:flutter/material.dart';

class LoaderScreenWidget extends StatelessWidget {
  const LoaderScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
