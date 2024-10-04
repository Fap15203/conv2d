def process_txt_file(input_file, output_file):
    """
    Reads a text file, deletes all blank lines, and ensures each value is written to a new line in the output file.

    Args:
        input_file (str): Path to the input .txt file.
        output_file (str): Path to the output .txt file where the processed content will be saved.
    """
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            # Strip whitespace from the line (this removes leading/trailing spaces, tabs, newlines)
            stripped_line = line.strip()

            # Skip blank lines
            if stripped_line:
                # Split the line by whitespace to handle cases where multiple values are on the same line
                values = stripped_line.split()

                # Write each value on a new line in the output file
                for value in values:
                    outfile.write(value + '\n')


# Example usage:
input_file = 'input_image.txt'  # Replace with the path to your input .txt file
output_file = 'cl_input_image.txt'  # Replace with the path to your output .txt file

# Process the file
process_txt_file(input_file, output_file)
process_txt_file('biases.txt', 'cl_biases.txt')
process_txt_file('filters.txt', 'cl_filters.txt')
process_txt_file('output_feature_maps.txt', 'cl_output.txt')

print(f"Processed content saved to {output_file}")
