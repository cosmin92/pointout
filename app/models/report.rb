class Report < ApplicationRecord
    mount_uploaders :images, ImageUploader
    serialize :images, JSON

    # Associations
    belongs_to :signaler
    belongs_to :tipology
    #belongs_to :agency, optional: true
    #belongs_to :forwarder, optional: true
    #has_many :taggings
    #has_many :tags, :through => :taggings, :as => :tagable
    #has_many :observations, dependent: :destroy
    #has_many :interventions
    #has_many :signalers, through: :interventions

    # Validations
    validates :object, presence: true, length: { minimum: 4, maximum: 50 }
    validates :description, presence: true

    validates :address, presence: true, length: { minimum: 2, maximum: 50 }
    validates :longitude, :latitude, presence: true

    validates :report_type, inclusion: { in: ["Complaint", "Segnalation" ,"Suggestion"] }
    validates :intervention_type, inclusion: { in: ["Ordinary", "Immediate"] }

    validates_integrity_of  :images
    validates_processing_of :images

    # Scopes
    def self.ordered_by_creation_date_asc
        order(created_at: :asc)
    end

    def self.ordered_by_creation_date_desc
        order(created_at: :desc)
    end

    def self.ordered_by_object_asc
        order(object: :asc)
    end

    def self.ordered_by_object_desc
        order(object: :desc)
    end

    def self.tipology(id)
        Tipology.find(id).reports
    end

    def self.nearby(center, radius)
        reports = Array.new
        all.each do |report|
            p2 = {:longitude => report.longitude, :latitude => report.latitude}
            if distance_in_meters(center, p2) <= radius
                reports.push(report)
            end
        end
        return reports
    end

    # Private methods
    private_class_method def self.distance_in_meters(center, p2)
        earth_radius = 6378.137
        dLat = p2[:latitude] * Math::PI / 180 - center[:latitude] * Math::PI / 180
        dLon = p2[:longitude] * Math::PI / 180 - center[:longitude] * Math::PI / 180
        a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(center[:latitude] * Math::PI / 180) * Math.cos(p2[:latitude] * Math::PI / 180) * Math.sin(dLon/2) * Math.sin(dLon/2)
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
        d = earth_radius * c
        return d * 1000; # meters
    end
end