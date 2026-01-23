import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  static const routeName = '/search';

  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
