part of 'page.dart';

class _OnboardingContent extends StatelessWidget {
  final String text;
  final IconData icon;

  const _OnboardingContent({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [Icon(icon), Text(text)]));
  }
}
