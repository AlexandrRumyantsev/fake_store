import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_feed/page.dart';
import 'view_model.dart';

part 'progress_bar.dart';
part 'content.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: const _OnboardingPageContent(),
    );
  }
}

class _OnboardingPageContent extends StatefulWidget {
  const _OnboardingPageContent();

  @override
  State<_OnboardingPageContent> createState() => _OnboardingPageContentState();
}

class _OnboardingPageContentState extends State<_OnboardingPageContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<OnboardingViewModel>();
      viewModel.onComplete = _navigateToHomeFeed;
      viewModel.startTimer();
    });
  }

  void _navigateToHomeFeed() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeFeedPage()),
      );
    }
  }

  void _handleTap(TapDownDetails details, OnboardingViewModel viewModel) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.globalPosition.dx;

    if (tapPosition < screenWidth / 2) {
      viewModel.previousPage();
    } else {
      if (viewModel.isLastPage) {
        _navigateToHomeFeed();
      } else {
        viewModel.nextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, _) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: (details) => _handleTap(details, viewModel),
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: List.generate(
                        viewModel.totalPages,
                        (index) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: _ProgressBar(
                              isActive: index == viewModel.currentPage,
                              isPassed: index < viewModel.currentPage,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: _buildPageContent(viewModel.currentPage)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageContent(int page) {
    final pages = [
      const _OnboardingContent(key: ValueKey(0), text: 'onBoardingPage 1'),
      const _OnboardingContent(key: ValueKey(1), text: 'onBoardingPage 2'),
      const _OnboardingContent(key: ValueKey(2), text: 'onBoardingPage 3'),
    ];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: pages[page],
    );
  }
}