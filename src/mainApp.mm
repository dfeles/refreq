/* This is an example of how to integrate maximilain into openFrameworks, 
 including using audio received for input and audio requested for output.
 
 
 You can copy and paste this and use it as a starting example.
 
 */


#include "mainApp.h"
#include "ofVectorMath.h"


bool	appStarted = false;
bool	firstLoaded=false;

int		myInt1;

float	line = 0;

bool	reset = false;

float	myColors[4];

mainApp::~mainApp() {
};
//--------------------------------------------------------------

void mainApp::setup(){

    
    
    appStarted=true;
	ofSetWindowShape(800, 700);
    ofSetWindowPosition(100,800);
	
	///sinus buffer
	float sines[514]={0,0.012268,0.024536,0.036804,0.049042,0.06131,0.073547,0.085785,0.097992,0.1102,0.12241,0.13455,0.1467,0.15884,0.17093,0.18301,0.19507,0.20709,0.21909,0.23105,0.24295,0.25485,0.26669,0.2785,0.29025,0.30197,0.31366,0.32529,0.33685,0.34839,0.35986,0.37128,0.38266,0.39395,0.40521,0.41641,0.42752,0.4386,0.44958,0.46051,0.47137,0.48215,0.49286,0.50351,0.51407,0.52457,0.53497,0.54529,0.55554,0.5657,0.57578,0.58575,0.59567,0.60547,0.6152,0.62482,0.63437,0.6438,0.65314,0.66238,0.67151,0.68057,0.68951,0.69833,0.70706,0.7157,0.72421,0.7326,0.74091,0.74908,0.75717,0.76514,0.77298,0.7807,0.7883,0.79581,0.80316,0.81042,0.81754,0.82455,0.83142,0.8382,0.84482,0.85132,0.8577,0.86392,0.87006,0.87604,0.88187,0.8876,0.89319,0.89862,0.90396,0.90912,0.91415,0.91907,0.92383,0.92847,0.93295,0.93729,0.9415,0.94556,0.94949,0.95325,0.95691,0.96039,0.96375,0.96692,0.97,0.9729,0.97565,0.97827,0.98074,0.98306,0.98523,0.98724,0.98914,0.99084,0.99243,0.99387,0.99515,0.99628,0.99725,0.99808,0.99875,0.99927,0.99966,0.99988,0.99997,0.99988,0.99966,0.99927,0.99875,0.99808,0.99725,0.99628,0.99515,0.99387,0.99243,0.99084,0.98914,0.98724,0.98523,0.98306,0.98074,0.97827,0.97565,0.9729,0.97,0.96692,0.96375,0.96039,0.95691,0.95325,0.94949,0.94556,0.9415,0.93729,0.93295,0.92847,0.92383,0.91907,0.91415,0.90912,0.90396,0.89862,0.89319,0.8876,0.88187,0.87604,0.87006,0.86392,0.8577,0.85132,0.84482,0.8382,0.83142,0.82455,0.81754,0.81042,0.80316,0.79581,0.7883,0.7807,0.77298,0.76514,0.75717,0.74908,0.74091,0.7326,0.72421,0.7157,0.70706,0.69833,0.68951,0.68057,0.67151,0.66238,0.65314,0.6438,0.63437,0.62482,0.6152,0.60547,0.59567,0.58575,0.57578,0.5657,0.55554,0.54529,0.53497,0.52457,0.51407,0.50351,0.49286,0.48215,0.47137,0.46051,0.44958,0.4386,0.42752,0.41641,0.40521,0.39395,0.38266,0.37128,0.35986,0.34839,0.33685,0.32529,0.31366,0.30197,0.29025,0.2785,0.26669,0.25485,0.24295,0.23105,0.21909,0.20709,0.19507,0.18301,0.17093,0.15884,0.1467,0.13455,0.12241,0.1102,0.097992,0.085785,0.073547,0.06131,0.049042,0.036804,0.024536,0.012268,0,-0.012268,-0.024536,-0.036804,-0.049042,-0.06131,-0.073547,-0.085785,-0.097992,-0.1102,-0.12241,-0.13455,-0.1467,-0.15884,-0.17093,-0.18301,-0.19507,-0.20709,-0.21909,-0.23105,-0.24295,-0.25485,-0.26669,-0.2785,-0.29025,-0.30197,-0.31366,-0.32529,-0.33685,-0.34839,-0.35986,-0.37128,-0.38266,-0.39395,-0.40521,-0.41641,-0.42752,-0.4386,-0.44958,-0.46051,-0.47137,-0.48215,-0.49286,-0.50351,-0.51407,-0.52457,-0.53497,-0.54529,-0.55554,-0.5657,-0.57578,-0.58575,-0.59567,-0.60547,-0.6152,-0.62482,-0.63437,-0.6438,-0.65314,-0.66238,-0.67151,-0.68057,-0.68951,-0.69833,-0.70706,-0.7157,-0.72421,-0.7326,-0.74091,-0.74908,-0.75717,-0.76514,-0.77298,-0.7807,-0.7883,-0.79581,-0.80316,-0.81042,-0.81754,-0.82455,-0.83142,-0.8382,-0.84482,-0.85132,-0.8577,-0.86392,-0.87006,-0.87604,-0.88187,-0.8876,-0.89319,-0.89862,-0.90396,-0.90912,-0.91415,-0.91907,-0.92383,-0.92847,-0.93295,-0.93729,-0.9415,-0.94556,-0.94949,-0.95325,-0.95691,-0.96039,-0.96375,-0.96692,-0.97,-0.9729,-0.97565,-0.97827,-0.98074,-0.98306,-0.98523,-0.98724,-0.98914,-0.99084,-0.99243,-0.99387,-0.99515,-0.99628,-0.99725,-0.99808,-0.99875,-0.99927,-0.99966,-0.99988,-0.99997,-0.99988,-0.99966,-0.99927,-0.99875,-0.99808,-0.99725,-0.99628,-0.99515,-0.99387,-0.99243,-0.99084,-0.98914,-0.98724,-0.98523,-0.98306,-0.98074,-0.97827,-0.97565,-0.9729,-0.97,-0.96692,-0.96375,-0.96039,-0.95691,-0.95325,-0.94949,-0.94556,-0.9415,-0.93729,-0.93295,-0.92847,-0.92383,-0.91907,-0.91415,-0.90912,-0.90396,-0.89862,-0.89319,-0.8876,-0.88187,-0.87604,-0.87006,-0.86392,-0.8577,-0.85132,-0.84482,-0.8382,-0.83142,-0.82455,-0.81754,-0.81042,-0.80316,-0.79581,-0.7883,-0.7807,-0.77298,-0.76514,-0.75717,-0.74908,-0.74091,-0.7326,-0.72421,-0.7157,-0.70706,-0.69833,-0.68951,-0.68057,-0.67151,-0.66238,-0.65314,-0.6438,-0.63437,-0.62482,-0.6152,-0.60547,-0.59567,-0.58575,-0.57578,-0.5657,-0.55554,-0.54529,-0.53497,-0.52457,-0.51407,-0.50351,-0.49286,-0.48215,-0.47137,-0.46051,-0.44958,-0.4386,-0.42752,-0.41641,-0.40521,-0.39395,-0.38266,-0.37128,-0.35986,-0.34839,-0.33685,-0.32529,-0.31366,-0.30197,-0.29025,-0.2785,-0.26669,-0.25485,-0.24295,-0.23105,-0.21909,-0.20709,-0.19507,-0.18301,-0.17093,-0.15884,-0.1467,-0.13455,-0.12241,-0.1102,-0.097992,-0.085785,-0.073547,-0.06131,-0.049042,-0.036804,-0.024536,-0.012268,0,0.012268
	};
	for(int i = 0; i < 514 ; i ++){
		sineBuffer[i] = sines[i];
	}
	
	/* some standard setup stuff*/
	vonal=10;
	
    ofEnableAlphaBlending();
	ofSetupScreen();
	ofSetFrameRate(30);
	ofSetBackgroundAuto(false);
	
    maxHertz = 3513;
    spectrum = new SpectrumDrawer( 1, maxHertz );
	spectrum->loadImageSpectrum("../Resources/main.jpg");
	
	playerHead = new PlayerHead();
	
	isPlaying = false;  // i wait on hitting "p" to play
	recording = false;
    
    
	//microphone
	left = new float[BUFFER_SIZE];
	right = new float[BUFFER_SIZE];
	
	//ofSoundStreamSetup(2,2,this,SAMPLE_RATE, INITIAL_BUFFER_SIZE, 4);
	//ofSoundStreamStop();
	ofSoundStream2Setup(2,2,this,SAMPLE_RATE, INITIAL_BUFFER_SIZE, 4); /* Call this last ! */
	ofSoundStream2Stop();
	//ofSoundStreamStart();
}
//--------------------------------------------------------------
void mainApp::update(){

	//music
	if (isPlaying)
	{
		float* newBuffer = ofSoundGetSpectrum(8192);
		
		spectrum->addSpectrum(newBuffer);
	}
}

