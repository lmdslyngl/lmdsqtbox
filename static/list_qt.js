
// 質問一覧の表
class QuestionTable {
  constructor(tableElem) {
    this.tableElem = tableElem;
    this.qtList = [];
    this.deleteBtnCallback = function(key) { }
  }
  
  // 質問を追加する
  add(qt) {
    this.qtList.push(qt);
  }
  
  // 質問を削除する
  remove(key) {
    for( var i = 0; i < this.qtList.length; i++ ) {
      var qt = this.qtList[i];
      if( qt["key"] === key ) {
        this.qtList.splice(i, 1);
        break;
      }
    }
  }
  
  // 表を描画する
  render() {
    this._clearTable();
    for( var i = 0; i < this.qtList.length; i++ ) {
      var qt = this.qtList[i];
      var rowElem = this._createQestionRow(qt);
      this.tableElem.appendChild(rowElem);
    }
  }
  
  // 表の行を全て削除
  _clearTable() {
    while( this.tableElem.firstChild != null ) {
      this.tableElem.removeChild(this.tableElem.firstChild);
    }
  }
  
  // 質問の行を作成する
  _createQestionRow(qt) {
    var self = this;
    
    var key = qt["key"];
    var date = qt["date"];
    var content = qt["content"];
    
    // 改行を<br>タグにする
    content = content.replace(/\n/g, "<br>");
    
    var template = 
        `<td>${date}</td>`
      + `<td>${content}</td>`
      + `<td style="text-align: right">`
      +   `<a href="/qt/${key}" class="btn btn-xs btn-default">open</a>`
      +   `<button `
      +     `class="btn btn-xs btn-danger" `
      +     `data-key="${key}">`
      +       `delete`
      +   `</button>`
      + `</td>`;
    
    // element作成
    var rowElem = document.createElement("tr");
    rowElem.innerHTML = template;
    
    // 削除ボタンのコールバック関数登録
    var deleteBtn = rowElem.getElementsByTagName("button")[0];
    deleteBtn.addEventListener("click", function(evt) {
      self._deleteBtnCallbackInternal(evt);
    });
    
    return rowElem;
    
  }
  
  // deleteボタンコールバック
  _deleteBtnCallbackInternal(evt) {
    var key = evt.target.dataset.key;
    this.deleteBtnCallback(key);
  }
  
}

// 質問リストのメイン
class QuestionListMain {
  constructor() {
    var self = this;
    this._createQuestionTable();
    this.table.deleteBtnCallback = function(key) {
      self._deleteBtnCallback(key);
    };
  }
  
  // 質問リストを作成
  _createQuestionTable() {
    var self = this;
    var tableElem = document.getElementById("qt-table-body");
    this.table = new QuestionTable(tableElem);
    API.getQuestionsList()
      .then(function(resp, evt) {
        var qtList = JSON.parse(resp);
        for( var i = 0; i < qtList.length; i++ ) {
          self.table.add(qtList[i]);
        }
        self.table.render();
      });
  }
  
  // 削除ボタンコールバック
  _deleteBtnCallback(key) {
    var self = this;
    API.deleteQuestion(key)
      .then(function(resp, evt) {
        self.table.remove(key);
        self.table.render();
      });
  }
  
}
