abstract class FavoriteEvent {
  final String currency;

  FavoriteEvent(this.currency);
}

class AddToFavoriteEvent extends FavoriteEvent {
  AddToFavoriteEvent(String currency) : super(currency);
}

class RemoveFromFavoriteEvent extends FavoriteEvent {
  RemoveFromFavoriteEvent(String currency) : super(currency);
}
