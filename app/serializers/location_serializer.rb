class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_weather

  has_many :recordings

    def current_weather
      { temp: object.recordings.last.temp,
        status: object.recordings.last.status }
    end
end
