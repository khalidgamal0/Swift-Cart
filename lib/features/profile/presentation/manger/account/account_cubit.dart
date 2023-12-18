import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/core/widgets/toast.dart';
import '../../../../../constant.dart';
import '../../../../auth/data/models/auth_model.dart';
import '../../../data/repo/profile_repo_impl.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.profileRepo) : super(AccountInitial());

  static AccountCubit get(context) => BlocProvider.of<AccountCubit>(context);

  final ProfileRepoImpl profileRepo;
  AuthModel? accountData;

  fetchAccountData() async {
    emit(AccountLoadingState());
    var response = await profileRepo.fetchAccountData();
    response.fold((l) => {emit(GetAccountErrorState(l.toString()))},
            (r) => {accountData = r, emit(GetAccountSuccessState(r))});
  }

  updateAccountData(String name,
      String email,
      String phone,) async {
    emit(AccountLoadingState());
    var result = await profileRepo.updateAccountData(
      name,
      email,
      phone,
    );
    result.fold((l) {
      emit(UpdateAccountErrorState(l.toString()));
      showToast(message: l.toString(), state: ToastStates.error);
    }, (r) {
      fetchAccountData();
      emit(UpdateAccountSuccessState(r));
      showToast(
          message: r.message!,
          state: r.data == null
              ? ToastStates.warning
              : ToastStates.success);
    });
  }

  logOutAccount() async {
    emit(AccountLoadingState());
    var result = await profileRepo.logOutAccount(token!);
    result.fold((l) {
      showToast(message: l.toString(), state: ToastStates.error);
      emit(LogOutErrorState());
    },
            (r) {
                  showToast(message: 'LogOut Successfully', state: ToastStates.success);
              emit(LogOutSuccessState());
            });
  }
}