//--------------------------------------------------------------
void mainApp::draw(){
	if(demoSound.isLoaded()){
		if(firstLoaded){
			firstLoaded=false;
			spectrum->clear();
			demoSound.play();
			isPlaying = true;
			spectrum->loadedMusicPlaying=true;
			spectrum->counter=0;
		}
	}
    
	
	if(recording){
		float avg_power = 1.0f;
		float* newBuffer = new float[(int)BUFFER_SIZE];
		myfft.powerSpectrum(0,(int)BUFFER_SIZE/2, left,BUFFER_SIZE,&magnitude[0],&phase2[0],&power[0],&avg_power);
		for(int j=1; j < BUFFER_SIZE; j++) {
			newBuffer[j] = log10(magnitude[j]/155.0+1);		
		}
		spectrum->addSpectrum(newBuffer);
		 
	}
	
	if(reset){
		spectrum->speed = 1;
		spectrum->maxHz = maxHertz;
		spectrum->minHz = 1;
		reset=false;
		
	}	
	
	ofSetColor(255, 255, 255);
	ofRect(0, 0, ofGetWidth(), ofGetHeight());
	
	spectrum->update();
	playerHead->update();
	
	ofSetColor(0, 0, 0);
	ofRect(10, 532, 512, 40);
	
	//I get the points coordinates, from the player header
	 
	vector< pair <float,float > > points = playerHead -> getPoints(BIT);
	for(int n = 0;n<BIT;n++){
		ofSetColor(255, 0, 0);
		amp[n] = (amp[n]*line + spectrum -> getAmp(points[n].first, points[n].second))/(line+1);
		hertzScale[n] = int(spectrum -> getFreq(points[n].second));
		
		float a = (outp[n]-outp[n+1]);
		if (a > .5 or a < - .5) {
			ofSetColor(255, 0, 0,255);
		}else {
			ofSetColor(255, 255, 255,255);
		}
		if (n<INITIAL_BUFFER_SIZE) {
			ofLine(n*2,outp[n]*10.0 + 20 + 532 ,n*2+2,outp[n+1]*10.0 + 20 + 532);
		}
		ofRect(n*1,0 + 532, 1, amp[n]*10.0);
	}
	
	
	float width = (float)(ofGetWidth()) / bufferSize;
     
}
float volume = .2;
int Phases=0;
//--------------------------------------------------------------
void mainApp::audioRequested 	(float * output, int bufferSize, int nChannels){
	//cout << "audioReq";
    
    
    
	if(spectrum->playing){
        
		 
		for (int i = 0; i < bufferSize; i++){
			
			wave = 0.0;
			
			for(int n = 0;n<BIT;n++){
                
				if (amp[n]>0.00001) {
					phases[n] += 512./(44100.0/(hertzScale[n]));
					
					if ( phases[n] >= 511 ) phases[n] -=512;
					
					//remainder = phases[n] - floor(phases[n]);
					//wave+=(float) ((1-remainder) * sineBuffer[1+ (long) phases[n]] + remainder * sineBuffer[2+(long) phases[n]])*amp[n];
					
					wave+=(sineBuffer[1+ (long) phases[n]])*amp[n];
				}
			}
            
			wave/=10.0;
			if(wave>1.0) wave=1.0;
			if(wave<-1.0) wave=-1.0;
		
            
			output[i*nChannels    ] = wave; // You may end up with lots of outputs. add them here
			output[i*nChannels + 1] = wave;
			outp[i] = wave;
		}
         
    
	}else {
		
		for (int i = 0; i < bufferSize; i++){
			output[i*nChannels    ] = 0; /* You may end up with lots of outputs. add them here */
			output[i*nChannels + 1] = 0;
			outp[i] = 0;	
		}
	}

	
}

