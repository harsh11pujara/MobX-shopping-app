import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hyperlink_task/controller/fetchData.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.fetchData}) : super(key: key);
  final FetchData fetchData;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.deepOrange[400],
            title: const Text("Shopify"),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.fetchData.cartProduct.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minVerticalPadding: 10,
                      leading: Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.fetchData
                                    .cartProduct[index].images!.first),
                                fit: BoxFit.cover)),
                      ),
                      title: Text(
                        widget.fetchData.cartProduct[index].title!,
                        softWrap: true,
                      ),
                      subtitle: Text(
                        widget.fetchData.cartProduct[index].description!,
                        softWrap: true,
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: TextButton(
                          onPressed: () {
                            widget.fetchData.removeFromCart(
                                widget.fetchData.cartProduct[index]);
                            setState(() {});
                          },
                          style: TextButton.styleFrom(
                              shape: const BeveledRectangleBorder(),
                              backgroundColor: Colors.deepOrange[400]),
                          child: const Text(
                            "Remove",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        Text('${widget.fetchData.total}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18))
                      ],
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: 300,
                      child: TextButton(
                        onPressed: () {
                        },
                        style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(),
                            backgroundColor: Colors.deepOrange[400]),
                        child: const Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
