import 'package:bloc/bloc.dart';

class DashboardPageIndexCubit extends Cubit<int> {
  DashboardPageIndexCubit() : super(0);

  void update(int index) => emit(index);
}
