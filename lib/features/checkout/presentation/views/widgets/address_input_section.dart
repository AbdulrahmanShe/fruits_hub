import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/presentation/controller/checkout_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';

class AddressInputSection extends StatefulWidget{
   const AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection> with AutomaticKeepAliveClientMixin{
  final CheckoutController controller = Get.find<CheckoutController>();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();
  final FocusNode _floorFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _addressFocus.dispose();
    _cityFocus.dispose();
    _floorFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: widget.valueListenable,
        builder: (context, value, child) => Form(
          key: widget.formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  controller.orderEntity.shippingAddressEntity.name = value;
                },
                hintText: S.of(context).fullName,
                textInputType: TextInputType.text,
                focusNode: _nameFocus,
                nextFocusNode: _emailFocus,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  controller.orderEntity.shippingAddressEntity.email = value;
                },
                hintText: S.of(context).email,
                textInputType: TextInputType.text,
                focusNode: _emailFocus,
                nextFocusNode: _addressFocus,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  controller.orderEntity.shippingAddressEntity.address = value;
                },
                hintText: S.of(context).address,
                textInputType: TextInputType.text,
                focusNode: _addressFocus,
                nextFocusNode: _cityFocus,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  controller.orderEntity.shippingAddressEntity.city = value;
                },
                hintText: S.of(context).city,
                textInputType: TextInputType.text,
                focusNode: _cityFocus,
                nextFocusNode: _floorFocus,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  controller.orderEntity.shippingAddressEntity.floor = value;
                },
                hintText: S.of(context).floorAndApartmentNumber,
                textInputType: TextInputType.text,
                focusNode: _floorFocus,
                nextFocusNode: _phoneFocus,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  controller.orderEntity.shippingAddressEntity.phone = value;
                },
                hintText: S.of(context).phoneNumber,
                textInputType: TextInputType.number,
                focusNode: _phoneFocus,
                textInputAction: TextInputAction.done,
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

  @override
  bool get wantKeepAlive => true;
}
