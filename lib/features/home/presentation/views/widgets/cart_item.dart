import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/generated/l10n.dart';
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Obx((){
      return IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 73,
                  height: 92,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.dividerColor.withValues(alpha: 0.7),
                    ),
                  ),
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
                            style: TextStyles.bold13.copyWith(
                              color: colors.onSurface,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              controller.deleteCarItem(carItemEntity);
                            },
                            child: SvgPicture.asset(
                              Assets.imagesTrash,
                              colorFilter: ColorFilter.mode(
                                colors.onSurface.withValues(alpha: 0.6),
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${carItemEntity.calculateTotalWeight()} ${S.of(context).kmUnit}',
                        textAlign: TextAlign.right,
                        style: TextStyles.regular13.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      Row(
                        children: [
                          CartItemActionButtons(
                            cartItemEntity: carItemEntity,
                          ),
                          const Spacer(),
                          Text(
                            '${carItemEntity.calculateTotalPrice()} ${S.of(context).currencyShekel}',
                            style: TextStyles.bold16
                                .copyWith(color: colors.primary),
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
