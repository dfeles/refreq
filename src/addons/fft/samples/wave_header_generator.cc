#include <cstdio>

bool is_host_little()
{
    static short x = 0x0001;
    return (char*)&x;
}

short htols(short a)
{
    if (is_host_little())
        return a;
    char* p = (char*)&a;
    char h;
    h = p[0]; p[0] = p[1]; p[1] = h;
    return a;
}

int htoll(int a)
{
    if (is_host_little())
        return a;
    char* p = (char*)&a;
    char h;
    h = p[0]; p[0] = p[3]; p[3] = h;
    h = p[1]; p[1] = p[2]; p[2] = h;
    return a;
}

int htonl(int a)
{
    if (is_host_little() == false)
        return a;
    char* p = (char*)&a;
    char h;
    h = p[0]; p[0] = p[3]; p[3] = h;
    h = p[1]; p[1] = p[2]; p[2] = h;
    return a;
}

// Format description taken from:
// https://ccrma.stanford.edu/courses/422/projects/WaveFormat/.
// The structure is already packed (all properties are aligned properly), so it
// can be written to file using fwrite.
struct WavePcmHeader
{
    // RIFF chunk
    int chunkId;
    int chunkSize;
    int format;
    // fmt wave subchunk
    int fmtSubchunkId;
    int fmtSubchunkSize;
    short fmtAudioFormat;
    short fmtNumChannels;
    int fmtSampleRate;
    int fmtByteRate;
    short fmtBlockAlign;
    short fmtBitsPerSample;
    // data wave subchunk
    int dataSubchunkId;
    int dataSubchunkSize;
    // the data follows
    
    WavePcmHeader(short audioFormat, short numChannels, int sampleRate,
            short bitsPerSample, int numSamples)
        : chunkId(htonl(0x52494646)),
          chunkSize(htoll(44 + numSamples * numChannels * bitsPerSample / 8)),
          format(htonl(0x57415645)),
          fmtSubchunkId(htonl(0x666d7420)),
          fmtSubchunkSize(htoll(16)),
          fmtAudioFormat(htols(1)),
          fmtNumChannels(htols(numChannels)),
          fmtSampleRate(htoll(sampleRate)),
          fmtByteRate(htoll(sampleRate * numChannels * bitsPerSample / 8)),
          fmtBlockAlign(htols(numChannels * bitsPerSample / 8)),
          fmtBitsPerSample(htols(bitsPerSample)),
          dataSubchunkId(htonl(0x64617461)),
          dataSubchunkSize(htoll(numSamples * numChannels * bitsPerSample / 8))
    {
    }
};

int main()
{
    FILE *waveFile = fopen("wave.wav", "wb");
    FILE *pcmFile = fopen("pcm.pcm", "rb");
    fseek(pcmFile, 0, SEEK_END);
    int pcmFileSize = ftell(pcmFile);
    rewind(pcmFile);
    
    short audioFormat = 1;
    short numChannels = 1;
    int sampleRate = 8192;
    short bitsPerSample = 16;
    int numSamples = pcmFileSize / (numChannels * bitsPerSample / 8);
    WavePcmHeader header(audioFormat, numChannels, sampleRate, bitsPerSample,
            numSamples);
    fwrite(&header, sizeof(WavePcmHeader), 1, waveFile);
    
    char *buf = new char[pcmFileSize];
    fread(buf, 1, pcmFileSize, pcmFile);
    fwrite(buf, 1, pcmFileSize, waveFile);
    delete [] buf;
    
    fclose(pcmFile);
    fclose(waveFile);
}
