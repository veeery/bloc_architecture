import 'package:bloc_architecture/bloc/user/user_bloc.dart';
import 'package:bloc_architecture/model/user.dart';
import 'package:bloc_architecture/widgets/app_profile_card.dart';
import 'package:bloc_architecture/widgets/base_widget.dart';
import 'package:bloc_architecture/widgets/loading/loading_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
        onRefresh: () async {
          context.read<UserBloc>().add(GetAllUser());
        },
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const LoadingCenter();
              } else if (state is ErrorState) {
                return SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message),
                      GestureDetector(
                        onTap: () => context.read<UserBloc>().add(GetAllUser()),
                        child: Text("Klik Here to refresh"),
                      )
                    ],
                  ),
                );
              } else if (state is LoadState) {
                final userList = state.userList;

                if (userList.isEmpty) {
                  return SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("EMPTY"),
                        GestureDetector(
                          onTap: () => context.read<UserBloc>().add(GetAllUser()),
                          child: Text("Klik Here to refresh"),
                        )
                      ],
                    ),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 0.02.sh);
                    },
                    shrinkWrap: true,
                    itemCount: userList.length,
                    physics: const NeverScrollableScrollPhysics(),
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
              }
              return const SizedBox.shrink();
            },
          )
        ]);
  }
}
