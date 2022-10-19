import 'package:bloc_architecture/bloc/user/user_bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/widgets/app_profile_own_card.dart';
import 'package:bloc_architecture/widgets/base_widget.dart';
import 'package:bloc_architecture/widgets/loading/loading_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is LoadingUserState) {
              return const LoadingCenter();
            } else if (state is ErrorUserState) {
              return SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    GestureDetector(
                      onTap: () => context.read<UserBloc>().add(GetProfile(id: '1')),
                      child: Text("Klik Here to refresh"),
                    )
                  ],
                ),
              );
            } else if (state is LoadUserState) {
              User user = state.user;

              return AppProfileOwnCard(
                user: user,
              );

            }
            return const SizedBox.shrink();
          },
        )
      ]
    );
  }
}
