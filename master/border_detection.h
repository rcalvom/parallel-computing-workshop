#ifndef BORDER_DETECTION
#define BORDER_DETECTION

void border_detection_filter(char* input_filename, char* output_filename, double filter_intensity, int process_count);
unsigned char rbg_to_grayscale(unsigned char r, unsigned char g, unsigned char b);

#endif