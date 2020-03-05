class Shop_item < Item
  validates :value, :numericality => { greater_than: 0, message: "doit être supérieur à 0€" }
  validates :ph_one, presence: { message: "de votre carte doit être ajoutée"}
end
