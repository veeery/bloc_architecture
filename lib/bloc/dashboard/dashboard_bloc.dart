import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required this.indexBottomPage}) : super(DashboardInitial());

  int indexBottomPage;

  void switchPages({required int index}) {
    indexBottomPage = index;
  }

}
