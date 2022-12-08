import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/bloc_folds_/cubit/app_cubit_cubit.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/models/categories_models.dart';

class CategoryScrenns extends StatefulWidget {
  const CategoryScrenns({Key? key}) : super(key: key);

  @override
  State<CategoryScrenns> createState() => _CategoryScrennsState();
}

class _CategoryScrennsState extends State<CategoryScrenns> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitCubit, AppCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubitCubit cubit = AppCubitCubit.get(context);

        //return cubit.categoriesModels != null
        return state is! AppLoadingCategoryState
            ? Align(alignment: Alignment.center,child: buildCatPage(cubit.categoriesModels),)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget buildCatPage(CategoriesModels categoriesModels) => GridView.builder(
        itemCount: categoriesModels.data.datalist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ReusPaddingAll(
              child: Container(

             decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(
                      //"https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"
                      categoriesModels.data.datalist[index].image),
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: Colors.teal.withOpacity(0.6),
                    child: Text(
                      categoriesModels.data.datalist[index].name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
      );
}
