import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_feed/page.dart';
import '../home_feed/view_model.dart';
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
  late final OnboardingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<OnboardingViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.onComplete = _navigateToHomeFeed;
      _viewModel.startTimer();
    });
  }

  void _navigateToHomeFeed() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => HomeFeedViewModel(),
            child: const HomeFeedPage(),
          ),
        ),
      );
    }
  }

  void _handleTap(TapDownDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.globalPosition.dx;

    if (tapPosition < screenWidth / 2) {
      _viewModel.previousPage();
    } else {
      if (_viewModel.isLastPage) {
        _navigateToHomeFeed();
      } else {
        _viewModel.nextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: _handleTap,
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: List.generate(
                        _viewModel.totalPages,
                        (index) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: _ProgressBar(
                              isActive: index == _viewModel.currentPage,
                              isPassed: index < _viewModel.currentPage,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: _buildPageContent(_viewModel.currentPage)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageContent(int page) {
    final pages = [
      const _OnboardingContent(
        key: ValueKey(0),
        text: 'onBoardingPage 1',
        icon: Icons.shopping_bag,
      ),
      const _OnboardingContent(
        key: ValueKey(1),
        text: 'onBoardingPage 2',
        icon: Icons.local_shipping,
      ),
      const _OnboardingContent(
        key: ValueKey(2),
        text: 'onBoardingPage 3',
        icon: Icons.check_circle,
      ),
    ];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: pages[page],
    );
  }
}
