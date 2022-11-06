import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_api/products_model.dart';

class ProductDetailsView extends StatefulWidget {
   ProductDetailsView({Key? key, this.productsModel }) : super(key: key);
 ProductsModel? productsModel ;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Product  Details"),
        backgroundColor: Colors.teal,
       
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  child: ListView.builder(
                    itemCount: widget.productsModel!.images!.length,
                    itemBuilder:  (context, index) {
                    
                     return  Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:NetworkImage(widget.productsModel!.images![0])
                         ),
                    ),
                    
                  );
                    
                      
                    }
                    ),
                ),
              ],
            ),
            
          ]
          ),
      ),
    );
  
    
  }
}