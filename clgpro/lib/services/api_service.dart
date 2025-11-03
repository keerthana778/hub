// This is a dummy API service for now

class ApiService {
  Future<List<Map<String, dynamic>>> getPGsByCollegeId(String collegeId, dynamic pgList) async {
    await Future.delayed(const Duration(milliseconds: 500)); // simulate delay
    return pgList.where((pg) => pg['collegeId'] == collegeId).toList();
  }
}