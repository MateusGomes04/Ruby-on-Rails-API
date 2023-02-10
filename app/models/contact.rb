class Contact < ApplicationRecord
    def author
        "Mateus Gomes"
    end
    
      def as_json(options={})
        super(methods: :author, root: true)
      end
end
