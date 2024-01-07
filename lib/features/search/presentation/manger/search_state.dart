part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {}
class SearchError extends SearchState {}
