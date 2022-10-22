import 'package:bloc_architecture/bloc/user/user_bloc.dart';
import 'package:bloc_architecture/constant/app_colors.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/widgets/app_empty.dart';
import 'package:bloc_architecture/widgets/app_profile_own_card.dart';
import 'package:bloc_architecture/widgets/base_widget.dart';
import 'package:bloc_architecture/widgets/loading/loading_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
        onRefresh: () async {
          context.read<UserBloc>().add(GetProfile(id: "2"));
        },
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is LoadingUserState) {
                return const LoadingCenter();
              } else if (state is ErrorUserState) {
                return AppEmpty(
                    message: "Click Here To Refresh", onTap: () => context.read<UserBloc>().add(GetProfile(id: "2")));
              } else if (state is LoadUserState) {
                User user = state.user;
                return AppProfileOwnCard(
                  colors: AppColor.primaryColor,
                  user: user,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ]);
  }
}
