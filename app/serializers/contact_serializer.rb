class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :phones, :address, :kind
  #Associations
  belongs_to :kind
  has_many :phones
  has_one :address
  
  # Utiliza do mesmo jeito que era usado no model, mas substitui  'as_json' por 'attributes' e 'options' por '*args' e 'self' por 'object'
#   def attributes(*args)
#   h = super
#   h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
#   h
#  end
  def attributes(*args)
  h = super
  h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  h
 end
end

