import 'package:flutter/material.dart';
import 'package:hyperlink_task/controller/fetchData.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hyperlink_task/screens/cart.dart';
import 'package:hyperlink_task/screens/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FetchData fetchData = FetchData();

  @override
  void initState() {
    super.initState();
    fetchData.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.deepOrange[400],
              title: const Text("Shopify"),
              actions: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(fetchData: fetchData),
                              ));
                        },
                        icon: const Icon(Icons.shopping_cart_outlined)),
                    fetchData.cartLength != 0
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.blue[400],
                              child: Center(
                                child: Text(
                                  fetchData.cartLength.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ],
                )
              ]),
          body: fetchData.productData != null
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 300,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: fetchData.productData!.products!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  product:
                                      fetchData.productData!.products![index],
                                  fetchData: fetchData),
                            ));
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(fetchData.productData!
                                        .products![index].images!.first),
                                    fit: BoxFit.cover)),
                          )),
                          // GestureDetector(child: Container(child: Center(child: Text("Add to Cart"),),)),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                fetchData.cartProduct.contains(
                                        fetchData.productData!.products![index])
                                    ? fetchData.removeFromCart(
                                        fetchData.productData!.products![index])
                                    : fetchData.addToCart(fetchData
                                        .productData!.products![index]);
                                setState(() {});
                              },
                              style: TextButton.styleFrom(
                                  shape: const BeveledRectangleBorder(),
                                  backgroundColor: Colors.deepOrange[400]),
                              child: Text(
                                fetchData.cartProduct.contains(
                                        fetchData.productData!.products![index])
                                    ? "Remove from cart"
                                    : "Add to Cart",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
