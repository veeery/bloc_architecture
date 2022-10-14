part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class SwitchPage extends DashboardState {

  int indexNavigationBar = 0;

  SwitchPage({required this.indexNavigationBar});

  @override
  List<Object> get props => [indexNavigationBar];

  
}