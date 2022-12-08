import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/bloc_folds_/cubit/app_cubit_cubit.dart';
import 'package:shopping_api_prof/layout/constants/const_colors.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/const_widgets.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/models/categories_models.dart';
import 'package:shopping_api_prof/models/home_models.dart';
import 'package:shopping_api_prof/modules/ui/screnns/home/homeDetailles/detailles_home_prod.dart';

class HomeScrenns extends StatefulWidget {
  const HomeScrenns({Key? key}) : super(key: key);

  @override
  State<HomeScrenns> createState() => _HomeScrennsState();
}

class _HomeScrennsState extends State<HomeScrenns> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitCubit, AppCubitState>(
      listener: (context, state) { },


      builder: (context, state) {
        AppCubitCubit cubit = AppCubitCubit.get(context);
        return cubit.homeModel != null && cubit.categoriesModels != null
            ? ProductBuilder(AppCubitCubit.get(context).homeModel!,AppCubitCubit.get(context).categoriesModels)
            : const Center(
                child: CircularProgressIndicator(color: Colors.teal,),
              );
      },
    );
  }



  Widget ProductBuilder(HomeModel homeModel,CategoriesModels categoriesModels){
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarousalBanner(homeModel),

            SizedBox(height: 20.0,),

            ReusTextTitle(text: "categories",
                style: Theme.of(context).textTheme.headline6
            ),

            SizedBox(height: 20.0,),

            Container(
              height: 110,
              child:BuildCategorySlider(categoriesModels)
            ),

            SizedBox(height: 20.0,),

            ReusTextTitle(text: "News products",
               style: Theme.of(context).textTheme.headline6
            ),

            SizedBox(height: 20.0,),

            ReusPaddingAll(
              child: ProductBody(homeModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget CarousalBanner(HomeModel homeModel) {
    return CarouselSlider(
        items: homeModel.data.banners.map((e) {
          return Image(
            image: NetworkImage(e.image),
            fit: BoxFit.fill,
          );
        }).toList(),
        options: CarouselOptions(
            height: 200,
            disableCenter: true,
            initialPage: 0,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.linear,
            scrollDirection: Axis.horizontal));
  }

  Widget BuildCategorySlider(CategoriesModels categoriesModels)
  {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child:  ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 15.0,);
          },
          itemCount: categoriesModels.data.datalist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left:15.0),
              child: Container(
                height: 120,
                width: 100,
                child: Stack(
                  children: [
                    //Image(image: NetworkImage("https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"),),
                    Image(image: NetworkImage(categoriesModels.data.datalist[index].image),),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 100,
                        color: Colors.teal.withOpacity(0.6),
                        child: Text(
                          categoriesModels.data.datalist[index].name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },

      ),
    );
  }


  Widget ProductBody(HomeModel homeModel) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: homeModel.data.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.9,
        crossAxisSpacing: 1.0
      ),
      itemBuilder: (context, index) {

        AppCubitCubit cubit = AppCubitCubit.get(context);
        return Container(
            child: InkWell(
             onTap: () {
               NavToAotherPage(
                   context,
                   DetaillesHomeProduct(
                       image: homeModel.data.products[index].image,
                     discount:homeModel.data.products[index].discount ,
                     name: homeModel.data.products[index].name,
                     oldPrice: homeModel.data.products[index].oldPrice,
                     price: homeModel.data.products[index].price,
                     description: homeModel.data.products[index].description,
                   ),
               );
             },
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(homeModel.data.products[index].image),

                    ),
                  ),
                ),
                if (homeModel.data.products[index].discount != 0)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(05.0),
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(02.0),
                    child: Text(
                      "Discount".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ]),
              Padding(
                padding: const EdgeInsets.all(08.0),
                child: Column(children: [
                  Text(
                    homeModel.data.products[index].name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),

                  SizedBox(
                    height: 08.0,
                  ),

                  Row(
                    children: [
                      if (homeModel.data.products[index].discount != 0)
                        Text(
                          '${homeModel.data.products[index].oldPrice}',
                          style: Theme.of(context).textTheme.subtitle1,
                         ),
                      SizedBox(
                        height: 15.0,
                      ),

                      Text('${homeModel.data.products[index].price}',
                        style:Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: () {

                          cubit.postChangeFav(homeModel.data.products[index].id);
                         // print(homeModel.data.products[index].id);
                         // print(homeModel.data.products[index].inFavorites);

                        },
                        icon: CircleAvatar(
                          radius: 10.0,
                          // backgroundColor: AppCubitCubit.get(context).changeFavorites[homeModel.data.products[index].inFavorites]
                          //     ? defaultColors
                          //     : Colors.grey,
                           backgroundColor: defaultColors,

                          child: Icon(
                            Icons.favorite,
                            size: 16,
                             color: Colors.white,
                             // color:cubit.changeFavorites[homeModel.data!.products![index].inFavorites] ?  Colors.white :  Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                ),
              ),
            ],
          ),
        ));
      },
    );
  }

}
