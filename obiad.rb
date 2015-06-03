class MagicObiadMachine
  attr_reader :people
  CYCLES = 1000

  def initialize(people)
    @people = people
  end

  def run
    perform_draw
    puts "Draw stats:"
    p @stats

    while has_ties?
      puts "There's a tie! Repeating..."
      extract_tied
      perform_draw
      p @stats
    end
    puts "AND THE WINNER IS... #{winners.first.first}!"
  end

  private
  def perform_draw
    @stats = Hash[@people.map{|p| [p, 0]}]
    CYCLES.times do 
      winner = people.shuffle.sample
      @stats[winner] += 1
    end
    @stats = Hash[@stats.sort_by{|k,v| -v}]
  end

  def has_ties?
    winners.length > 1
  end

  def winners
    max = @stats.first.last
    @stats.select{|k,v| v == max}
  end

  def extract_tied
    @people = winners.keys
  end
end


people = ARGV
MagicObiadMachine.new(people).run