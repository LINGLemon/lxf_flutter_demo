import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ChangeLanguageEvent {}

class ChangeLanguageToZh extends ChangeLanguageEvent {}

class ChangeLanguageToEn extends ChangeLanguageEvent {}

class LanguageBloc extends Bloc<ChangeLanguageEvent, String> {
  LanguageBloc() : super('zh') {
    on<ChangeLanguageToZh>((event, emit) => emit('zh'));
    on<ChangeLanguageToEn>((event, emit) => emit('en'));
  }
}
