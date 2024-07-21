import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_item.dart';
import 'search_delegate.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreProducts();
      }
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isInit = false;
      _loadProducts();
    }
    super.didChangeDependencies();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadMoreProducts() async {
    setState(() {
      _isLoading = true;
    });
    _page++;
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts(page: _page);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              productProvider.sortProducts(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'price', child: Text('Sort by Price')),
              PopupMenuItem(value: 'rating', child: Text('Sort by Rating')),
            ],
          ),
        ],
      ),
      body: _isLoading && products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: products.length,
              itemBuilder: (ctx, i) => ProductItem(product: products[i]),
            ),
    );
  }
}