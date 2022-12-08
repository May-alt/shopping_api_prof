import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:shopping_api_prof/bloc_folds_/cubit/app_cubit_cubit.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/const_widgets.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/models/favorites_models.dart';


class FavoritScrenns extends StatefulWidget {
  const FavoritScrenns({Key? key}) : super(key: key);

  @override
  State<FavoritScrenns> createState() => _FavoritScrennsState();
}

class _FavoritScrennsState extends State<FavoritScrenns> {
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitCubit,AppCubitState>(
      listener: (context, state) { },
        builder: (context, state) {
         AppCubitCubit cubit = AppCubitCubit.get(context);
        //  return cubit.favoritesModels != null && cubit.favoritesModels!.data != null //&& cubit.favoritesModels!.data!.data.length is NotEmpty
        // // return state is AppLoadingGetFavoritesState
        //     ?
        //   ListView.separated(
        //     physics: BouncingScrollPhysics(),
        //     itemBuilder: (context, index) {
        //       return ReusPaddingAll(
        //         child: Container(
        //           // height: 130,
        //           color: Colors.white,
        //           child: BuildFavItems(cubit.favoritesModels!.data!.data[index]),
        //         ),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return Divider(
        //         color: Colors.grey,
        //         height: 3,
        //       );
        //     },
        //     itemCount: cubit.favoritesModels!.data!.data.length,
        //   )
        //     :
        //   Center(
        //     child: CircularProgressIndicator(),
        //    );

         //Conditional.single
          return Conditional.single(
            context: context,
            conditionBuilder:(context) => cubit.favoritesModels != null && cubit.favoritesModels!.data != null && cubit.favoritesModels!.data!.data.isNotEmpty ,
            widgetBuilder: (context) {
              return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ReusPaddingAll(
                          child: Container(
                            height: 130,
                            color: Colors.white,
                            child: BuildFavItems(cubit.favoritesModels!.data!.data[index]),
                          ),

                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey,
                          height: 3,
                        );
                      },
                      itemCount: cubit.favoritesModels!.data!.data.length,
                    );
            },
            fallbackBuilder: (context) {
              return Center(child: CircularProgressIndicator(),);
            },
          );
      },
    );
  }




  Widget BuildFavItems(FavoritesData model)
  {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.teal,width: 4))
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: NetworkImage("https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg"),
                  image: NetworkImage('${model.product!.image}'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: EdgeInsets.all(15.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.product!.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('${model.product!.price}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),

                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon:CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
