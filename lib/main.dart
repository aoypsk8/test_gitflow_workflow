import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Analytics Demo',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ---------- EVENT HELPERS ----------

  Future<void> logSignUp() async {
    await FirebaseAnalytics.instance.logSignUp(signUpMethod: "phone_number");
  }

  Future<void> logLogin() async {
    await FirebaseAnalytics.instance.logLogin(loginMethod: "email");
  }

  Future<void> logAddMoney() async {
    await FirebaseAnalytics.instance.logEvent(
      name: "add_money",
      parameters: {
        "amount": 50000,          // LAK
        "currency": "LAK",
        "payment_method": "visa",
      },
    );
  }

  Future<void> logTransfer() async {
    await FirebaseAnalytics.instance.logEvent(
      name: "transfer_money",
      parameters: {
        "amount": 200000,
        "currency": "LAK",
        "to_type": "wallet",
        "recipient_id": "user_456",
      },
    );
  }

  Future<void> logBillPayment() async {
    await FirebaseAnalytics.instance.logEvent(
      name: "bill_payment",
      parameters: {
        "bill_type": "electricity",
        "amount": 120000,
        "currency": "LAK",
        "provider": "EDL",
      },
    );
  }

  Future<void> logQrPayment() async {
    await FirebaseAnalytics.instance.logEvent(
      name: "scan_qr_payment",
      parameters: {
        "merchant_id": "merchant_789",
        "amount": 45000,
        "currency": "LAK",
      },
    );
  }

  Future<void> logPurchase() async {
    await FirebaseAnalytics.instance.logPurchase(
      currency: "USD",
      value: 9.99,
      items: [
        AnalyticsEventItem(
          itemId: "sku123",
          itemName: "VIP Membership",
          quantity: 1,
        ),
      ],
    );
  }

  // ---------- UI ----------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallet Analytics Demo")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: logSignUp,
            child: const Text("Log Sign Up"),
          ),
          ElevatedButton(
            onPressed: logLogin,
            child: const Text("Log Login"),
          ),
          ElevatedButton(
            onPressed: logAddMoney,
            child: const Text("Log Add Money"),
          ),
          ElevatedButton(
            onPressed: logTransfer,
            child: const Text("Log Transfer Money"),
          ),
          ElevatedButton(
            onPressed: logBillPayment,
            child: const Text("Log Bill Payment"),
          ),
          ElevatedButton(
            onPressed: logQrPayment,
            child: const Text("Log QR Payment"),
          ),
          ElevatedButton(
            onPressed: logPurchase,
            child: const Text("Log Purchase"),
          ),
        ],
      ),
    );
  }
}
