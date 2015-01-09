class Koth
	attr_accessor :challengers, :losers, :scores, :challenger_1, :challenger_2, :winner
	def initialize
		@challengers = Array.new
		@losers = Array.new
		@scores = Hash.new(0)
	end
	#Challengers array can have player added to end with command addnew(gamer_tag) 

	def addnew(*gamers)
		gamers.each do |gamer|
			puts gamer 
			@challengers<<(gamer)
			@scores.merge!(gamer => 0)
		end
	end

	#deletes gamer from loser/challenger bracket without deleting score
	def loser(gamer)
		@losers.delete_at(find_index(gamer))
		@challengers.delete_at(find_index(gamer))
	end


	def leaderboard 
	 @scores.sort_by { |_, score| -score }
	end

	def chal1
	unless challenger_1
		@challenger_1 = challengers.shift
			if @challengers.empty?
				then losers.shift
			end
		end
	end

	def chal2
	if challengers.empty?
		@challenger_2 = losers.shift
		else
		@challenger_2 = challengers.shift 
	 end
	end

	def letsplay
		chal1
		chal2
	puts "Now playing: #{challenger_1} vs. #{challenger_2}"

	#prompt who won?
	print "Who won #{challenger_1} or #{challenger_2}?"
	@winner = gets.chomp

	if winner = @challenger_1
		losers << @challenger_2
		chal2
	elsif
	# winner = challenger_2
	 losers << @challenger_1
	 @challenger_1 = nil
	 chal1
	else
		prints "Uhm I think you had a typo.  Who won?"
		@winner = gets.chomp
	end
	end
	#save answer as challenger 1, mark win in Winners Hash, put loser at end of loser's array, create bye functionality, which will mark a user as not present, and let the other user play in the next match.
	#create deleteloser method that will delete a loser from the loser's array without deleting him from the winners array.
end

@kneeknee = Koth.new
@kneeknee.addnew("Sungho", "Wify", "Niini", "Todd", "Mo'Knee")
@kneeknee.challengers