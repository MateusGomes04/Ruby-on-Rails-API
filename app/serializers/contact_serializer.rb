class ContactSerializer < ActiveModel::Serializer

  belongs_to :kind do 
    link(:related) { contact_kind_url(object.id) }
  end
  has_many :phones do
    link(:related) { contact_kind_url(object.id) }
  end
  has_one :address

  # link(:self) { contact_url(object.id) }
  # link(:kinds) { kind_url(object.id) }

  # def author
  #   "Jackson Pires"
  # end

  meta do
    { author: "Jackson Pires" }
  end
    
  attributes :id, :name, :email, :birthdate

  def attributes(*args)
    h = super(*args)
    #pt-br --> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
