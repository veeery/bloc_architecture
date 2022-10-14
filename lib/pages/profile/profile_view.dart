import 'package:bloc_architecture/bloc/user/user_bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/service/network/api_repository.dart';
import 'package:bloc_architecture/widgets/app_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileView extends StatelessWidget {

  final Api api = Api();

  ProfileView

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(api: api)..fetchAllUser(),
        )
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child:  CircularProgressIndicator());
              } else if (state is Error) {
                return Text(state.message);
              } else if (state is Loaded) {
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
                            child: AppProfileCard(user: user),
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
