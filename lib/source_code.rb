filename = $0
File.open(filename, "r") do |file|
  puts "The source code of #{filename} file is below:"
  file.readlines.each do |line|
    puts line
  end  
end