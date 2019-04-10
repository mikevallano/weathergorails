class RecordingSerializer < ActiveModel::Serializer
  attributes :id, :temp, :status

  belongs_to :location # this will add a 'relationships' key for each recording
end
