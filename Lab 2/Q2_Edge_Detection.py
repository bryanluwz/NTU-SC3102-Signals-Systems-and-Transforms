import cv2
import matplotlib.pyplot as plt


def simple_edge_detection(image_path):
    image = cv2.imread(image_path, 0)  # Read the image
    edges_detected = cv2.Canny(image, 100, 200)
    images = [image, edges_detected]
    location = [121, 122]
    for loc, edge_image in zip(location, images):
        plt.subplot(loc)
        plt.imshow(edge_image, cmap='gray')
    plt.show()


image_path = './Lab 2/howtosummonalemon.jpg'
simple_edge_detection(image_path)
