import 'package:clean_archeticture_posts_app/core/colors.dart';
import 'package:clean_archeticture_posts_app/core/utils/text_form_fiels.dart';
import 'package:clean_archeticture_posts_app/features/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/presentation/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePage; // to know if page is to update or add post
  final Posts? posts;

  const FormWidget({super.key, required this.isUpdatePage, this.posts});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _tiltController = TextEditingController();
  final _bodyController = TextEditingController();
  Color color = const Color(0xFFe9f5f9);

  @override
  void initState() {
    if (widget.isUpdatePage == true) {
      _tiltController.text = widget.posts!.title;
      _bodyController.text = widget.posts!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               TextFieldWidget(controller: _tiltController, msg: 'title mus\'t be empty', hint: 'title'),
                SizedBox(height: 20),
                TextFieldWidget(controller: _bodyController, msg: 'body mus\'t be empty', hint: 'body',minLines: 6,maxLines: 6,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: defaultColor
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final post = Posts(
                            title: _tiltController.text,
                            body: _bodyController.text,
                            id: widget.isUpdatePage ? widget.posts!.id : null);
                        if (widget.isUpdatePage) {
                          BlocProvider.of<AddDeleteUpdatePostBloc>(context)
                              .add(UpdatePostEvent(posts: post));
                        } else {
                          BlocProvider.of<AddDeleteUpdatePostBloc>(context)
                              .add(AddPostEvent(posts: post));
                        }
                      }
                    },
                    child: Text(widget.isUpdatePage == true ? 'update' : 'add'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
