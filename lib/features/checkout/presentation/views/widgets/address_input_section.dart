import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:get/get.dart';

class AddressInputSection extends StatelessWidget {
   AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  final CheckoutController controller = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.orderEntity.shippingAddressEntity.name = value;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.orderEntity.shippingAddressEntity.email = value;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.orderEntity.shippingAddressEntity.address = value;
                },
                hintText: 'العنوان',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.orderEntity.shippingAddressEntity.city = value;
                },
                hintText: 'المدينه',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.orderEntity.shippingAddressEntity.floor = value;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  controller.orderEntity.shippingAddressEntity.phone = value;
                },
                hintText: 'رقم الهاتف',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}