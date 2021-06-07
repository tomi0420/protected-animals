// Likeボタンクリック
$('.like-link').on('click', function() {
  let $btn = $(this);
  // Likeボタンがonクラス持っていたら
  if ($btn.hasClass('on')) {

    $btn.removeClass('on');

    // 白抜きアイコンに戻す
    $btn.children("i").attr('class', 'fas fa-star unlike-btn');

  } else {

    $btn.addClass('on');

    // ポイントは2つ！！
    // ①アイコンを変更する
    // far fa-heart（白抜きアイコン）
    // ⇒ fas fa-heart（背景色つきアイコン）
    // ②アニメーション+アイコン色変更用のheartクラスを付与する

    $btn.children("i").attr('class', 'far fa-star like-btn');

  }
});