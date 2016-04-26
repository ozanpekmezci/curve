class Order < ApplicationRecord
#  has_many :order_items
  before_create :set_order_status
  before_create :populate_guid

#  before_save :update_subtotal
  has_many :chats, as: :chatable, dependent: :destroy
  belongs_to :comment
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :comment_present
  before_save :finalize

  # def subtotal
  #   order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
   #end
 private
   def set_order_status
     self.order_status = "In Progress"
   end
   def populate_guid
     self.guid = SecureRandom.uuid()
   end
   def comment_present
     if comment.nil?
       errors.add(:product, "is not valid or is not active.")
     end
   end
   def finalize
    # self[:unit_price] = unit_price
     self[:total_price] = quantity * self[:unit_price]
   end

   def update_subtotal
     self[:subtotal_price] = subtotal
   end

end
