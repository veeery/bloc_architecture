import 'package:bloc_architecture/bloc/comic/comic_bloc.dart';
import 'package:bloc_architecture/model/comic.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:bloc_architecture/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComicView extends StatelessWidget {
  final ApiRepository api = ApiRepository();

  ComicView

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicBloc>(
      create: (context) => ComicBloc(api: api)..fetchAllComic(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ComicBloc, ComicState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Error) {
                return Text(state.message);
              } else if (state is Loaded) {
                final comicList = state.comicList;

                return comicList.isEmpty
                    ? const Text('Comic Empty')
                    : ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(height: 0.02.sh),
                        itemCount: comicList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Comic comic = comicList[index];

                          return Container(
                            child: Column(
                              children: [
                                AppNetworkImage(imageUrl: comic.imageUrl.toString()),
                                Text(comic.title.toString())
                              ],
                            )
                          );

                        },


                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
