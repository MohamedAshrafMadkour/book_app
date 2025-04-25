import 'package:book_app/core/function/custom_snake_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(String? uri, context) async {
  if (uri != null) {
    Uri url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      customSnakeBar(context, 'cannot launch$uri');
    }
  }
}
