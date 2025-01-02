import 'package:flutter_lest_go_router/pages/error_page.dart';
import 'package:flutter_lest_go_router/pages/home_page.dart';
import 'package:flutter_lest_go_router/pages/post_detail_page.dart';
import 'package:flutter_lest_go_router/pages/post_list_page.dart';
import 'package:flutter_lest_go_router/pages/search_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/', // 앱이 실행되게 되면 바로 '/' => 홈 페이지 로 넘어가게 설정
  errorBuilder: (context, state) {
    // 잘못된 경로로 갔을때 보여줄 페이지 설정
    return ErrorPage();
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'post',
          builder: (context, state) => PostListPage(),
          routes: [
            GoRoute(
              path: 'id',
              builder: (context, state) {
                final id = int.tryParse(state.pathParameters['id'] ?? '');
                if (id == null) {
                  return ErrorPage();
                }
                return PostDetailPage(id: id);
              },
            )
          ],
        ),
        GoRoute(
          path: 'search',
          builder: (context, state) {
            //
            final text = state.uri.queryParameters['text'] ?? '';
            if (text.trim().isEmpty) {
              return ErrorPage();
            }
            return SearchPage(text: text);
          },
        )
      ],
    ),
  ],
);
