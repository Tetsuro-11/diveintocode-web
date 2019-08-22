// $(document).ready(function(){ ~ });
// HTMLの読み込み終了後、function内の処理を行う。

// $(‘#btn-evaluation’).click(function() { ~ });
// ボタンを押した後(クリックイベント)function内の処理を実行する。最近はon()メソッドが使われている

// $(‘#national_language, #english, #mathematics, #science, #society’).change(function() { ~ });
// 値が変更されたら、関数内の処理を実行する。

// $(‘#national_language’).val()
// 指定タグのvalue値を取得したり変更することができる。

// Number()
// 数値に変換

// $(“#sum_indicate”).text(sum)
// 指定した要素に対して、引数内のテキストを設定する。

// .appendの記述の意味
// 対象要素に対して、追加したい要素を追加する。

$(document).ready(function(){
  function score_indicate(){
    // このような記述をすることで、subject_pointsという変数の中に
    // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]という配列を作成できる。
    let subject_points = [Number($('#national_language').val()),
                      Number($('#english').val()),
                      Number($('#mathematics').val()),
                      Number($('#science').val()),
                      Number($('#society').val())
                      ];

    // さらにこのような記述をすることで、「合計点：」となっている右の部分に合計点が出力される
      
    let sum = subject_points.reduce(function (accumulator, currentValue, currentIndex, subject_points) {
    return accumulator + currentValue;
    });
    
    $("#sum_indicate").text(sum);
    
    let mean = sum / 5;
    $("#avarage_indicate").text(mean);
    
    return mean
  }

  function get_achievement(mean=score_indicate()){
    if (mean>=80){
      $("#evaluation").text("A");
      return "A";
    } else if(mean>= 60){
      $("#evaluation").text("B");
      return "B";
    } else if(mean>= 40){
      $("#evaluation").text("C");
      return "C";
    } else{
      $("#evaluation").text('D');
      return "D";
    }
  }
  

  function get_pass_or_failure(){
    let subject_points = [Number($('#national_language').val()),
                      Number($('#english').val()),
                      Number($('#mathematics').val()),
                      Number($('#science').val()),
                      Number($('#society').val())
                      ];
                      
    if (subject_points.every(function(element, index, subject_points){
    return (element >= 60);})){
      $("#judge").text("合格");
      return "合格";
    }else{
      $("#judge").text("不合格");
      return "不合格";
    }
  }

  function judgement(){
    // ここに、「最終ジャッジ」のボタンを押したら「あなたの成績はAです。合格です」といった内容を出力する処理を書き込む
    // 下記の記述をすることで、「最終ジャッジ」のボタンを押すと「あなたの成績は（ここに「ランク」の値を入れる）です。（ここに「判定」の値を入れる）です」という文字の入った水色のフキダシが出力される処理が実装される。
    
    $('#declaration').append('<label id="alert-indicate" class="alert alert-info">あなたの成績は' + get_achievement() + 'です。'+get_pass_or_failure()+'です</label>');
  }

  $('#national_language, #english, #mathematics, #science, #society').change(function() {
    score_indicate();
  });

  $('#btn-evaluation').click(function() {
    get_achievement();
  });

  $('#btn-judge').click(function() {
    get_pass_or_failure();
  });

  $('#btn-declaration').click(function() {
    $('#declaration').empty()
    judgement();
    
  });
});
// ここに書かれているjsの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
// 例ではJavaScriptとJqueryの両方の記述を使用しているが、どちらかに統一しても構わない