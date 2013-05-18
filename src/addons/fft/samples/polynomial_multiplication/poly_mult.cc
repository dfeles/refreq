#include "../../FFT.h"
#include <iostream>
#include <vector>

#define PI 3.14159265
#define EPSILON 0.000001

using namespace std;

vector<double> multiply_polys(vector<double> poly_a, vector<double> poly_b);

int main()
{
    // 7x^2 + 3x + 9
    vector<double> poly_a;
    poly_a.push_back(9);
    poly_a.push_back(3);
    poly_a.push_back(7);
    // -13x + 5
    vector<double> poly_b;
    poly_b.push_back(5);
    poly_b.push_back(-13);
    // -91x^3 - 4x^2 - 102x + 45
    vector<double> result = multiply_polys(poly_a, poly_b);
    bool success = abs(result[0] - 45) < EPSILON
            && abs(result[1] + 102) < EPSILON
            && abs(result[2] + 4) < EPSILON
            && abs(result[3] + 91) < EPSILON;
    cout << "Multiplying polynomials: " << (success ? "OK" : "FAILED") << endl;
}

vector<double> multiply_polys(vector<double> poly_a, vector<double> poly_b)
{
    // 1. Make place for resulting polynomial and ensure n is a power of two.
    int n = poly_a.size() + poly_b.size();
    int power_of_2 = 2;
    while (power_of_2 < n)
        power_of_2 <<= 1;
    n = power_of_2;
    poly_a.resize(n, 0);
    poly_b.resize(n, 0);
    // 2. Compute point-value representation of a and b for values of unity
    // roots using DFT.
    vector<FFT::Complex> poly_a_complex(n);
    vector<FFT::Complex> poly_b_complex(n);
    for (int i = 0; i < n; ++i)
    {
        poly_a_complex[i] = poly_a[i];
        poly_b_complex[i] = poly_b[i];
    }
    FFT dft(n);
    vector<FFT::Complex> poly_a_values = dft.transform(poly_a_complex);
    vector<FFT::Complex> poly_b_values = dft.transform(poly_b_complex);
    for (int i = 0; i < n; ++i)
    {
        poly_a_values[i] *= n;
        poly_b_values[i] *= n;
    }
    // 3. Multiply poly a values by poly b values.
    vector<FFT::Complex> poly_c_values(n);
    for (int i = 0; i < n; ++i)
        poly_c_values[i] = poly_a_values[i] * poly_b_values[i];
    // 4. Compute coefficients representation of c using Inverse DFT.
    FFT idft(n, true);
    vector<FFT::Complex> poly_c_complex = idft.transform(poly_c_values);
    vector<double> poly_c(n);
    for (int i = 0; i < n; ++i)
        poly_c[i] = poly_c_complex[i].real() / n;
    return poly_c;
}
