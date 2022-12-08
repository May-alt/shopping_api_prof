import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/layout/constants/const_colors.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/models/favorites_models.dart';
import 'package:shopping_api_prof/models/search_models.dart';
import 'package:shopping_api_prof/modules/ui/screnns/search/cubit/search_cubit.dart';

class SearchScrenns extends StatefulWidget {
  const SearchScrenns({Key? key}) : super(key: key);

  @override
  State<SearchScrenns> createState() => _SearchScrennsState();
}

class _SearchScrennsState extends State<SearchScrenns> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchState>(
        listener: (context, state) {},
        builder:(context, state) {

          SearchCubit cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: new AppBar(
              title: Text(
                "Search-Prod",
              ),
            ),

            body: ReusPaddingAll(
              child: Column(
                children: [
                  if (state is SearchLoadingState) LinearProgressIndicator(),
                  SizedBox(
                    height: 15.0,
                  ),

                  Container(
                    // height: 120,
                    // color: Colors.amber,
                    child: TextFormField(
                      onTap: () {},
                      onFieldSubmitted: (String text) {
                        cubit.SearchData(text);
                      },
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: defaultColors,),
                        hintText: "search Product....",
                        hintStyle: Theme.of(context).textTheme.subtitle2,
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                        contentPadding: EdgeInsets.all(12.0),
                        //outline Border
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: defaultColors,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: defaultColors,
                            width: 1,
                          ),
                        ),

                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: defaultColors,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: defaultColors,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),




                   if(cubit.searchModel != null && cubit.searchModel!.data!.data != null && cubit.searchModel!.data!.data.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 120,
                            color: Colors.white,
                            child: BuildItemSearch(cubit.searchModel!.data!.data[index])
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
                            height: 3,
                          );
                        },
                        itemCount: cubit.searchModel!.data!.data?.length?? 0,
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

  Widget BuildItemSearch(ProductMod model){
    return Container(
      height: 120,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.teal,width: 4))
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('${model.image}'),
                 // fit: BoxFit.cover
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: EdgeInsets.all(10.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.name}',
                    maxLines:1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('${model.price}',
                        style: Theme.of(context).textTheme.bodyText1,
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
