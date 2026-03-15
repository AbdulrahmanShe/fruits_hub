import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../core/controller/products_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceSearchController extends GetxController {
  final stt.SpeechToText speech = stt.SpeechToText();
  final isListening = false.obs;
  double lastSoundTime = 0;
  Timer? silenceTimer;
  final currentLocale = 'ar'.obs;
  ValueChanged<String>? onTextResult;

  final ProductsController productsController =
      Get.find<ProductsController>();

  void toggleLanguage() {
  currentLocale.value =
      currentLocale.value == 'ar' ? 'en_US' : 'ar';
  }

  Future<void> toggleListening() async {
    if (isListening.value) {
      stopListening();
    } else {
      await startListening();
    }
  }

  Future<void> startListening() async {
    /// 🛑 اطلب الإذن أولًا
    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      showSnackBar(
        S.current.alert,
        S.current.microphoneAccessRequired,
      );
      return;
    }

    final available = await speech.initialize();
    if (!available) return;

    isListening.value = true;

    speech.listen(
       listenOptions: stt.SpeechListenOptions(
        partialResults: true,
        listenMode: stt.ListenMode.dictation,
      ), // 🔥 مهم جدًا بالنسبة لتوقف التحدف عند الصمت
      localeId: currentLocale.value,
      onResult: (result) {
        onTextResult?.call(result.recognizedWords);
        productsController.setVoiceResult(
          result.recognizedWords,
        );
      
       // 🔄 إعادة تشغيل عدّاد الصمت
      silenceTimer?.cancel();
      silenceTimer = Timer(const Duration(seconds: 2), () {
        stopListening();
      });
      }
    );
  }

  void stopListening() {
  silenceTimer?.cancel();
  speech.stop();
  isListening.value = false;

  if (productsController.searchQuery.value.isNotEmpty) {
    productsController.addRecentSearch(
      productsController.searchQuery.value,
    );
  }
}
}
