import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruits_hub/features/search/presentation/controller/voice_search_controller.dart';

class VoiceSearchButton extends StatelessWidget {
  const VoiceSearchButton({super.key, required this.onResult});
  final ValueChanged<String> onResult;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VoiceSearchController>();
    controller.onTextResult = onResult;
    final colors = Theme.of(context).colorScheme;

    return Obx(() {
      return GestureDetector(
                    onTap: controller.toggleListening,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.isListening.value
                            ? colors.primary.withValues(alpha: 0.2)
                            : Colors.transparent,
                        boxShadow: controller.isListening.value
                ? [
                    BoxShadow(
                      color: colors.primary.withValues(alpha: 0.5),
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
                            ? colors.primary
                            : colors.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  );
    });
  }
}
