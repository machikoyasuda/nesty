class Period
  include Mongoid::Document

  embedded_in :design
  embeds_many :expectations

  field :name, type: String
  field :activity, type: String
  field :starts_at, type: String
  field :ends_at, type: String

  validates_presence_of :name
end
