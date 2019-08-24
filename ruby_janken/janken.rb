#① player = Player.newの記述の意味
#Playerクラスのインスタンスを生成して、playerに代入

#② 大文字のPlayerと小文字のplayerの違い
#Playerはクラスを示しているが、playerの方は生成されたオブジェクトを示している。

class Player
  def hand
      
      puts "\n☆ジャンケンゲーム☆"
      puts'0: グー'
      puts'1: チョキ'
      puts'2: パー'
      print'手を入力してください:'
      
      
      player_hand = gets
      if player_hand =~ /^[0-9]+$/
         player_hand = player_hand.to_i
         return player_hand
          
      else
          puts '0~2までの数字を入力してください！'
          hand()
          
      end
  end
end

class Enemy
  def hand
      enemy_hand = rand(3)
      return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる

    hand_set = {0=>"グー", 1=>"チョキ", 2=>"パー"}
    check_num = (player_hand - enemy_hand + 3)%3
      
    if check_num == 0
        printf("相手の手は%s!あいこなのでもう一回！\n",hand_set[enemy_hand])
        pon(Player.new.hand, Enemy.new.hand)
        
    elsif check_num == 1
        printf("相手の手は%s..あなたの負けです..\n", hand_set[enemy_hand])
        
    else check_num == 2
        printf("相手の手は%s!あなたの勝ちです!\n", hand_set[enemy_hand])
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
    
# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand,enemy.hand)