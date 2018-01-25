<?php 
  //DB定義
  const DB = "";
  const DB_ID = "root";
  const DB_PW = "";
  const DB_NAME = "";

  //PDOでデータベース接続
  try {
    $pdo = new PDO('mysql:host=localhost;dbname=gs_db;charset=utf8',DB_ID,'');
  }
  //接続できなかった時
  catch (PDOException $e) {
    exit( 'DbConnectError:' . $e->getMessage());
  }

  //実行したいSQL文を変数$aqlに格納
  $sql = 'SELECT * FROM gs_an_table';

  //実行したいSQL文をセット
  $stmt = $pdo -> prepare($sql);

  //実際に実行　→　それを変数$flagに格納
  $flag = $stmt -> execute();

  //失敗　→　エラーメッセージ表示
  if($flag == false){
    $error = $stmt -> errorInfo();
    exit("ErrorQuery:".$error[2]);
  }

  //成功　→　以下のDOMを実行
  else{
?>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Book Memo</title>
    <link rel="stylesheet" href="css/icomoon/icomoon_style.css">
    <link rel="stylesheet" href="css/style2.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <script src="js/book.js"></script>
  </head>
  <body>
    <main class="wrap indexMain">
      <section class="memoList">
        <h2>追加された書籍</h2>
        <ul>
          <?php
            while( $result = $stmt->fetch(PDO::FETCH_ASSOC) ){
          ?>
            <li>
              <div class="list_t">
                <h3 class="title"><?php echo $result['title']; ?></h3>
                <p class="text"><?php echo $result['comment']; ?></p>
              </div>
              <div class="list_img">
                <img src="<?php echo $result['url']; ?>">
              </div>
            </li>
          <?php
            }
          ?>
        </ul>
      </section>
    </main>
  </body>
</html>

<?php } ?>