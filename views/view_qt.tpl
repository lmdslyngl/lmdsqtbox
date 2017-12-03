
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:site" content="@dn_lmds_gl" />
    <meta name="twitter:title" content="らむだの質問箱" />
    <meta name="twitter:description" content="{{qt_content}}" />
    <meta name="twitter:image" content="https://lmdsqtbox.appspot.com/static/twitter_card_icon.png" />
    
    <title>らむだの質問箱</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/index.css">
  </head>

  <body>
    
    <div class="container container-width">
      <div class="header">
        <h1>
          <span class="glyphicon glyphicon-question-sign"></span>
          lmdsqtbox
        </h1>
      </div>
      
      <div class="qt-box">
        <div class="panel panel-info">
          <div class="panel-heading">投稿された質問</div>
          <div class="panel-body">
            <p>{{!qt_content}}</p>
          </div>
        </div>
      </div>
      
      <div class="what">
        <div class="panel panel-info">
          <div class="panel-heading">これなに？</div>
          <div class="panel-body">
            <p>らむだの質問箱です。匿名でどなたでも質問を投稿できます。</p>
            <a href="/" class="btn btn-xs btn-primary">今すぐ質問してみる</a>
          </div>
        </div>
      </div>
      
      <div class="footer">
        <p>2017 らむだ (<a href="https://twitter.com/dn_lmds_gl">@dn_lmds_gl</a>) |
          <a href="https://github.com/lmdslyngl/lmdsqtbox">GitHub</a></p>
      </div>
      
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="/static/lmdsqtbox.js"></script>
    <script>
      // 投稿ボタンのコールバック関数を設定
      var postBtn = document.getElementById("qt-post-btn");
      postBtn.addEventListener("click", onPostQuestionBtn);
    </script>
  </body>
</html>
