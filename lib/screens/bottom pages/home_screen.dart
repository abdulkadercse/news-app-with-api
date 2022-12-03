import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Provider/news_provider.dart';
import '../../Widget/news_card_widgets.dart';
import '../../models/News_model.dart';
import '../details/news_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          )
        ],
        centerTitle: true,),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
          ],
        ),
      ),
      body: Consumer(builder: (_, ref, watch) {
        AsyncValue<NewsModel> latestNews = ref.watch(getLatestNewsProvider);
        return latestNews.when(data: (news) {
          return ListView.builder(
              itemCount: news.datas?.data?.length ?? 0,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    FeaturedNewsCard(images: news.datas?.data?[index].image?[0] ?? '', titles:news.datas?.data?[index].title ?? '')
                        .visible(index == 0),
                    NewsCard(titles: news.datas?.data?[index].title ?? '', images: news.datas?.data?[index].image?[0] ?? '')
                        .visible(index != 0),
                  ],
                ).onTap(() => NewsDetails(
                  newsId: news.datas!.data![index].id.toString(),
                ).launch(context));
              });
        }, error: (e, stack) {
          return Center(
            child: Text(e.toString()),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
      }),

      // body: FutureBuilder<NewsModel>(
      //   future: AuthRepo().getNews(),
      //   builder: (_,snapshot){
      //     if(snapshot.hasData){
      //       return ListView.builder(
      //           itemCount: snapshot.data?.datas?.data?.length ?? 0,
      //           itemBuilder: (_,index){
      //             return Column(
      //               children: [
      //                 FeaturedNewsCard(images: snapshot.data?.datas?.data?[index].image?[0] ?? '', titles: snapshot.data?.datas?.data?[index].title ?? '').visible(index == 0),
      //                 NewsCard(titles: snapshot.data?.datas?.data?[index].title ?? '', images: snapshot.data?.datas?.data?[index].image?[0] ?? '').visible(index !=0),
      //               ],
      //             ).onTap(() => NewsDetails(newsId: snapshot.data!.datas!.data![index].id.toString(),).launch(context));
      //           });
      //     } else{
      //       return const Center(child: CircularProgressIndicator(),);
      //     }
      //   },
      // ),
    );
  }
}
