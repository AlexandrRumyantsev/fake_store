part of 'page.dart';

class _OnboardingContent extends StatelessWidget {
  final String text;
  final IconData icon;

  const _OnboardingContent({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 120, color: Colors.blue),
          const SizedBox(height: 32),
          Text(text),
        ],
      ),
    );
  }
}
