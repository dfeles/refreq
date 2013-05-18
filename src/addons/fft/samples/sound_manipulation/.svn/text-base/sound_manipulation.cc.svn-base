#include "../../FFT.h"
#include <iostream>
#include <vector>

#define PI 3.14159265
#define EPSILON 0.000001

using namespace std;

const int samples_per_second = 8192;

int main()
{
    // read original file
    FILE* f = fopen("../pcm.pcm", "rb");
    fseek(f, 0, SEEK_END);
    int n = ftell(f) / 2;
    rewind(f);
    short* buf = new short[n];
    fread(buf, n, 2, f);
    fclose(f);
    // compute DFT
    vector<FFT::Complex> buf_complex(n);
    for (int i = 0; i < n; ++i)
        buf_complex[i] = buf[i];
    FFT dft(n);
    vector<FFT::Complex> frequencies = dft.transform(buf_complex);
    // remove frequency (1500 Hz)
    frequencies[1500 * n / samples_per_second] = 0;
    frequencies[(n - 1500) * n / samples_per_second] = 0;
    // compute IDFT
    FFT idft(n, true);
    buf_complex = idft.transform(frequencies);
    // save modified file
    for (int i = 0; i < n; ++i)
        buf[i] = (short)buf_complex[i].real();
    f = fopen("../pcm.pcm", "wb");
    fwrite(buf, n, 2, f);
    fclose(f);
}
