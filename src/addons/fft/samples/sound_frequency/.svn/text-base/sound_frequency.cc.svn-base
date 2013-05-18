#include "../../FFT.h"
#include <iostream>
#include <vector>

#define PI 3.14159265
#define EPSILON 0.000001

using namespace std;

const int samples_per_second = 8192;

int main()
{
    FILE* f = fopen("../pcm.pcm", "rb");
    fseek(f, 0, SEEK_END);
    int n = ftell(f) / 2;
    rewind(f);
    short* buf = new short[n];
    fread(buf, n, 2, f);
    fclose(f);
    
    vector<FFT::Complex> buf_complex(n);
    for (int i = 0; i < n; ++i)
        buf_complex[i] = buf[i];
    delete[] buf;
    FFT dft(n);
    vector<FFT::Complex> frequencies = dft.transform(buf_complex);
    
    for (int k = 0; k < (n >> 1); ++k)
        if (dft.getIntensity(frequencies[k]) > 100)
            cout << (k * samples_per_second / n) << " => "
                    << dft.getIntensity(frequencies[k]) << endl;
}
