import 'package:url_launcher/url_launcher.dart';

class UrlHelpers {
  /// Abre URL genérica (websites, redes sociais, etc)
  static Future<void> openUrl(String url, {LaunchMode mode = LaunchMode.externalApplication}) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: mode);
    }
  }

  /// Abre um link de email com subject opcional
  static Future<void> openEmail(String email, {String? subject}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: subject != null ? 'subject=$subject' : null,
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  /// Abre um número de telefone
  static Future<void> openPhone(String phoneNumber) async {
    // Remove caracteres não numéricos e adiciona código do país se necessário
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    final Uri phoneUri = Uri.parse('tel:$cleanPhone');

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  /// Abre conversa no WhatsApp
  static Future<void> openWhatsApp(String phoneNumber, {String? message}) async {
    // Remove caracteres não numéricos
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$cleanPhone${message != null ? '?text=${Uri.encodeComponent(message)}' : ''}',
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }

  /// Abre Instagram
  static Future<void> openInstagram(String username) async {
    await openUrl('https://instagram.com/$username');
  }

  /// Abre Facebook
  static Future<void> openFacebook(String pageId) async {
    await openUrl('https://facebook.com/$pageId');
  }

  /// Abre YouTube
  static Future<void> openYouTube(String channelId) async {
    await openUrl('https://youtube.com/$channelId');
  }

  /// Abre LinkedIn
  static Future<void> openLinkedIn(String company) async {
    await openUrl('https://linkedin.com/company/$company');
  }

  /// Baixa arquivo APK
  static Future<void> downloadApk(String apkUrl) async {
    await openUrl(apkUrl);
  }
}
