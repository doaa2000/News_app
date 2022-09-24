import 'package:bloc/bloc.dart';

abstract class AppStates {}
class AppInitialStates extends AppStates{}
class AppChangeBottomNavBar extends AppStates{}
class AppCreateDatabaseState extends AppStates{}
class AppInsertDatabaseState extends AppStates{}
class AppGetDatabaseState extends AppStates{}
class AppUpdateDatabaseState extends AppStates{}
class AppDeleteDatabaseState extends AppStates{}
class AppChangeBottomSheetState extends AppStates{}
class ChangeAppMode extends AppStates{}