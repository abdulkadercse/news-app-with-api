
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../Provider/news_provider.dart';
import '../../Widget/news_card_widgets.dart';
import '../../models/News_details_model.dart';


class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key, required this.newsId}) : super(key: key);
  final String newsId;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<NewsDetailsModel> newsDetails = ref.watch(getLatestNewsDetailsProvider(widget.newsId));
      return newsDetails.when(data: (details) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(getLatestNewsDetailsProvider(widget.newsId)),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  FeaturedNewsCard(images: details.data?.image?[0].toString() ?? '', titles: details.data?.title ?? ''),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: Colors.red),
                          child: Text(
                            details.data?.newsCategory ?? '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          details.data?.reporterName ?? '',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      Bidi.stripHtmlIfNeeded(details.data?.description ?? ''),
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }, error: (e, stack) {
        return Text(e.toString());
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
    });
  }
}
