class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token
  
  validates :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :phone_number, :token, presence: { message: 'を入力してください' }

  validates :postal_code,   format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフン（-）を含めて入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' } # 💡テストの期待値に合わせて「10桁以上11桁以内の半角数値」に文言を修正しました

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