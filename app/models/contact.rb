class Contact < ApplicationRecord

  #Associations
  belongs_to :kind
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address
  
  # def author
  #   "Gabriel Carlos"
  # end
  
  # def kind_description
  #   self.kind.description
  # end

  def as_json(options={})
   h = super(options)
   h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
   h
  end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description],
  #     include: {kind: {only: :description}}
  #     )
  # end

  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end
end
