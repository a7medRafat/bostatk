import 'package:clean_archeticture_posts_app/core/colors.dart';
import 'package:clean_archeticture_posts_app/core/utils/utils.dart';
import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/presentation/pages/post_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostListWidget extends StatelessWidget {
  final List<Posts> posts;

  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              navigateTo(context,PostDetailPage(posts: posts[index], ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: defaultColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posts[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'post number ${posts[index].id.toString()}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent.withOpacity(0.5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        posts[index].body,
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: posts.length,
    );
  }
}
