people = []
ARGV.each do |p|
  people << p
end
stats = Hash.new(0)
1000.times do 
  winner = people.shuffle.sample
  stats[winner] += 1
end

p "WE HAVE A WINNER!!!"
p stats.max_by{ |k,v| v }

p "Draw stats:"
p stats