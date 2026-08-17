import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:navigation/model/product/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> product = [];
  bool isLoading = true;

  final Dio dio = Dio();

  void initState() {
    getProduct();
    super.initState();
  }

  Future getProduct() async {
    try {
      final response = await dio.get("https://fakestoreapi.com/products");
      print('API RESPONSE ${response.statusCode}');

      final List data = response.data;

      // json we needs to convert it into dart object

      product = data.map((e) => Product.fromJson(e)).toList();

      print('Product: ${product[0].price}');
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
                        width: 90,
                        height: 90,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(width: 14),

                      // Center Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[index].title ?? "n/a",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              'Category',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 18,
                                ),

                                const SizedBox(width: 4),

                                Text(
                                  'Rating',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),

                                const SizedBox(width: 6),

                                Text(
                                  'Count',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Right Side
                      Column(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),

                          const SizedBox(height: 14),

                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => CartDetailsScreen(product: product),
                              //   ),
                              // );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
