#ifndef BORDER_DETECTION
#define BORDER_DETECTION

void border_detection_filter(char* input_filename, char* output_filename, double filter_intensity, int threads_count);
unsigned char rbg_to_grayscale(unsigned char r, unsigned char g, unsigned char b);
void *border_detection_filter_thread(void* data);
void *grayscale_filter_thread(void* data);

struct border_detection_thread_input {
    unsigned char* input_image;
    unsigned char* grayscale_image;
    unsigned char* output_image;
    int start;
    int end;
    int width;
    int height;
    int filter_intensity;
};

#endif