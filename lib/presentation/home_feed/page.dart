import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/product.dart';
import 'view_model.dart';

part 'product_card.dart';

class HomeFeedPage extends StatefulWidget {
  const HomeFeedPage({super.key});

  @override
  State<HomeFeedPage> createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<HomeFeedViewModel>();
      viewModel.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeFeedViewModel>();
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          final hasData = viewModel.state is HomeFeedLoaded;
          return SafeArea(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                viewModel.handlePagination(notification);
                return false;
              },
              child: CustomScrollView(
                controller: _scrollController,
                physics: hasData
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    title: const Text('Home Feed'),
                    floating: hasData,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    surfaceTintColor: Colors.transparent,
                  ),
                  switch (viewModel.state) {
                    HomeFeedInitial() => const SliverFillRemaining(
                      child: Center(child: Text('Home Feed Page')),
                    ),
                    HomeFeedLoading() => const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    final HomeFeedLoaded data => SliverList.builder(
                      itemCount: data.products.length,
                      itemBuilder: (context, index) =>
                          _ProductCard(product: data.products[index]),
                    ),
                    final HomeFeedError error => SliverFillRemaining(
                      child: Center(child: Text(error.error)),
                    ),
                  },
                  if (viewModel.state is HomeFeedLoaded &&
                      (viewModel.state as HomeFeedLoaded).isLoadingMore)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
