import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/search_view.dart';
import 'package:svg_flutter/svg.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
   SearchTextField({super.key,this.readOnly});
  bool? readOnly = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        onChanged: controller.search,
    //     onChanged: (value) {
    //     controller.searchQuery.value = value;
    //     controller.search(value);
    //  },
     readOnly: readOnly ?? false,
        onSubmitted: controller.addRecentSearch,
      onTap: () {
        Get.toNamed(SearchView.routeName);
      },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.imagesSearchIcon),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesFilter,
              ),
            ),
          ),
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: 'ابحث عن...',
          filled: true,
          fillColor: Colors.grey.shade100, //Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}