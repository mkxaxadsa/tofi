import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Map<String, dynamic>> _settingsItems = [
    {
      'id': 1,
      'title': 'Terms of use',
      'url':
          'https://docs.google.com/document/d/1wIL4NcvoCXwcA-Sukn_QMqIk2rj-QksHEwUxKllJo6c/edit?usp=sharing',
    },
    {
      'id': 2,
      'title': 'Privacy Policy',
      'url':
          'https://docs.google.com/document/d/1IJoPPjtb_NZX6vFR_U_04ICSLBUruqx6cJrwiF9AJ5g/edit?usp=sharing',
    },
    {
      'id': 3,
      'title': 'Support page',
      'url': 'https://forms.gle/oczrr32ioHWxTmVk7',
    },
    {
      'id': 4,
      'title': 'Share with friends',
      'action': 'share',
    },
  ];

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void _shareApp() {
    Share.share('Check out this Toni Finance Utility in AppStore!',
        subject: 'Toni Finance');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 46 + getStatusBar(context)),
        const Center(
          child: TextB('Settings', fontSize: 32),
        ),
        const SizedBox(height: 43),
        ..._settingsItems
            .map((item) => Column(
                  children: [
                    _Tile(
                      id: item['id'],
                      title: item['title'],
                      onPressed: item['action'] == 'share'
                          ? _shareApp
                          : () => _launchUrl(item['url']),
                    ),
                    const SizedBox(height: 16),
                  ],
                ))
            .toList(),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.navbar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: Center(
                child: SvgPicture.asset(
                  'assets/settings/settings$id.svg',
                ),
              ),
            ),
            Expanded(
              child: TextM(title, fontSize: 16),
            ),
            SvgPicture.asset('assets/settings/arrow-right.svg'),
            const SizedBox(width: 25),
          ],
        ),
      ),
    );
  }
}
