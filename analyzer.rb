# RYAN VONG
# Course: CS132A Ruby

# Text analyzer
# Read in a text file
# Load the file line by line keeping track of number of lines
# Put the text in a string and measure its length to keep count of character including spaces
# Temporarily remove all whitespace and measure the length to keep count of character excluding spaces
# Split the string by space to find out how many words there are
# Split on full stop(period) to find out how many sentences there are
# Split on double newlines to find out how many paragraphs there are
# Perform calculations to work out the averages

text = ""
line_count = 0
word_count = 0
sentence_count = 0
paragraph_count = 0
total_characters = 0


# Read in a text file from argument and load all file lines at once to variable lines
lines = File.readlines(ARGV[0])

# Count the number of lines
line_count = lines.length

# Join each line by whitespace
text = lines.join

# Count the total characters including space
total_characters = text.length

# Substitute white space with nothing to count characters with no space
total_characters_no_space = text.gsub(/\s+/, '').length

# Split text into words array
words = text.split

# Count number of words
word_count = words.length

# Split the text by a period or a question mark or exclamation mark
# and count the sentences
sentence_count = text.split(/\.|\?|!/).length

# Split the text by double newline to count the paragraphs
paragraph_count = text.split(/\n\n/).length

# Stop words that we don't want to include in keywords array
stop_words = %w{the a by on for of are with just but and to the my I has some in}

# Reject those words that are part of the stop_words array defined earlier
keywords = words.reject {|word| stop_words.include?(word)}

# Substitute whitespaces by single space
# Strip whitespace at the beginning and end
# Split text into sentences array by period or question mark or exclamation mark
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)

# Sort the sentences by their length
sentences_sorted = sentences.sort_by {|sentence| sentence.length}

# Divide the length of sorted sentences by 3 to get the interesting sentences on the second third
one_third = sentences_sorted.length / 3

# Get the 2nd third slice of sorted sentences for the interesting sentences
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)

# Select those interesting sentences that includes 'is' or 'are'
ideal_sentences.select! {|sentence| sentence =~ /is|are/}

# Print out results
puts "#{line_count} lines"
puts "#{total_characters} total characters"
puts "#{total_characters_no_space} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{((keywords.length.to_f / word_count) * 100).to_i} percentage of keywords"
puts "Interesting sentences: "
puts ideal_sentences.join(".")
