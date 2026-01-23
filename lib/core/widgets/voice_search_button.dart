import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/core/controller/voice_search_controller.dart';

class VoiceSearchButton extends StatelessWidget {
  const VoiceSearchButton({super.key, required this.onResult});
  final ValueChanged<String> onResult;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VoiceSearchController>();
    controller.onTextResult = onResult;

    return Obx(() {
      return GestureDetector(
                    onTap: controller.toggleListening,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.isListening.value
                            ? AppColors.lightPrimaryColor
                            : Colors.transparent,
                        boxShadow: controller.isListening.value
                ? [
                    BoxShadow(
                      color: AppColors.lightPrimaryColor,
                      blurRadius: 20,
                      spreadRadius: 6,
                    ),
                  ]
                : [],
                      ),
                      child: Icon(
                        controller.isListening.value
                            ? Icons.mic
                            : Icons.mic_none,
                        color: controller.isListening.value
                            ? AppColors.primaryColor
                            : Colors.grey,
                      ),
                    ),
                  );
    });
  }
}
