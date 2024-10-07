class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :phones, :address, :kind #, :author
  #Associations
  belongs_to :kind do
    link(:kind) {kind_url(object.kind.id)}
  end
  has_many :phones
  has_one :address

  link(:self) {contact_path(object.id)}
  link(:kind) {kind_url(object.kind.id)}

  # def author
  #   "Gabriel Carlos"
  # end

  meta do 
    { author: "Gabriel Carlos"}
  end
  
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

