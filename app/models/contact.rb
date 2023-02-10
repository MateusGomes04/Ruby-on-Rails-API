class Contact < ApplicationRecord
  belongs_to :kind, optional: true 
  has_many :phones


  accepts_nested_attributes_for :phones 

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

  # def birthdate_br
    #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

  # def to_br
  #   {
  #     name: self.name, 
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }   
  # end
    # def author
    #     "Mateus Gomes"
    # end

    # def kind_description 
    #     self.kind.description
    # end
    
    #   def as_json(options={})
    #     super(root: true, methods: [:kind_description, :author ])
    #   end
end
