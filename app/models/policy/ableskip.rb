#ごみを出せるかどうかを判定するメソッドを作りたい
#クラスメソッド

module Policy
end

class Policy::Ableskip
  def self.check(person_a,person_b,date_c)
    #ログインしているユーザーが当番本人か
    b1=(person_a==person_b)
    #現在の日付がごみだし日より前か
    b2=(Date.today< date_c)
    #現在の日付がごみだし日当日なら、時間は18時より前か
    b3=(Date.today == date_c)
    b4=('18:00' > Time.zone.now.to_s(:time))

    if b1 &&( b2 || (b3 && b4) )
      true
    else
      false
    end
  end
end
