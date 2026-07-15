import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const VitalNodeApp());
}

class VitalNodeApp extends StatelessWidget {
  const VitalNodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //==========================================
  // アクセスURL
  //==========================================

  static const String homeUrl = "https://comzow.jp/mobile/login.php";

  late final WebViewController controller;

  @override
  void initState() {

    super.initState();

    controller = WebViewController()

      // JavaScriptを有効
      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      // URL表示
      ..loadRequest(
        Uri.parse(homeUrl),
      );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: WebViewWidget(

          controller: controller,

        ),

      ),

    );
  }
}