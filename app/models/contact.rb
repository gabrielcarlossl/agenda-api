class Contact < ApplicationRecord
  def author
    "Gabriel Carlos"
  end
  def as_json(options={})
    super(methods: :author, root: true)
  end
end
