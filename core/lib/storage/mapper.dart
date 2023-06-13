abstract class Mapper<T, Y> {
  List<T> fromRemoteToEntity(List<Y> remoteList);

  List<Y> fromEntityToRemote(List<T> localList);

  T fromRemoteItemToEntityItem(Y remoteItem);

  Y fromEntityItemToRemoteItem(T localItem);
}
