
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:site" content="@dn_lmds_gl" />
    <meta name="twitter:title" content="らむだの質問箱" />
    <meta name="twitter:description" content="らむだの質問箱です。匿名でどなたでも質問を投稿できます。返事は来るかも知れないし、来ないかも知れないし。" />
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
      
      <div class="what">
        <div class="panel panel-info">
          <div class="panel-heading">これなに？</div>
          <div class="panel-body">
            <p>らむだの質問箱です。匿名でどなたでも質問を投稿できます。<br>
            回答はTwitterで。<br>
            返事は来るかも知れないし、来ないかも知れないし。</p>
          </div>
        </div>
      </div>
      
      <div class="qt-box">
        <div class="panel panel-info">
          <div class="panel-heading">聞きたいことを書いてみましょう</div>
          <div class="panel-body">
            <textarea id="qt-text" class="form-control qt-box-text" rows="4"></textarea>
            <div class="text-center">
              <button id="qt-post-btn" class="btn btn-primary">聞いてみる</button>
            </div>
          </div>
        </div>
      </div>
      
      <div class="footer">
        <p>2017 らむだ (<a href="https://twitter.com/dn_lmds_gl">@dn_lmds_gl</a>)</p>
      </div>
      
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="/static/api.js"></script>
    <script>
      var postBtn = document.getElementById("qt-post-btn");
      postBtn.addEventListener("click", function(evt) {
        var qtTextElem = document.getElementById("qt-text");
        var qtContent = qtTextElem.value;
        
        if( qtContent.length <= 0 ) {
          return;
        }
        if( 500 < qtContent.length ) {
          window.alert("質問は500文字以内でお願いします");
          return;
        }
        
        API.postQuestion(qtContent)
          .then(function(resp, text) {
            location.href = "/succeeded";
          });
        
      });
    </script>
  </body>
</html>
