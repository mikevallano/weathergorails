json.id @location.id
json.name @location.name
json.current do
  json.name @location.name
  json.temp @location.recordings.last.temp
  json.status @location.recordings.last.status
end
