import 'package:clean_archeticture_posts_app/core/utils/snackbar_message.dart';
import 'package:clean_archeticture_posts_app/core/utils/utils.dart';
import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/presentation/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:clean_archeticture_posts_app/features/presentation/pages/homePage.dart';
import 'package:clean_archeticture_posts_app/features/presentation/widgets/post_add_update/Form_wideget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/posts_page/loading_widget.dart';

class AddUpdatePostPage extends StatelessWidget {
  final Posts? posts;
  final bool isUpdatePage;

  const AddUpdatePostPage({super.key, this.posts, required this.isUpdatePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  AppBar _appBar() =>
      AppBar(title: Text(isUpdatePage ? 'update post' : 'add post'));

  Widget _buildBody() {
    return Center(
        child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
      listener: (context, state) {
        if (state is MessageAddDeleteUpdatePostStates) {
          showSuccessSnackBar(context: context, msg: state.message);
          navigateTo(context, const Home());
        }
        if (state is ErrorAddDeleteUpdatePostStates) {
          showErrorSnackBar(context: context, msg: state.message);
        }
      },
      builder: (context, state) {
        if (state is LoadingAddDeleteUpdateState) {
          return LoadingWidget();
        }
        return FormWidget(
            isUpdatePage: isUpdatePage, posts: isUpdatePage ? posts : null);
      },
    ));
  }
}