//--------------------------------------------------------------
void mainApp::audioReceived 	(float * input, int bufferSize, int nChannels){	
	
	//cout << "audioRec";
	/* You can just grab this input and stick it in a double, then use it above to create output*/
	if (recording) {
		for (int i = 0; i < bufferSize; i++){
			left[i] = input[i*2];
			right[i] = input[i*2+1];
			
		}
	}
	
	
}
void mainApp::loadMusic(string target){
	
	//demoSound.loadSound("clocks.mp3");
	demoSound.loadSound(target,true);
	firstLoaded = true;
	
	// zero the buffers out
	
	
}
void mainApp::openMusicFile(){
	spectrum->pause();
	// first, create a string that will hold the URL
	string URL;
	
	// openFile(string& URL) returns 1 if a file was picked
	// returns 0 when something went wrong or the user pressed 'cancel'
	//int response = ofxFileDialogOSX::openFile(URL);
    ofFileDialogResult result = ofSystemLoadDialog("Load Music", false, "");
    
    
	if(result.bSuccess){
        URL = result.filePath;
		// now you can use the URL 
		output = "URL to open: \n "+URL;
		string extension;
		for(int i = URL.length()-3; i < URL.length(); i++)
		{
			extension+=URL[i];
		}
        
		//majd kell ide extension vizsgalatot irni
		loadMusic(URL);
	}else {
		output = "OPEN canceled. ";
	}
}
void mainApp::openFile(string URL){
    
    if(appStarted)
    {
        spectrum->pause();
        // first, create a string that will hold the URL
        
        // openFile(string& URL) returns 1 if a file was picked
        // returns 0 when something went wrong or the user pressed 'cancel'
        if(URL==""){
            ofFileDialogResult result = ofSystemLoadDialog("Open File", false, "");
            
            
            if(result.bSuccess){
                // now you can use the URL
                URL = result.filePath;
                output = "URL to open: \n "+URL;
                string extension;
                for(int i = URL.length()-3; i < URL.length(); i++)
                {
                    extension+=URL[i];
                }
                if (extension == "mp3" or extension == "wav"){
                    loadMusic(URL);
                }else{
                    spectrum->loadImageSpectrum(URL);
                }
            }else {
                output = "OPEN canceled. ";
            }
        }else{
            loadMusic(URL);
        }
    }
	
}
void mainApp::keyPressed(int key)
{
	switch(key){
			/*
			 case 'p':
			 if(isPlaying == false) {
			 demoSound.play();
			 isPlaying = true;
			 spectrum->loadedMusicPlaying=true;
			 spectrum->counter=0;
			 } else {
			 demoSound.stop();
			 isPlaying = false;
			 spectrum->loadedMusicPlaying=false;
			 } 
			 break;*/
		case 'o':
            
			openFile();
			break;
		case 'm':
			if(recording==false){
				ofSoundStream2Start();
				
				spectrum->clear();
				spectrum->loadedMusicPlaying=true;
				spectrum->counter=0;
				
				recording=true;
			}else {
				recording=false;
				
				spectrum->loadedMusicPlaying=false;
				spectrum->reloadTexture(2);
			}
			break;
		case 32:
			if(spectrum->loadedMusicPlaying){
				
				spectrum->loadedMusicPlaying=false;
				isPlaying = false;
				recording=false;
				
				demoSound.stop();
				spectrum->reloadTexture(2);
				
			}else if (spectrum->playing) {
				spectrum->pause();
				ofSoundStream2Stop();
				cout << "stop";
			}else {
				spectrum->play();
				ofSoundStream2Start();
				cout << "play";
			}

				
			break;
    }
	
	
}
void mainApp::play () {
    if(spectrum->loadedMusicPlaying){
        
        spectrum->loadedMusicPlaying=false;
        isPlaying = false;
        recording=false;
        
        demoSound.stop();
        spectrum->reloadTexture(2);
        
    }else if(!spectrum->playing) {
        spectrum->play();
        ofSoundStream2Start();
        cout << "play";
    }
}

