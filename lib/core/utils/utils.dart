import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlExternal(String link) async {
  final Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw Exception('Could not launch $url');
  }
}
