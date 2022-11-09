import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreenProvider with ChangeNotifier {
  final Uri url1 =
      Uri.parse('https://www.linkedin.com/in/siyaudheen-m-581b46199');
  final Uri url2 = Uri.parse('mailto:m.siyaudheen@gmail.com');

  Future<void> launchUrlLinkedin() async {
    if (!await launchUrl(url1)) {
      throw 'Could not launch $url1';
    }
  }

  Future<void> launchUrlMailMail() async {
    if (!await launchUrl(url2)) {
      throw 'Could not launch $url2';
    }
  }
}
