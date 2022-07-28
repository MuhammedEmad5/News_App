abstract class NewsStates{}

class InitialState extends NewsStates{}
class ChangeNavBarState extends NewsStates{}
class GetBusinessLoadingState extends NewsStates{}
class GetBusinessSuccessState extends NewsStates{}
class GetBusinessErrorState extends NewsStates{
  final String error;
  GetBusinessErrorState(this.error);
}
class GetSportLoadingState extends NewsStates{}
class GetSportSuccessState extends NewsStates{}
class GetSportErrorState extends NewsStates{
  final String error;
  GetSportErrorState(this.error);
}
class GetScienceLoadingState extends NewsStates{}
class GetScienceSuccessState extends NewsStates{}
class GetScienceErrorState extends NewsStates{
  final String error;
  GetScienceErrorState(this.error);
}
class ChangeModeState extends NewsStates{}
class SearchLoadingState extends NewsStates{}
class SearchSuccessState extends NewsStates{}
class SearchErrorState extends NewsStates{
  final String error;
  SearchErrorState(this.error);
}