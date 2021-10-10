#define IMAGE_WIDTH 128
#define IMAGE_HEIGHT 128
#define MAX_ITERATIONS 50
#define DISPLAY_BASE 0x10010000



void plot(int x, int y, int iterations){
    int* crt_address = (int*) DISPLAY_BASE + y * IMAGE_WIDTH + x;
    int color = 0xFF - iterations * 8;
    *crt_address = color;
}

void mandelbrot(fixed_q24.8 x_start, fixed_q24.8 y_start, fixed_q24.8 x_stretch, fixed_q24.8 y_stretch){
    fixed_q24.8 Zr, Zi, Cr, Ci, Tr, Ti;
    fixed_q24.8 two = 2.0;
    fixed_q24.8 four = 4.0;
    for(int y=0; y<IMAGE_HEIGHT; ++y){
        for(int x=0; x<IMAGE_WIDTH; ++x){
            Zr = Zi = Tr = Ti = 0.0;
            Cr = (x_stretch * x / IMAGE_WIDTH + x_start);
            Ci = (y_stretch * y / IMAGE_HEIGHT + y_start);
            int iterations = 0;
            for (iterations = 0;
                iterations < MAX_ITERATIONS && (Tr+Ti <= four);
                ++iterations){
                Zi = two * Zr * Zi + Ci;
                Zr = Tr - Ti + Cr;
                Tr = Zr * Zr;
                Ti = Zi * Zi;
            }
            plot(x, y, iterations);
        }
    }
}


int main(){
    fixed_q24.8 x_start = -1.5;
    fixed_q24.8 y_start = -1.0;
    fixed_q24.8 x_stretch = 2.0;
    fixed_q24.8 y_stretch = 2.0;

    mandelbrot(x_start, y_start, x_stretch, y_stretch);
    return 0;
}
