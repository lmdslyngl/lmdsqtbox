
# -*- coding: utf-8 -*-

from google.appengine.ext import ndb

class Question(ndb.Model):
    """ 質問を表現するクラス """
    content = ndb.StringProperty()
    date = ndb.DateTimeProperty(auto_now_add=True)
    
    @classmethod
    def query_questions(cls):
        """ 質問一覧を取得 """
        return cls.query().order(-cls.date)
    
    def to_dict(self):
        """ dict表現へ変換 """
        return {
            "key": self.key.urlsafe(),
            "date": self.date.strftime("%Y-%m-%d %H:%M:%S"),
            "content": self.content
        }
    
