<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
      <title>英単語暗記アプリ</title>
  </head>
  <body>
    <h2>単語 {{word}} の意味</h2>
    <div>
      単語: {{word}}
    </div>
    <div>
      意味: {{data}}
    </div>
    <form action="delete" method="post">
      <input type="hidden" name="word" value="{{word}}">
      <input type="submit" value="削除">
    </form>
    <a href="/">トップページに戻る</a>
  </body>
</html>