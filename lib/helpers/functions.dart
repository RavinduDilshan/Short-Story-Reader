String apiPath = 'http://10.0.2.2:3000/';

Uri? buildUri(String path) => Uri.tryParse(apiPath + path);
