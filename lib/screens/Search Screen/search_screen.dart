import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/repository/auth_repo.dart';

import '../../Widget/news_card_widgets.dart';
import '../../models/Search Model/SeachModel.dart';
import '../details/news_details.dart';


class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? search;
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    child: SizedBox(
                      height: 60,
                      // color: Colors.red,
                      width: double.infinity,
                      child: TextField(
                        onSubmitted: (value){
                          setState(() {
                            search=value;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search,color: Colors.grey,size: 25,).onTap(()async{
                            await AuthRepo().getSearch(search!);
                          }),
                          hintText: 'Search',
                          suffixIcon: Icon(Icons.mic,color: Colors.grey,),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FutureBuilder<SeachModel>(
                    future: AuthRepo().getSearch(search ?? ''),
                    builder: (context, snapshot){
                      if(snapshot.hasData && !search.isEmptyOrNull){
                        if(snapshot.data!.datas!.data!.isEmpty){
                          return const Center(child: Text('No Data Found'),);
                        } else{
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.datas?.data?.length ?? 0,
                              itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    FeaturedNewsCard(
                                      images:  snapshot.data?.datas?.data?[index].image?[0] ?? '',
                                      titles: snapshot.data?.datas?.data?[index].title ?? '',).visible(index==0),

                                    NewsCard(
                                      images: snapshot.data?.datas?.data?[index].image?[0] ?? '',
                                      titles: snapshot.data?.datas?.data?[index].title ?? '',

                                    ).visible(index !=0),

                                  ],
                                ).onTap(() => NewsDetails(newsId: snapshot.data!.datas!.data![index].id.toString(),).launch(context));
                              });
                        }
                      } else if(search.isEmptyOrNull){
                        return Padding(
                          padding: const EdgeInsets.only(top: 350),
                          child: const Center(child: Text('Waiting For your Search Query'),),
                        );
                      }
                      else{
                        return const Padding(
                          padding: EdgeInsets.only(top: 250),
                          child: Center(child: CircularProgressIndicator(),),
                        );
                      }
                    }),
              ],
            ),
          )
      ),
    );
  }
}
