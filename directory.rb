# list of stuents in array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Micheal Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
    ]
# list of students
puts "the students of Villain Academy"
puts "--------------"
students.each do |student|
  puts student
end
# total number of students
puts "Overall, we have #{students.count} great students"
