import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/login_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
}
