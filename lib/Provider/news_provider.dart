

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repo.dart';

final getLatestNewsProvider = FutureProvider((ref) => AuthRepo().getNews());

final getLatestNewsDetailsProvider = FutureProvider.family((ref,newsId) => AuthRepo().getNewsDetails(newsId.toString()));