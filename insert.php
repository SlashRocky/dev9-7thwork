<?php 
  //フォームのデータ受け取り
  $title = $_POST['title'];
  $detail = $_POST['detail'];


  //DB定義
  const DB = "";
  const DB_ID = "root";
  const DB_PW = "root";
  const DB_NAME = "";

  //PDOでデータベース接続
  try {
    $pdo = new PDO('mysql:host=localhost;dbname=gsblog_db;charset=utf8',DB_ID,'');
  }
  //接続できなかった時
  catch (PDOException $e) {
    exit( 'DbConnectError:' . $e->getMessage());
  }

  // 実行したいSQL文
  //VALUESの中に直接テキストなどは通常書き込まない
  $sql = "INSERT INTO gsblog_table (id, title, detail, time) VALUES (NULL, :title, :detail ,sysdate())";

  //MySQLで実行したいSQLセット。プリペアーステートメントで後から値は入れる
  $stmt = $pdo->prepare($sql);
  $stmt->bindValue(':title',$title,PDO::PARAM_STR);
  $stmt->bindValue(':detail',$detail,PDO::PARAM_STR);

  //実際に実行
  $flag = $stmt->execute();

  //実行完了した場合はentry.phpにリダイレクト
  //失敗した場合はエラーメッセージ表示
  if($flag==false){
    $error = $stmt->errorInfo();
    exit("ErrorQuery:".$error[2]);
  }
  else{
    header('Location: entry.php');
    exit();
  }
?>