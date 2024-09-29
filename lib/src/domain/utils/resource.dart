//esta clase nos permite manejar nuestros estados durante la petición
abstract class Resource<T> {
  Resource();
}

class Init extends Resource{
  Init();
}

class Loading extends Resource{
  Loading();
}

class Success<T> extends Resource<T> {
  final T data;
  Success(this.data);
}

class Error<T> extends Resource<T> {
  final String error;
  Error(this.error);
}