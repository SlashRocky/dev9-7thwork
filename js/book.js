$(function(){

  /* ----------------------------------------
  検索ボタンを押したら
  ---------------------------------------- */
  $('#search-btn').on('click',function(){
    
    //初期化
    $('.searchResult li, .searchResult .inner .notice').remove();
    
    //検索欄を空白にする
    $('.searchResult_keyword').text('');
    
    //検索ワードを変数keywordに格納
    var keyword = $('.searchBox_text_input').val();
    
    //ajax通信
    $.ajax({
      url:'https://www.googleapis.com/books/v1/volumes?',
      data:{
        q: keyword,
        country: 'JP'
      },
      type:'GET',
      dataType:'jsonp',
    })
		
    //成功した場合
    .done(function(data){

      console.log('success');
      //data確認
      console.log(data);

      //検索欄に何も入力がなかったら
      if(keyword == "" ){

        //data確認
        console.log(data);

        $('.searchResult').find('.inner').append(
            '<p class="notice">検索結果がありません。</p>'
        );
      }

      //検査欄に何かしらワードが入力されていたら
      else {

        //data確認
        console.log(data);

        $('.searchResult_keyword').text('『' + keyword + '』' +'の検索結果');

        for(var i =　0; i　<　10; i++){

          var BookId = data.items[i].id;
          var BookTitle = data.items[i].volumeInfo.title;
          var BookImg = data.items[i].volumeInfo.imageLinks.thumbnail;
          var BookDescript = data.items[i].volumeInfo.description;

          $('.searchResult').find('ul').append(
            '<li>' +
            '<h3 class="title">『'+ BookTitle + '』</h3>' +
            '<div class="list_body">' +
            '<div class="list_body_img"><img src="'+ BookImg +'"></div>' +
            '<div class="list_body_t">' +
            '<p class="text">' + BookDescript +'</p>' +
            '<button class="memoBtn" type="button" data-id="'+BookId+'" name="button"><span class="icon-pencil"></span>保存する</button>' +
            '</div></div></li>'
          );

        }

      }

    })

    //失敗した場合
    .fail(function(data){
        console.log('fail');
        //data確認
        console.log(data);
    });
		
  });
	
  /* ----------------------------------------
  保存ボタンを押したら
  ---------------------------------------- */
  $(document).on("click",".memoBtn",function(){

    console.log(this);
    console.log( $(this).data("id") );

    /* APIに接続　→　idで紐づく書籍情報を取得
    ----------------------------------------  */
    //保存したい書籍の「id」を変数BookIdに格納
    var BookId = $(this).data("id");

    //ajax通信
    $.ajax({
      url:'https://www.googleapis.com/books/v1/volumes/'+BookId,
      type:'POST',
      dataType:'jsonp',
    })

    //成功した場合
    .done(function(data){
      
      console.log('success');
      //data確認
      console.log(data);

      //書籍情報の詳細を変数に格納
      var BookTitle = data.volumeInfo.title;
      var BookImg = data.volumeInfo.imageLinks.thumbnail;
      var BookDescript = data.volumeInfo.description;

      //送信するデータを、変数postDataに{名前：値}のセットで記述
      var postData = {'id':BookId, 'title':BookTitle, 'url':BookImg, 'comment':BookDescript};
      console.log(postData);

      //AjaxでpostDataをinsert_data.phpにPOST送信
      $.ajax({
        type: "POST",
        url: "insert_data.php",
        data: postData,
      })
      
      //成功した場合
      .done(function(data, dataType) {

        console.log('success_insert');
        //postData確認
        console.log(postData);

      })
      //失敗した場合
      .fail(function(XMLHttpRequest, textStatus, errorThrown) {

        console.log('fail');
        //postData確認
        console.log(postData);

      });
    })

    //失敗した場合
    .fail(function(data){
      
      console.log('fail');
      //data確認
      console.log(data);
      
    });

    return false;

  });
	
});
