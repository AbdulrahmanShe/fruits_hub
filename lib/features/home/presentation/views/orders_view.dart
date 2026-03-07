import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = '/ordersView';

  @override
  Widget build(BuildContext context) {
    final orders = <_OrderItem>[
      _OrderItem(
        orderNumber: '#1234567',
        total: '250 جنيه',
        quantity: 3,
        createdAt: '2 مارس 2026',
        paymentMethod: 'Visa **** 4887',
        shipping: 20,
        items: const [
          _InvoiceLine(title: 'تفاح أحمر', quantity: 2, unitPrice: 40),
          _InvoiceLine(title: 'موز', quantity: 1, unitPrice: 30),
          _InvoiceLine(title: 'أناناس', quantity: 1, unitPrice: 120),
        ],
      ),
      _OrderItem(
        orderNumber: '#1234568',
        total: '180 جنيه',
        quantity: 2,
        createdAt: '1 مارس 2026',
        paymentMethod: 'MasterCard **** 1234',
        shipping: 15,
        items: const [
          _InvoiceLine(title: 'عنب', quantity: 2, unitPrice: 55),
          _InvoiceLine(title: 'برتقال', quantity: 2, unitPrice: 20),
        ],
      ),
      _OrderItem(
        orderNumber: '#1234569',
        total: '95 جنيه',
        quantity: 2,
        createdAt: '27 فبراير 2026',
        paymentMethod: 'نقدًا عند الاستلام',
        shipping: 10,
        items: const [
          _InvoiceLine(title: 'فراولة', quantity: 1, unitPrice: 45),
          _InvoiceLine(title: 'كيوي', quantity: 1, unitPrice: 40),
        ],
      ),
    ];

    return Scaffold(
      appBar: buildAppBar(context, title: 'طلباتي',),
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
                          'طلب رقم ${order.orderNumber}',
                          style: TextStyles.bold13,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'الإجمالي ${order.total}  |  عدد المنتجات: ${order.quantity}',
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
          Text('فاتورة الطلب', style: TextStyles.bold13),
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
                    '$itemTotal جنيه',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            );
          }),
          const Divider(height: 20),
          _InvoiceSummaryRow(title: 'المجموع', value: '$subtotal جنيه'),
          const SizedBox(height: 6),
          _InvoiceSummaryRow(title: 'الشحن', value: '${order.shipping} جنيه'),
          const SizedBox(height: 6),
          _InvoiceSummaryRow(
            title: 'الإجمالي النهائي',
            value: '$total جنيه',
            isTotal: true,
          ),
          const SizedBox(height: 10),
          Text(
            'طريقة الدفع: ${order.paymentMethod}',
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF6D7573),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'تاريخ الطلب: ${order.createdAt}',
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
                  'QR الفاتورة',
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
