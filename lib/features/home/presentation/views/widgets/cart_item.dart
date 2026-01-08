  import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomNetworkImage(
                  imageUrl: '',
                  // imageUrl: carItemEntity.productEntity.imageUrl!,
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'بطيخ',
                          // carItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // context
                            //     .read<CartCubit>()
                            //     .deleteCarItem(carItemEntity);
                          },
                          child: SvgPicture.asset(
                            Assets.imagesTrash,
                          ),
                        )
                      ],
                    ),
                    Text(
                      '100 كم',
                      // '${carItemEntity.calculateTotalWeight()} كم',
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(
                          // cartItemEntity: carItemEntity,
                        ),
                        const Spacer(),
                        Text(
                          '120 جنيه',
                          // '${carItemEntity.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
  }
  }