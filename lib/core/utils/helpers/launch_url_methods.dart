import 'package:url_launcher/url_launcher.dart';

// ? URL Link
Future<void> launchURL(String websiteUrl, {LaunchMode? mode}) async {
  final Uri url = Uri.parse(websiteUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: mode ?? LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch ${url.toString()}';
  }
}

// ? Phone Dial
Future<void> contactDial(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'Could not launch ${launchUri.toString()}';
  }
}

// ? Mailto
Future<void> mailto(String email) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch ${emailLaunchUri.toString()}';
  }
}
