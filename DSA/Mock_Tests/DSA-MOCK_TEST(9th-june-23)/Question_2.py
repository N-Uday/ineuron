from functools import reduce
import re

def count_words(filename):
    # Read the i/p file
    with open(filename, 'r') as file:
        text = file.read()

    # Remove punctuation and convert to lowercase
    cleaned_text = re.sub(r'[^\w\s]', '', text.lower())

    # Split the text into individual words
    words = cleaned_text.split()

    # Count the occurrence of each word using the map function
    word_counts = map(lambda word: (word, 1), words)

    # Aggregate the word counts using the reduce function
    def aggregate_counts(counts, count):
        word, freq = count
        counts[word] = counts.get(word, 0) + freq
        return counts

    word_count_map = reduce(aggregate_counts, word_counts, {})

    return word_count_map

# Specify the input file path
input_file = 'input.txt'

word_count = count_words(input_file)

# Print 
for word, count in word_count.items():
    print(f'{word}: {count}')
