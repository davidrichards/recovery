class Location < ApplicationRecord

  def self.utah
    filename = "tmp/gz_2010_us_040_00_500k/gz_2010_us_040_00_500k.shp"
    border = nil
    RGeo::Shapefile::Reader.open(filename) do |file|
      file.each do |record|
        border = record.geometry if record["NAME"] == "Utah"
      end
    end
    utah = find_or_initialize_by(name: "Utah", abbreviation: "UT")
    utah.border = border
    utah
  end

  include Commentable
  include StateChangeable
  include Attributable
  include Reference
  include Versions

  belongs_to :parent, class_name: "Location", optional: true
  has_many :children, class_name: "Location", foreign_key: :parent_id

  before_create :assign_level, :assign_centroid

  aasm do
    state :active, initial: true
    state :retired
  
    event :retire do
      transitions from: :active, to: :retired do
        guard { state_change_for(:retire) }
      end
    end
  end
  
  def latitude_longitude
    assign_centroid
    @latitude_longitude ||= self.centroid&.coordinates
  end

  def longitude_latitude
    @longitude_latitude ||= latitude_longitude&.reverse
  end

  private

  def assign_level
    self.level ||= 0 if parent.nil?
    self.level ||= parent&.level.to_i + 1
  end

  def assign_centroid
    self.centroid ||= self.border.centroid if self.border
  end
end
