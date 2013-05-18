#include "../../FFT.h"
#include <iostream>
#include <vector>

#define PI 3.14159265
#define EPSILON 0.000001

using namespace std;

bool test_transform_intensity();
bool test_transform_phase();
bool test_inverse_transform();

const int n = 1024;
FFT dft(n), idft(n, true);

int main()
{
    cout << "Testing if transform computes correct intensity: "
            << (test_transform_intensity() ? "OK" : "FAILED") << endl;
    cout << "Testing if transform computes correct phase: "
            << (test_transform_phase() ? "OK" : "FAILED") << endl;
    cout << "Testing if inverse transform works: "
            << (test_inverse_transform() ? "OK" : "FAILED") << endl;
}

bool test_transform_intensity()
{
    int d = 10;
    vector<FFT::Complex> v(n);
    for (int i = 0; i < n; ++i)
        v[i] = cos(2 * PI * d * i / n);
    vector<FFT::Complex> v_dft = dft.transform(v);
    for (int k = 0; k < (n >> 1); ++k)
    {
        if (k == d && FFT::getIntensity(v_dft[k]) <= EPSILON)
            return false;
        if (k != d && FFT::getIntensity(v_dft[k]) > EPSILON)
            return false;
    }            
    return true;
}

bool test_transform_phase()
{
    int d = 10;
    double phase = PI / 4.0;
    vector<FFT::Complex> v(n);
    for (int i = 0; i < n; ++i)
        v[i] = cos(2 * PI * d * i / n + phase);
    vector<FFT::Complex> v_dft = dft.transform(v);
    return abs(FFT::getPhase(v_dft[d]) - phase) < EPSILON;
}

bool test_inverse_transform()
{
    vector<FFT::Complex> v(n);
    for (int i = 0; i < n; ++i)
        // some function
        v[i] = cos(2 * PI * 10 * i / n) * sin(2 * PI * 17 * i / n);
    vector<FFT::Complex> v_restored = idft.transform(dft.transform(v));
    for (int k = 0; k < n; ++k)
        if (abs(v_restored[k] - v[k]) > EPSILON)
            return false;
    return true;
}
