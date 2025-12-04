part of 'page.dart';

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final ProductEntity product;


  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: context.read<HomeFeedViewModel>(),
      builder: (context, _) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(children: [
            CachedNetworkImage(imageUrl: product.imageUrl),
            Column(children: [
              Text(product.title),
              Text(product.price.toString()),
              Text(product.description),
              Text(product.category),
            ],),
          ],)
        );
      },
    );
  }
}
