location = Location.find_or_create_by(name: 'Austin')

unless location.recordings.any?
  statuses = %w(sunny windy cloudy rainy)
  temp_arr = (40..90).to_a
  10.times do
    recording = Recording.create(location: location,
                                  temp: temp_arr.sample,
                                  status: statuses.sample,
                                  created_at: (1..10).to_a.sample.days.ago
                                )
    puts "recording created: #{recording.id}"
  end
end
