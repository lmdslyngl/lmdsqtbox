
# lmdsqtbox
自分専用の質問箱

## 設置方法
1. 管理者パスワードの設定  
    ```auth_template.json```のuserとpasswdを設定し，
    ```auth.json```にrenameする
2. Google App Engineにdeploy

## URLとか
### 人間用のページ
* /
    * 質問投稿ページ
* /succeeded
    * 質問投稿成功ページ
    * 投稿に成功したときにリダイレクトするためのページ
* /qt/{qt_key}
    * 質問表示ページ
    * 各質問を個別に表示するページ
* /qt-list (パスワード必須)
    * 質問リスト

### API
* POST /api/post-qt
    * 質問を投稿する
    * ```{"content": "{質問の内容}"}```な形式のjsonをPOSTする
* DELETE /api/delete-qt?key={qt_key} (パスワード必須)
    * 質問を削除する
    * パラメータとしてqt_keyに質問のキーを渡す
* GET /api/list-qt (パスワード必須)
    * 質問の一覧を取得する
    * jsonで返ってくる
* GET /api/get-qt?key={qt_key}
    * 質問を取得する
    * パラメータとしてqt_keyに質問のキーを渡す
    * jsonで返ってくる
