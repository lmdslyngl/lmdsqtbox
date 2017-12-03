
# -*- coding: utf-8 -*-

"""
lmdsqtbox - 自分だけの質問箱
"""

import cgi
import json
import bottle
from google.appengine.ext import ndb
import qtdb

def auth(username, password):
    """ 認証チェック """
    with open("auth.json", "r") as f:
        auth_data = json.loads(f.read())
    return auth_data["user"] == username and auth_data["passwd"] == password

@bottle.route("/")
def root():
    """ ルートページ """
    return bottle.template("post_qt")

@bottle.route("/succeeded")
def succeeded():
    """ 投稿成功ページ """
    return bottle.template("succeeded")

@bottle.route("/qt/<qt_key>")
def view_qt(qt_key):
    """ keyを指定して質問を表示する """
    qt_model = ndb.Key(urlsafe=qt_key).get()
    content = qt_model.content
    content = content.replace("\n", "<br>")
    return bottle.template("view_qt", qt_content=content)

@bottle.route("/qt-list")
@bottle.auth_basic(auth)
def view_qt_list():
    """ 質問リストを表示 """
    return bottle.template("list_qt")

@bottle.route("/api/post-qt", method="POST")
def api_post_qt():
    """ 質問を投稿する """
    qt_data = json.loads(
        bottle.request.body.read().decode("utf-8"))
    
    content = qt_data["content"]
    content = cgi.escape(content, quote=True)
    
    qt_model = qtdb.Question(content=content)
    qt_model.put()
    
    return "SUCCEEDED"
    

@bottle.route("/api/delete-qt", method="DELETE")
@bottle.auth_basic(auth)
def api_delete_qt():
    """ 質問を削除する """
    delete_key = bottle.request.query.key
    ndb.Key(urlsafe=delete_key).delete()
    return "SUCCEEDED"

@bottle.route("/api/list-qt")
@bottle.auth_basic(auth)
def api_list_qt():
    """ 質問一覧を取得する """
    qt_iter = qtdb.Question.query_questions().iter()
    qt_list = [qt.to_dict() for qt in qt_iter]
    return json.dumps(qt_list)

@bottle.route("/api/get-qt")
@bottle.auth_basic(auth)
def api_get_qt():
    """ 質問を取得する """
    qt_key = bottle.request.query.key
    qt_model = ndb.Key(urlsafe=qt_key).get()
    return json.dumps(qt_model.to_dict())

bottle.debug(True)
app = bottle.default_app()
