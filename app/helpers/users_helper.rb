module UsersHelper

	def get_combos(array)
		n = array.length - 1
		final_array = []
		while n > 0
			final_array += array.combination(n).to_a
			n -= 1
		end
		final_array
	end

	def add_array(array_of_arrays)
		p array_of_arrays
		index_of_winner = nil
		top_sum = 0
		array_of_arrays.each_with_index do |array, index|
		sum = 0
			array.each do |movie|
				sum += movie.minutes
			end

			if sum > top_sum && sum < @user.flight.minutes
				top_sum = sum
				index_of_winner = index
			end
		end
		if index_of_winner != nil
			@movie_fit = array_of_arrays[index_of_winner]
			@total_sum = top_sum
		end
	end

	def get_movie_fit(special)
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }
		add_array(get_combos(@recom))
	end


	def evaluate_check_boxes
		if @user.aaction == true && @user.comedy == true && @user.romance == true
			special = @actions & @comedies & @romances
			get_movie_fit(special)

		elsif @user.aaction == true && @user.comedy == true && @user.romance == nil
			special = @actions - @romances & @comedies
			get_movie_fit(special)

		elsif @user.aaction == nil && @user.comedy == true && @user.romance == true
			special = @comedies - @actions & @romances
			get_movie_fit(special)

		elsif @user.aaction == true && @user.comedy == nil && @user.romance == true
			special = @actions - @comedies & @romances
			get_movie_fit(special)

		elsif @user.aaction == true && @user.comedy == nil && @user.romance == nil
			special = @actions - @comedies - @romances
			get_movie_fit(special)

		elsif @user.aaction == nil && @user.comedy == true && @user.romance == nil
			special = @comedies - @actions - @romances
			get_movie_fit(special)

		elsif @user.aaction == nil && @user.comedy == nil && @user.romance == true
			special = @romances - @actions - @comedies
			get_movie_fit(special)
		end
	end		

end
