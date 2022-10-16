import 'package:bloc_architecture/bloc/user/user_bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:bloc_architecture/widgets/app_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {

  final Api api = Api();

  @override
  Widget build(BuildContext context) {

    
    // MultiBLocProvider mean, u can cast BlocProvider more than 1 at the same time for loaded Page
    // BlocProvider mean, u only can Cast 1 BloC to initiate or Loaded Page
    return BlocProvider<UserBloc>(
      //                            This Use for initiate API & BloC
      // providers: [
      //   BlocProvider<UserBloc>(
      //     create: (context) => UserBloc(api: api)..fetchAllUser(),
      //   )
      // ],
      // create: (context) => UserBloc(api: RepositoryProvider.of(context))..add(LoadEvent()),
      create: (context) => UserBloc(api: api)..add(GetAllUser()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorState) {
                return Text(state.message);
              } else if (state is LoadState) {
                final userList = state.userList;

                return userList.isEmpty
                    ? const Text('User Empty')
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 0.02.sh);
                        },
                        shrinkWrap: true,
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          User user = userList[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                AppProfileCard(user: user),
                              ],
                            ),
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
