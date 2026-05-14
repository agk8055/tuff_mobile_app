import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'payment_processing_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFAC00C)),
          onPressed: () => Navigator.pop(context),
        ),
        trailing: const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CHECKOUT',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFFFAC00C),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF8B4513),
                  ),
                ),
                Text(
                  '3 Items',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Order Summary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF9E7),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Elite Plan', r'$59', sub: 'Monthly Subscription', unit: '/mo'),
                  const SizedBox(height: 16),
                  _buildSummaryRow('Personal Training', r'$40', sub: 'On-demand credit'),
                  const SizedBox(height: 16),
                  _buildSummaryRow('Estimated Tax', r'$0'),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(color: Colors.black12),
                  ),
                  _buildSummaryRow('Total Investment', r'$99', isTotal: true),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF8B4513),
              ),
            ),
            const SizedBox(height: 16),

            // Payment Method Selection
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF9E7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.5)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/8/89/Razorpay_logo.png',
                      height: 20,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.payment, size: 20),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Razorpay',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentProcessingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFAC00C),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ).copyWith(
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
                        return const Color(0xFFE5AE0B);
                      }
                      return null;
                    },
                  ),
                ),
                child: const Text(
                  'CONFIRM & PAY',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {String? sub, String? unit, bool isTotal = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: isTotal ? 18 : 16,
                  fontWeight: isTotal ? FontWeight.w900 : FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (sub != null)
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: isTotal ? 24 : 18,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFFAC00C),
              ),
            ),
            if (unit != null)
              Text(
                ' $unit',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
