import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_api/product_home.dart';

class SignInView extends StatelessWidget {
   SignInView({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){ 
                      return"Enter your name";
                    }else if (value.contains("@"
                    )){
                      return "There is symbol in your name";
                    }
                   
                    
                  },
                decoration: InputDecoration(label:Text("Name")),
                ),
              ),
              TextButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  print("Validated");
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context)=>ProductsHomeView())
                    );
                }
              },
              child: const Text("Valiable"),
              ),
        
        
        
          ],
          ),
        )
         ),
    );
    
  }
}