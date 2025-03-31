import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_train/utils/helper/localization_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {

   
    on<OnFormValueChange>((event, emit) {
  
      final updatedValues = Map<String, String>.from(state.formValues)
        ..[event.field] = event.value;

     
      emit(state.copyWith(formValues: updatedValues));
    });

   
    on<OnRegisterEvent>((event, emit) async {
     
      emit(state.copyWith(status: RegisterStatus.loading));

      try {
        final prefs = await SharedPreferences.getInstance();

       
        await prefs.setString('username', event.registerModel.username);
        await prefs.setString('email', event.registerModel.email);
        await prefs.setString('mobile', event.registerModel.mobile);
        await prefs.setString('country', event.registerModel.country);
        await prefs.setString('city', event.registerModel.city);

      
        emit(state.copyWith(status: RegisterStatus.success, message: "Registration successful"));
      } catch (e) {
       
        emit(state.copyWith(status: RegisterStatus.failure, message: "Failed to register"));
      }
    });

    
  on<FetchCitiesForCountry>((event, emit) async {
  emit(state.copyWith(status: RegisterStatus.loading)); 
   try {
    
    await Future.delayed(const Duration(milliseconds: 500));

  
    String citiesKey = 'cities_${event.country}';
    String citiesString = LocalizationHelper.getString(citiesKey);

   
    List<String> citiesList = citiesString.split(',');

    
    emit(state.copyWith(status: RegisterStatus.success, cities: citiesList));
  } catch (e) {
    
    emit(state.copyWith(status: RegisterStatus.failure, message: "Failed to load cities"));
  }
});

  }
}
