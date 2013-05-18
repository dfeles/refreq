#include <cstdio>
#include <cmath>
#include <vector>

#define PI 3.14159265

using namespace std;

const int samples_per_second = 8192;

vector<short> genSound(vector<int> frequencies, vector<double> phases);

int main()
{
    vector<int> frequencies;
    frequencies.push_back(1500);
    frequencies.push_back(500);
    vector<double> phases;
    phases.push_back(PI / 4);
    phases.push_back(PI / 10);
    vector<short> sound = genSound(frequencies, phases);
    
    FILE* file = fopen("pcm.pcm", "wb");
    fwrite(&sound[0], sound.size(), 2, file);
    fclose(file);
}

vector<short> genSound(vector<int> frequencies, vector<double> phases)
{
    vector<short> result(samples_per_second);
    for (int i = 0; i < samples_per_second; ++i)
    {
        double v = 0;
        for (int j = 0; j < frequencies.size(); ++j)
            v += sin(2 * PI * i / samples_per_second * frequencies[j]
                    + phases[j]);
        result[i] = (short)(1000 * v);
    }
    return result;
}
