hash = { data: { rooms:
    [ { id: 1, room_number: "201", capacity: 50}, { id: 2, room_number: "301", capacity: 200 }, { id: 3, room_number: "1B", capacity: 100}
    ],
    events: [
      { id: 1, room_id: 2, start_time: 18, end_time: 20, attendees: 75 },
      { id: 2, room_id: 1, start_time: 10, end_time: 18, attendees: 25 },
      { id: 3, room_id: 2, start_time: 10, end_time: 18, attendees: 20 },
      { id: 4, room_id: 3, start_time: 18, end_time: 21, attendees: 56 },
    ]
  }
}

room_201 = hash[:data][:rooms].find do |room|
  room[:room_number] == "201"
end
capacity_201 = room_201[:capacity]
puts capacity_201

events_201 = hash[:data][:events].select do |hash|
  hash[:room_id] == room_201[:id]
end
puts events_201

events_201.each do |event|
  if event[:attendees] <= capacity_201
    puts "Event id ##{event[:id]} will fit."
  else
    puts "Event id ##{event[:id]} will not fit."
  end
end
