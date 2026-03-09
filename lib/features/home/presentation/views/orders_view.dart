import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = '/ordersView';

  @override
  Widget build(BuildContext context) {
    final orders = <_OrderItem>[
      _OrderItem(
        orderNumber: '#1234567',
        total: S.of(context).ilsAmount('250'),
        quantity: 3,
        createdAt: S.of(context).date2March2026,
        paymentMethod: 'Visa **** 4887',
        shipping: 20,
        items: [
          _InvoiceLine(title: S.of(context).redApple, quantity: 2, unitPrice: 40),
          _InvoiceLine(title: S.of(context).banana, quantity: 1, unitPrice: 30),
          _InvoiceLine(title: S.of(context).pineapple, quantity: 1, unitPrice: 120),
        ],
      ),
      _OrderItem(
        orderNumber: '#1234568',
        total: S.of(context).ilsAmount('180'),
        quantity: 2,
        createdAt: S.of(context).date1March2026,
        paymentMethod: 'MasterCard **** 1234',
        shipping: 15,
        items: [
          _InvoiceLine(title: S.of(context).grapes, quantity: 2, unitPrice: 55),
          _InvoiceLine(title: S.of(context).orangeFruit, quantity: 2, unitPrice: 20),
        ],
      ),
      _OrderItem(
        orderNumber: '#1234569',
        total: S.of(context).ilsAmount('95'),
        quantity: 2,
        createdAt: S.of(context).date27Feb2026,
        paymentMethod: S.of(context).cashOnDelivery,
        shipping: 10,
        items: [
          _InvoiceLine(title: S.of(context).strawberry, quantity: 1, unitPrice: 45),
          _InvoiceLine(title: S.of(context).kiwi, quantity: 1, unitPrice: 40),
        ],
      ),
    ];

    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).myOrders),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _OrderCard(order: orders[index]);
        },
      ),
    );
  }
}

class _OrderCard extends StatefulWidget {
  const _OrderCard({required this.order});

  final _OrderItem order;

  @override
  State<_OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<_OrderCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE3E6E5)),
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
                          S.of(context).orderNumberLabel(order.orderNumber),
                          style: TextStyles.bold13,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          S.of(context).orderSummaryLabel(
                            order.total,
                            order.quantity.toString(),
                          ),
                          style: TextStyles.regular13.copyWith(
                            color: const Color(0xFF6D7573),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.receipt_long_outlined,
                    color: Color(0xFF6D7573),
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

  final _OrderItem order;

  @override
  Widget build(BuildContext context) {
    final subtotal = order.items.fold<int>(
      0,
      (sum, item) => sum + (item.unitPrice * item.quantity),
    );
    final total = subtotal + order.shipping;
    final qrPayload = jsonEncode({
      'invoiceType': 'FruitHubOrderInvoice',
      'orderNumber': order.orderNumber,
      'createdAt': order.createdAt,
      'paymentMethod': order.paymentMethod,
      'subtotal': subtotal,
      'shipping': order.shipping,
      'total': total,
      'items':
          order.items
              .map(
                (item) => {
                  'title': item.title,
                  'quantity': item.quantity,
                  'unitPrice': item.unitPrice,
                  'lineTotal': item.unitPrice * item.quantity,
                },
              )
              .toList(),
    });

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE6E9E9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).orderInvoice, style: TextStyles.bold13),
          const SizedBox(height: 10),
          ...order.items.map((item) {
            final itemTotal = item.unitPrice * item.quantity;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${item.title} x${item.quantity}',
                      style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF56605D),
                      ),
                    ),
                  ),
                  Text(
                    S.of(context).ilsAmount(itemTotal.toString()),
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            );
          }),
          const Divider(height: 20),
          _InvoiceSummaryRow(
            title: S.of(context).subtotal,
            value: S.of(context).ilsAmount(subtotal.toString()),
          ),
          const SizedBox(height: 6),
          _InvoiceSummaryRow(
            title: S.of(context).shipping,
            value: S.of(context).ilsAmount(order.shipping.toString()),
          ),
          const SizedBox(height: 6),
          _InvoiceSummaryRow(
            title: S.of(context).finalTotal,
            value: S.of(context).ilsAmount(total.toString()),
            isTotal: true,
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).paymentMethodLabel(order.paymentMethod),
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF6D7573),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).orderDateLabel(order.createdAt),
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF6D7573),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE6E9E9)),
                  ),
                  child: QrImageView(
                    data: qrPayload,
                    version: QrVersions.auto,
                    size: 120,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  S.of(context).invoiceQr,
                  style: TextStyles.regular13.copyWith(
                    color: const Color(0xFF6D7573),
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
    return Row(
      children: [
        Text(
          title,
          style: (isTotal ? TextStyles.bold13 : TextStyles.regular13).copyWith(
            color: const Color(0xFF434D4A),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: (isTotal ? TextStyles.bold13 : TextStyles.semiBold13).copyWith(
            color: isTotal ? AppColors.primaryColor : const Color(0xFF434D4A),
          ),
        ),
      ],
    );
  }
}

class _OrderItem {
  const _OrderItem({
    required this.orderNumber,
    required this.total,
    required this.quantity,
    required this.items,
    required this.paymentMethod,
    required this.createdAt,
    required this.shipping,
  });

  final String orderNumber;
  final String total;
  final int quantity;
  final List<_InvoiceLine> items;
  final String paymentMethod;
  final String createdAt;
  final int shipping;
}

class _InvoiceLine {
  const _InvoiceLine({
    required this.title,
    required this.quantity,
    required this.unitPrice,
  });

  final String title;
  final int quantity;
  final int unitPrice;
}
