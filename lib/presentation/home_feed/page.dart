import 'package:cached_network_image/cached_network_image.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeFeedViewModel>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeFeedViewModel>();
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return switch (viewModel.state) {
            HomeFeedInitial() => const Center(child: Text('Home Feed Page')),
            HomeFeedLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            final HomeFeedLoaded data => ListView.builder(
              itemCount: data.products.length,
              itemBuilder: (context, index) {
                return _ProductCard(product: data.products[index]);
              },
            ),
            final HomeFeedError error => Center(child: Text(error.error)),
          };
        },
      ),
    );
  }
}
