part of 'drugs_cubit.dart';

@immutable
sealed class DrugsState {}

final class DrugsInitial extends DrugsState {}
final class DrugsLoading extends DrugsState {}
final class DrugsSuccess extends DrugsState {}
final class DrugsFailure extends DrugsState 
{ 
  final String errorMessage;
  DrugsFailure({required this.errorMessage});
}