import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/features/auth/data/models/auth_model.dart';
import 'package:swifit_cart/features/profile/data/repo/profile_repo_impl.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  static ProfileCubit get(context)=>BlocProvider.of<ProfileCubit>(context);
  final ProfileRepoImpl profileRepo;
  AuthModel? accountData;




}
