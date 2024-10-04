import numpy as np


class ConvLayer:
    def __init__(self, input_size, kernel_size, num_filters, output_size):
        """
        Initialize the convolutional layer.

        Args:
            input_size (tuple): Dimensions of the input (height, width).
            kernel_size (tuple): Dimensions of the kernel (height, width).
            num_filters (int): Number of filters (output channels).
            output_size (tuple): Dimensions of the output (height, width).
        """
        self.input_size = input_size  # (height, width) of input, e.g. (32, 32)
        self.kernel_size = kernel_size  # (height, width) of kernel, e.g. (5, 5)
        self.num_filters = num_filters  # Number of filters, e.g. 6
        self.output_size = output_size  # (height, width) of output, e.g. (28, 28)

        # Randomly initialize filters (kernels) with shape: (num_filters, kernel_height, kernel_width)
        self.filters = np.random.randn(num_filters, kernel_size[0], kernel_size[1])

        # Initialize bias for each filter
        self.biases = np.random.randn(num_filters)

    def convolve(self, input_image):
        """
        Perform the convolution operation on the input image.

        Args:
            input_image (numpy array): Input image of shape (height, width).

        Returns:
            numpy array: Output feature maps after convolution, shape (num_filters, output_height, output_width).
        """
        output_height, output_width = self.output_size
        kernel_height, kernel_width = self.kernel_size

        # Initialize output feature map
        output = np.zeros((self.num_filters, output_height, output_width))

        # Perform convolution for each filter
        for f in range(self.num_filters):
            filter_kernel = self.filters[f]
            bias = self.biases[f]

            # Slide the filter over the input image
            for i in range(output_height):
                for j in range(output_width):
                    # Extract the region of the input the filter will be applied to
                    region = input_image[i:i + kernel_height, j:j + kernel_width]

                    # Perform element-wise multiplication and summing
                    output[f, i, j] = np.sum(region * filter_kernel) + bias

        return output


def save_array_to_txt(file_name, array):
    """
    Save a numpy array to a .txt file.

    Args:
        file_name (str): The name of the file to save.
        array (numpy array): The numpy array to save.
    """
    np.savetxt(file_name, array, fmt='%f')


def save_3d_array_to_txt(file_name, array):
    """
    Save a 3D numpy array (e.g., filters or feature maps) to a .txt file.

    Args:
        file_name (str): The name of the file to save.
        array (numpy array): The numpy array to save.
    """
    with open(file_name, 'w') as f:
        for i in range(array.shape[0]):
            np.savetxt(f, array[i], fmt='%f')
            f.write("\n")  # Add a newline between different filters or feature maps


# Example usage:
input_image = np.random.randint(0, 256, (32, 32))  # Randomly generated input image of size 32x32 with values 0 to 255

conv_layer = ConvLayer(input_size=(32, 32), kernel_size=(5, 5), num_filters=6, output_size=(28, 28))

# Save random input image, filters, and biases
save_array_to_txt('input_image.txt', input_image)
save_3d_array_to_txt('filters.txt', conv_layer.filters)
save_array_to_txt('biases.txt', conv_layer.biases)

# Perform the convolution
output_feature_maps = conv_layer.convolve(input_image)

# Save the convolution result (output feature maps)
save_3d_array_to_txt('output_feature_maps.txt', output_feature_maps)

# Print output feature maps to a .txt file
print("Convolutional result saved to 'output_feature_maps.txt'")
