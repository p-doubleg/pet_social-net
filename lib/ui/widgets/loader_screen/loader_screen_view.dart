import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/loader_screen/loader_screen_model.dart';

class LoaderScreenWidget extends StatelessWidget {
  const LoaderScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = context.watch<LoaderScreenModel>();
    // model.init(context);
    return const Center(child: CircularProgressIndicator());
  }
}
