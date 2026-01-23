import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/voice_search_button.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/search_view.dart';
import 'package:svg_flutter/svg.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';

// ignore: must_be_immutable
class SearchTextField extends StatefulWidget {
   SearchTextField({super.key,this.readOnly});
  bool? readOnly = false;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController textEditingController;
  final controller = Get.find<ProductsController>();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose(); // ✅ ينحذف تلقائي
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
          controller: textEditingController,
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
                      textEditingController.text = text;        // 👈 يظهر فورًا
                      controller.search(text);
                    },
                  ),
                const SizedBox(width: 8),
        
                  /// 🔍 زر الفلترة (كما طلبت)
                SizedBox(
                  width: 20,
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.imagesFilter,
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