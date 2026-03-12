import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/voice_search_button.dart';
import 'package:fruits_hub/features/search/presentation/views/search_view.dart';
import 'package:svg_flutter/svg.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/search/presentation/views/widgets/filter_bottom_sheet.dart';

// ignore: must_be_immutable
class SearchTextField extends StatefulWidget {
   SearchTextField({super.key, this.readOnly, this.returnView});
  bool? readOnly = false;
  final ProductsListView? returnView;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController searchTextEditingController;
  final controller = Get.find<ProductsController>();
  late final Worker _searchWorker;

  @override
  void initState() {
    super.initState();
    searchTextEditingController = TextEditingController();
    _searchWorker = ever<String>(controller.searchQuery, (value) {
      if (searchTextEditingController.text != value) {
        searchTextEditingController.text = value;
      }
    });
  }

  @override
  void dispose() {
    _searchWorker.dispose();
    searchTextEditingController.dispose(); // ✅ ينحذف تلقائي
    super.dispose();
  }

  Future<void> _openSearchAndRun(String action) async {
    await Get.toNamed(SearchView.routeName, arguments: {'action': action});
    controller.clearSearch();
    controller.setView(widget.returnView ?? ProductsListView.featured);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.08),
            blurRadius: 9,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
          controller: searchTextEditingController,
          onChanged: controller.search,
          readOnly: widget.readOnly ?? false,
          onSubmitted: controller.addRecentSearch,
          onTap: () async {
            if (widget.readOnly == true) {
              await Get.toNamed(SearchView.routeName);
              controller.clearSearch();
              controller.setView(widget.returnView ?? ProductsListView.featured);
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
                   if (widget.readOnly == true)
                     GestureDetector(
                       onTap: () => _openSearchAndRun('voice'),
                       child: Icon(
                         Icons.mic_none,
                         color: colors.onSurface.withValues(alpha: 0.5),
                       ),
                     )
                   else
                     VoiceSearchButton(
                      onResult: (text) {
                        searchTextEditingController.text = text;       // 👈 يظهر فورًا
                        controller.search(text);
                      },
                    ),
                const SizedBox(width: 8),
        
                  /// 🔍 زر الفلترة (كما طلبت)
                GestureDetector(
  onTap: () {
    if (widget.readOnly == true) {
      _openSearchAndRun('filter');
      return;
    }
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
              color: colors.onSurface.withValues(alpha: 0.5),
            ),
            hintText: S.of(context).searchByVoiceOrTyping,
            filled: true,
            fillColor: colors.surface,
            border: buildBorder(theme),
            enabledBorder: buildBorder(theme),
            focusedBorder: buildBorder(theme),
          ),
        ),
      );
  }

  OutlineInputBorder buildBorder(ThemeData theme) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: theme.dividerColor,
      ),
    );
  }
}
