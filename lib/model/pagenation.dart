class DataReturnWithPagination<T> {

  int currentIndex;
  int totalPages;
  int limit;
  // This Generic List<T> for return data from ApiRepository to BloC
  // T is a type data class
  List<T>? dataReturn;

  DataReturnWithPagination({
    required this.currentIndex,
    required this.totalPages,
    this.limit = 5,
    this.dataReturn
  });

  factory DataReturnWithPagination.fromJson(Map<String, dynamic> json) {
    return DataReturnWithPagination(
        currentIndex: json['page'],
        totalPages: json['total_pages'],
        limit: json['per_page']
    );
  }

  DataReturnWithPagination.clearData({
    this.currentIndex = 1,
    this.totalPages = 1,
    this.limit = 5
  });

  List<Object> get props => [currentIndex, totalPages, limit, dataReturn!];

}