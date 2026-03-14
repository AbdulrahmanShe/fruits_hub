import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_history_entity.dart';
import 'package:fruits_hub/features/home/presentation/controller/orders_controller.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});

  static const routeName = '/ordersView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).myOrders),
      body: Obx(() {
        if (controller.isLoading.value && controller.orders.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty &&
            controller.orders.isEmpty) {
          return _OrdersMessage(
            title: S.of(context).ordersLoadFailedTitle,
            subtitle: S.of(context).somethingWentWrongTryAgain,
            actionLabel: S.of(context).reload,
            onAction: controller.refreshOrders,
          );
        }

        if (controller.orders.isEmpty) {
          return _OrdersMessage(
            title: S.of(context).ordersEmptyTitle,
            subtitle: S.of(context).ordersEmptySubtitle,
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshOrders,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _OrderCard(order: controller.orders[index]);
            },
          ),
        );
      }),
    );
  }
}

class _OrdersMessage extends StatelessWidget {
  const _OrdersMessage({
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              color: colors.primary,
              size: 48,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyles.bold13.copyWith(color: colors.onSurface),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyles.regular13.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatefulWidget {
  const _OrderCard({required this.order});

  final OrderHistoryEntity order;

  @override
  State<_OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<_OrderCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final colors = Theme.of(context).colorScheme;
    final total = order.totalWithShipping;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => setState(() => expanded = !expanded),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).orderNumberLabel(
                            order.displayOrderNumber,
                          ),
                          style: TextStyles.bold13.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          S.of(context).orderSummaryLabel(
                            S.of(context).ilsAmount(_formatAmount(total)),
                            order.totalQuantity.toString(),
                          ),
                          style: TextStyles.regular13.copyWith(
                            color: colors.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.receipt_long_outlined,
                    color: colors.onSurface.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ),
          ),
          if (expanded) _OrderInvoice(order: order),
        ],
      ),
    );
  }
}

class _OrderInvoice extends StatelessWidget {
  const _OrderInvoice({required this.order});

  final OrderHistoryEntity order;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final subtotal = order.subtotal;
    final shipping = order.shippingCost;
    final total = order.totalWithShipping;
    final paymentMethod = _mapPaymentMethod(context, order.paymentMethod);
    final dateLabel = _formatDate(context, order);

    final qrPayload = jsonEncode({
      'invoiceType': 'FruitHubOrderInvoice',
      'orderNumber': order.orderId,
      'createdAt': order.createdAtRaw ?? '',
      'paymentMethod': paymentMethod,
      'subtotal': subtotal,
      'shipping': shipping,
      'total': total,
      'items':
          order.items
              .map(
                (item) => {
                  'title': item.name,
                  'quantity': item.quantity,
                  'unitPrice': item.price,
                  'lineTotal': item.price * item.quantity,
                },
              )
              .toList(),
    });

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).orderInvoice,
            style: TextStyles.bold13.copyWith(color: colors.onSurface),
          ),
          const SizedBox(height: 10),
          ...order.items.map((item) {
            final itemTotal = item.price * item.quantity;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${item.name} x${item.quantity}',
                      style: TextStyles.regular13.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                  Text(
                    S.of(context).ilsAmount(_formatAmount(itemTotal)),
                    style: TextStyles.semiBold13.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            );
          }),
          const Divider(height: 20),
          _InvoiceSummaryRow(
            title: S.of(context).subtotal,
            value: S.of(context).ilsAmount(_formatAmount(subtotal)),
          ),
          const SizedBox(height: 6),
          _InvoiceSummaryRow(
            title: S.of(context).shipping,
            value: S.of(context).ilsAmount(_formatAmount(shipping)),
          ),
          const SizedBox(height: 6),
          _InvoiceSummaryRow(
            title: S.of(context).finalTotal,
            value: S.of(context).ilsAmount(_formatAmount(total)),
            isTotal: true,
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).paymentMethodLabel(paymentMethod),
            style: TextStyles.regular13.copyWith(
              color: colors.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).orderDateLabel(dateLabel),
            style: TextStyles.regular13.copyWith(
              color: colors.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colors.outline.withValues(alpha: 0.4)),
                  ),
                  child: QrImageView(
                    data: qrPayload,
                    version: QrVersions.auto,
                    size: 120,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : colors.surface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  S.of(context).invoiceQr,
                  style: TextStyles.regular13.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InvoiceSummaryRow extends StatelessWidget {
  const _InvoiceSummaryRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  final String title;
  final String value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(
          title,
          style: (isTotal ? TextStyles.bold13 : TextStyles.regular13).copyWith(
            color: colors.onSurface,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: (isTotal ? TextStyles.bold13 : TextStyles.semiBold13).copyWith(
            color: isTotal ? colors.primary : colors.onSurface,
          ),
        ),
      ],
    );
  }
}

String _formatAmount(num value) {
  if (value % 1 == 0) return value.toStringAsFixed(0);
  return value.toStringAsFixed(2);
}

String _formatDate(BuildContext context, OrderHistoryEntity order) {
  final date = order.createdAt;
  if (date != null) {
    return MaterialLocalizations.of(context).formatFullDate(date);
  }
  return order.createdAtRaw ?? '';
}

String _mapPaymentMethod(BuildContext context, String method) {
  final value = method.toLowerCase();
  if (value == 'cash') return S.of(context).cashOnDelivery;
  return method;
}
