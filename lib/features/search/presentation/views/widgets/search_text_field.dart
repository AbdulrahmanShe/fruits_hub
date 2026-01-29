import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/voice_search_button.dart';
import 'package:fruits_hub/features/search/presentation/views/search_view.dart';
import 'package:svg_flutter/svg.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/filter_bottom_sheet.dart';

// ignore: must_be_immutable
class SearchTextField extends StatefulWidget {
   SearchTextField({super.key,this.readOnly});
  bool? readOnly = false;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController searchTextEditingController;
  final controller = Get.find<ProductsController>();

  @override
  void initState() {
    super.initState();
    searchTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    searchTextEditingController.dispose(); // ✅ ينحذف تلقائي
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          controller: searchTextEditingController,
          onChanged: controller.search,
          readOnly: widget.readOnly ?? false,
          onSubmitted: controller.addRecentSearch,
          onTap: () {
          if (widget.readOnly == true) {
              Get.toNamed(SearchView.routeName);
            }
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset(Assets.imagesSearchIcon),
              ),
            ),
            /// 🎤 + فلترة
            suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// 🎤 زر الصوت
                   VoiceSearchButton(
                    onResult: (text) {
                      searchTextEditingController.text = text;        // 👈 يظهر فورًا
                      controller.search(text);
                    },
                  ),
                const SizedBox(width: 8),
        
                  /// 🔍 زر الفلترة (كما طلبت)
                GestureDetector(
  onTap: () {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => const FilterBottomSheet(),
    );
  },
  child: SizedBox(
    width: 20,
    child: Center(
      child: SvgPicture.asset(Assets.imagesFilter),
    ),
  ),
),

                const SizedBox(width: 8),
              ],
            ),
            
            hintStyle: TextStyles.regular13.copyWith(
              color: const Color(0xFF949D9E),
            ),
            hintText: 'ابحث صوتيًا أو كتابة...',
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