
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>らむだの質問箱</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>

  <body>
    
    <div class="container">
      <div class="header">
        <h1>
          <span class="glyphicon glyphicon-question-sign"></span>
          lmdsqtbox
        </h1>
      </div>
      
      <table class="table table-striped">
        <thead>
          <tr>
            <th>date</th>
            <th>content</th>
            <th></th>
          </tr>
        </thead>
        <tbody id="qt-table-body"></tbody>
      </table>
      
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="/static/list_qt.js"></script>
    <script src="/static/api.js"></script>
    <script>
      var qtlist = new QuestionListMain();
    </script>
  </body>
</html>
