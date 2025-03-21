// Go Router
// Bloc
Login
Register

    onChange Event
        Form Validation
        Store Form values in models
    OnSubmit Event
        print stored form values

Login
    BLoc:
    - LoginBloc - Defin events Function 
        InitializeLoginBloc
        OnChangeEvent
        OnSubmitEvent

    - LoginEvent
        InitializeLoginBloc
        OnChangeEvent
        OnSubmitEvent

    - LoginState
        enum Status {loading, chaning, changed, isloading, success, error}
        - status
        - formValues
        - message

form field
- username
- password

OnSubmit Event:
check form is valid:
if valid:
Map<String, dynamic> formValues = {
'username': username,
'password': password,
}
Authenticate user using API = formValues
if success:
Navigate to Home Screen
else:
Show error message
