from fxpmath import Fxp


def float_to_fixed_point_binary(float_number, total_bits=32, frac_bits=16):
    """
    Convert a floating-point number to fixed-point binary using Fxp library.

    Args:
        float_number (float): The floating-point number to convert.
        total_bits (int): Total number of bits for the fixed-point number (default: 16).
        frac_bits (int): Number of bits for the fractional part (default: 8).

    Returns:
        str: Fixed-point binary string with fractional dot.
    """
    # Convert float to fixed-point binary using Fxp
    x = Fxp(float_number, signed=True, n_word=total_bits, n_frac=frac_bits)
    return x.bin(frac_dot=True)  # Return the binary string with fractional dot


def read_floats_from_file(input_file):
    """
    Read float numbers from a file.

    Args:
        input_file (str): Path to the input .txt file.

    Returns:
        list: List of floating point numbers.
    """
    with open(input_file, 'r') as file:
        floats = [float(line.strip()) for line in file.readlines()]
    return floats


def save_binary_to_file(output_file, binary_list):
    """
    Save binary representations to a file.

    Args:
        output_file (str): Path to the output .txt file.
        binary_list (list): List of binary strings to save.
    """
    with open(output_file, 'w') as file:
        for binary_str in binary_list:
            file.write(binary_str + '\n')


def convert_floats_to_fixed_point(input_file, output_file, total_bits=32, frac_bits=16):
    """
    Read floats from a file, convert them to fixed-point binary, and save to a file.

    Args:
        input_file (str): Path to the input .txt file with floats.
        output_file (str): Path to the output .txt file to save binary strings.
        total_bits (int): Total number of bits for the fixed-point number (default: 16).
        frac_bits (int): Number of bits for the fractional part (default: 8).
    """
    # Read float numbers from the input file
    float_numbers = read_floats_from_file(input_file)

    # Convert each float to fixed-point binary
    binary_list = [float_to_fixed_point_binary(f, total_bits, frac_bits) for f in float_numbers]

    # Save the binary results to the output file
    save_binary_to_file(output_file, binary_list)


# Example usage:
input_file = 'cl_input_image.txt'  # Input file containing float numbers
output_file = 'bin_input.txt'  # Output file to save binary numbers

# Convert floats to fixed-point binary and save to a file
convert_floats_to_fixed_point(input_file, output_file, total_bits=32, frac_bits=16)
convert_floats_to_fixed_point('cl_biases.txt', 'bin_biases.txt', total_bits=32, frac_bits=16)
convert_floats_to_fixed_point('cl_filters.txt', 'bin_filter.txt', total_bits=32, frac_bits=16)
convert_floats_to_fixed_point('cl_output.txt', 'bin_output.txt', total_bits=32, frac_bits=16)
