class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String appKey = "82b099fcb8029f84ac133b3ca13249c4";
  static const String nowPlaying="$baseUrl/movie/now_playing";
  static const String popular ="$baseUrl/movie/upcoming";
  static const String topRated ="$baseUrl/movie/top_rated";
  static const Map<String,String> headers = {
    "accept": "application/json",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MmIwOTlmY2I4MDI5Zjg0YWMxMzNiM2NhMTMyNDljNCIsInN1YiI6IjY1ZDNhNmIxN2Q1ZGI1MDE4NjM1Y2Q5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TlDCAULohVZnZGfwHI9HpRgokGzaccIqgn6NIwWWhoc"
  };
  static String imageUrl(String path)=> 'https://image.tmdb.org/t/p/w500$path';
}
