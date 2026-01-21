import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorit_view_body.dart';

class FavoritView extends StatelessWidget {
  const FavoritView({super.key});
  static const routeName = '/favoritView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavoritViewBody()
      );
  }
}
