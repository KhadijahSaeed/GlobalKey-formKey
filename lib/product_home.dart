import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:shop_api/product_details.dart';
import 'package:shop_api/products_model.dart';

class ProductsHomeView extends StatefulWidget {
  const ProductsHomeView({Key? key}) : super(key: key);

  @override
  State<ProductsHomeView> createState() => _ProductsHomeViewState();
}

class _ProductsHomeViewState extends State<ProductsHomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Blinks Kollection's"),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<ProductsModel>>(
          future: getAllProducts(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.33,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data![index].images![0]))),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              snapshot.data![index].title!,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GH ${snapshot.data![index].price.toString()}",
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return ProductDetailsView(
                                        productsModel: snapshot.data![index]);
                                  })));
                                },
                                child: const Text(
                                  "View more... ",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    );
                  }));
            } else {
              Center(child: CircularProgressIndicator());
            }
            return Container();
          })),
    );
  }
}

Future<List<ProductsModel>> getAllProducts() async {
  final response =
      await get(Uri.parse(("https://api.escuelajs.co/api/v1/products")));
  if (response.statusCode == 200) {
    return productsModelFromJson(response.body);
  } else {
    throw {Exception("Unable to get data")};
  }
}
