// import 'package:flutter/material.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   // Token _paymentToken;
//   // PaymentMethod _paymentMethod;
//   // String _error;
//   // final String _secret = "YOUR_PUBLISHABLE_KEY"; // Ваш публичный ключ Stripe

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   StripePayment.setOptions(
//   //     StripeOptions(
//   //       publishableKey: _secret,
//   //       merchantId: "Test",
//   //       androidPayMode: 'test',
//   //     ),
//   //   );
//   // }

//   // void setError(dynamic error) {
//   //   setState(() {
//   //     _error = error.toString();
//   //   });
//   // }

//   // void setPaymentMethod(PaymentMethod paymentMethod) {
//   //   setState(() {
//   //     _paymentMethod = paymentMethod;
//   //   });
//   // }

//   // void _startPayment() {
//   //   StripePayment.paymentRequestWithCardForm(
//   //     CardFormPaymentRequest(),
//   //   ).then((paymentMethod) {
//   //     setPaymentMethod(paymentMethod);
//   //   }).catchError(setError);
//   // }

//   // void _confirmPayment() {
//   //   StripePayment.confirmPaymentIntent(
//   //     PaymentIntent(
//   //       clientSecret: "YOUR_CLIENT_SECRET", // Ваш секретный ключ для платежа
//   //       paymentMethodId: _paymentMethod.id,
//   //     ),
//   //   ).then((paymentIntent) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Payment Successful!')),
//   //     );
//   //   }).catchError(setError);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pay As You Go'),
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[Text('data')],
//         ),
//       ),
//     );
//   }
// }
