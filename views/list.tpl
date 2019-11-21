<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
      <title>英単語暗記アプリ</title>
  </head>
  <body>
    <h2>単語の一覧表示</h2>
    <ul>
      <!-- TODO: 以下の四か所の????を適切に埋める -->
      % for row in rows:
      <li><a href="meaning/{{row[0]}}">{{row[0]}}</a></li>
      % end
    </ul>
    <a href="/">トップページに戻る</a>
  </body>
</html>
