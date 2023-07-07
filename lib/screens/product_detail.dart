import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hyperlink_task/controller/fetchData.dart';
import 'package:hyperlink_task/model/product_model.dart';
import 'package:hyperlink_task/screens/cart.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product,required this.fetchData}) : super(key: key);
  final Products product;
  final FetchData fetchData;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // final FetchData fetchData = FetchData();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
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
                                builder: (context) => CartScreen(fetchData: widget.fetchData),
                              ));
                        },
                        icon: const Icon(Icons.shopping_cart_outlined)),
                    widget.fetchData.cartLength != 0
                        ? Positioned(
                      top: 0,
                      left: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue[400],
                        child: Center(
                          child: Text(
                            widget.fetchData.cartLength.toString(),
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
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.product.images!.first),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton(

                      onPressed: () {
                        widget.fetchData.cartProduct.contains(widget.product)
                            ? widget.fetchData.removeFromCart(widget.product)
                            : widget.fetchData.addToCart(widget.product);
                        setState(() {
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: const BeveledRectangleBorder(),
                          backgroundColor: Colors.deepOrange[400]),
                      child: Text(
                        widget.fetchData.cartProduct.contains(widget.product)
                            ? "Remove from cart"
                            : "Add to Cart",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.product.title!,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description!,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
