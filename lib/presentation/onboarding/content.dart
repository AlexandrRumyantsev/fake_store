part of 'page.dart';

class _OnboardingContent extends StatelessWidget {
  final String text;

  const _OnboardingContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
