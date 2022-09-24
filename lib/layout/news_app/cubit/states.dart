abstract class NewsStates{}
class NewsInitialStates extends NewsStates{}
class NewsBottomNavBar extends NewsStates{}
class NewGetBusinessSuccessesState extends NewsStates{}
class BusinessLoadingState extends NewsStates{}
class NewGetBusinessErrorState extends NewsStates{}
class NewGetSportsSuccessesState extends NewsStates{}
class SportsLoadingState extends NewsStates{}
class NewGetSportsErrorState extends NewsStates{}
class NewGetScienceSuccessesState extends NewsStates{}
class ScienceLoadingState extends NewsStates{}
class NewGetScienceErrorState extends NewsStates{}
class NewsChangeMode extends NewsStates{}
class NewGetSearchSuccessesState extends NewsStates{}
class SearchLoadingState extends NewsStates{}
class NewGetSearchErrorState extends NewsStates{
  late final String error;
  NewGetSearchErrorState(this.error);

}
