import 'package:flutter/material.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/models/home_models.dart';

class DetaillesHomeProduct extends StatelessWidget {
  final dynamic price;
  final dynamic oldPrice;
  final String image;
  final String name;
  final int discount;
  final String description;

   DetaillesHomeProduct({
     Key? key,
     required this.name,
     required this.price,
     required this.oldPrice,
     required this.image,
     required this.discount,
     required this.description,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: NetworkImage(image),
               )
             ),
            ),
           SizedBox(height: 20.0,),
           ReusPaddingAll(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     name,
                       style: Theme.of(context).textTheme.headline6
                   ),

                   SizedBox(height: 15.0,),
                   Row(
                     children: [
                       Text('${price}',
                         style: Theme.of(context).textTheme.subtitle2,
                       ),
                       SizedBox(
                         width: 20.0,
                       ),
                       if (discount != 0)
                         Text(
                           '${oldPrice}',
                           style: Theme.of(context).textTheme.subtitle1,
                         ),
                     ],
                   ),
                   SizedBox(height: 15.0,),

                   Divider(height: 4,color: Colors.grey,),

                   SizedBox(height: 20.0,),
                   Text('${description}',
                    style: Theme.of(context).textTheme.subtitle2,
                   ),
                 ],
               ),
           ),
          ],
        ),
      ),
    );
  }
}




//DetaillesHomeProduct


