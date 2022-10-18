class DataReturnWithPagination<T> {

  int currentIndex;
  int totalPages;
  int limit;
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