import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInWebView(String url, {VoidCallback? onError}) async {
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
  } catch (e) {
    onError?.call();
  }
  // if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {

  // }
}
