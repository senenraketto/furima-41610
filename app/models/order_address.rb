class OrderAddress

  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,   format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフン（-）を含めて入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :address
    validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の半角数字で入力してください" }
  end

  # ④ 各テーブルにデータを保存する処理を書く
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      addresses: address,
      building: building,
      phone_number: phone_number,
      order_id: order.id 
    )
  end
end