void mainApp::stop () {
    if(spectrum->loadedMusicPlaying){
        
        spectrum->loadedMusicPlaying=false;
        isPlaying = false;
        recording=false;
        
        demoSound.stop();
        spectrum->reloadTexture(2);
        
    }else if (spectrum->playing) {
        spectrum->pause();
        ofSoundStream2Stop();
        cout << "stop";
    }
}
/*
 gui.addSlider("Speed", spectrum->speed, 0.0, 20.0);
 gui.addButton("Open Picture", openf);
 gui.addButton("Open Music", openm);
 gui.addToggle("Invert", spectrum->invert);
 gui.addToggle("Contrast", spectrum->square);
 gui.addSlider("Spectrum Max HZ", spectrum->maxHz,300.0, 5000.0);
 gui.addSlider("Spectrum Min HZ", spectrum->minHz,1.0, 100.0);
 gui.addSlider("LINE", line = 3.0,0.0, 20.0);
 
 
 gui.addToggle("reset", reset);
 //	gui.addSlider("Spectrum Min HZ", spectrum->minHz,0.1, 100.0);
 
 gui.show();
 */

void mainApp::setSpectrumSpeed(float speed)
{
    if(appStarted)
    {
        spectrum->speed = speed;
    }
}
void mainApp::setMinHz(float speed)
{
    if(appStarted)
    {
        spectrum->minHz = speed;
    }
}
void mainApp::setMaxHz(float speed)
{
    if(appStarted)
    {
        spectrum->maxHz = speed;
    }
}

void mainApp::close()
{
	spectrum->pause();
}

//--------------------------------------------------------------

void mainApp::keyReleased(int key)
{ 
}

//--------------------------------------------------------------

void mainApp::mouseMoved(int x, int y)
{
    playerHead->mouseMoved(x,y);
}

//--------------------------------------------------------------

void mainApp::mouseDragged(int x, int y, int button)
{
    playerHead->mouseDragged(x,y,button);
}

//--------------------------------------------------------------

void mainApp::mousePressed(int x, int y, int button)
{
    playerHead->mousePressed(x,y,button);
}

//--------------------------------------------------------------

void mainApp::mouseReleased(int x, int y, int button)
{
    playerHead->mouseReleased(x,y,button);
}

//--------------------------------------------------------------
void mainApp::windowResized(int w, int h){
	
}
void mainApp::dragEvent(ofDragInfo info) {
    openFile(info.files[0]);
}