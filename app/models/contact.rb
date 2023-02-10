class Contact < ApplicationRecord
  belongs_to :kind
    def author
        "Mateus Gomes"
    end

    def kind_description 
        self.kind.description
    end
    
      def as_json(options={})
        super(root: true, methods: [:kind_description, :author ])
      end
end
