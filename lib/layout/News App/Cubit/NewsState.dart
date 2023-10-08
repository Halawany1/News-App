abstract class NewsState{}

class NewsInitialState extends NewsState{}

class NewsChangeNavBarState extends NewsState{}

class NewsGetBusinessSuccessState extends NewsState{}

class ChangeSelectItemState extends NewsState{}

class ChangePlatformState extends NewsState{}

class NewsGetBusinessErrorState extends NewsState{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsState{}

class NewsGetSportsSuccessState extends NewsState{}

class NewsGetSportsErrorState extends NewsState{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsState{}

class NewsGetScienceSuccessState extends NewsState{}

class NewsGetScienceErrorState extends NewsState{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState{}

class NewsChangeModeState extends NewsState{}

class NewsGetSearchLoadingState extends NewsState{}

class NewsGetSearchSuccessState extends NewsState{}

class NewsGetSearchErrorState extends NewsState{
  final String error;
  NewsGetSearchErrorState(this.error);
}

