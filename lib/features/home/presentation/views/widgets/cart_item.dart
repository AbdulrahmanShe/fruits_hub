  import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/domain/entites/car_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/controller/cart_controller.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
   CartItem({super.key, required this.carItemEntity});
  final CartItemEntity carItemEntity;

final CartController controller = Get.find<CartController>();

   
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 73,
                  height: 92,
                  decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                  child: CustomNetworkImage(
                    imageUrl: carItemEntity.productEntity.imageUrl!,
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
                            carItemEntity.productEntity.name,
                            style: TextStyles.bold13,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              controller.deleteCarItem(carItemEntity);
                            },
                            child: SvgPicture.asset(
                              Assets.imagesTrash,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${carItemEntity.calculateTotalWeight()} كم',
                        textAlign: TextAlign.right,
                        style: TextStyles.regular13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          CartItemActionButtons(
                            cartItemEntity: carItemEntity,
                          ),
                          const Spacer(),
                          Text(
                            '${carItemEntity.calculateTotalPrice()} شيكل ',
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
    );
  }
  }