
// APIを集めたクラス
class API {
  
  // 質問一覧を取得
  static getQuestionsList() {
    return new Promise(function(resolve, reject) {
      var xhr = new XMLHttpRequest();
      xhr.addEventListener("loadend", function(evt) {
        if( xhr.status == 200 ) {
          resolve(xhr.responseText, evt);
        } else {
          reject(xhr.responseText, evt);
        }
      });
      
      xhr.open("GET", "/api/list-qt", true);
      xhr.send(null);
      
    });
  }
  
  // 質問を投稿
  static postQuestion(content) {
    return new Promise(function(resolve, reject) {
      var xhr = new XMLHttpRequest();
      xhr.addEventListener("loadend", function(evt) {
        if( xhr.status == 200 ) {
          resolve(xhr.responseText, evt);
        } else {
          reject(xhr.responseText, evt);
        }
      });
      
      var data = { "content": content };
      xhr.open("POST", "/api/post-qt", true);
      xhr.send(JSON.stringify(data));
      
    });
  }
  
  // 質問を削除
  static deleteQuestion(key) {
    return new Promise(function(resolve, reject) {
      var xhr = new XMLHttpRequest();
      xhr.addEventListener("loadend", function(evt) {
        if( xhr.status == 200 ) {
          resolve(xhr.responseText, evt);
        } else {
          reject(xhr.responseText, evt);
        }
      });
      
      xhr.open("DELETE", "/api/delete-qt?key=" + key, true);
      xhr.send(null);
      
    });
  }
  
}
