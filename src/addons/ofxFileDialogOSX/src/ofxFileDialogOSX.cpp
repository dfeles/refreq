/*
 *  ofxFileDialogOSX.cpp
 *
 *  Created by timknapen on 07/05/10.
 *	www.wereldderindianen.be
 *	code stolen from 'mantissa' over here:
 *	http://www.openframeworks.cc/forum/viewtopic.php?p=5028#p5028
 *
 */

#include "ofxFileDialogOSX.h"


//---------------------------------------------------------------------------------
int ofxFileDialogOSX::saveFile(string& URL, string& fileURL){
    
	short fRefNumOut;
	FSRef output_file;
	OSStatus err;
    
	NavDialogCreationOptions options;
	NavGetDefaultDialogCreationOptions( &options );
	options.modality = kWindowModalityAppModal;
    
	NavDialogRef dialog;
	err = NavCreatePutFileDialog(&options, '.mov', 'Moov', NULL, NULL, &dialog);
	err = NavDialogRun(dialog);
    
	NavUserAction action;
	action = NavDialogGetUserAction( dialog );
	if (action == kNavUserActionNone || action == kNavUserActionCancel)	return 0;
    
	NavReplyRecord reply;
	err = NavDialogGetReply(dialog, &reply);
	if ( err != noErr )	return 0;
    
	if ( reply.replacing )
	{
		printf("need to replace\n");
	}
    
	AEKeyword keyword;
	DescType actual_type;
	Size actual_size;
	FSRef output_dir;
	err = AEGetNthPtr(&(reply.selection), 1, typeFSRef, &keyword, &actual_type,
					  &output_dir, sizeof(output_file), &actual_size);
    
    
    
	CFURLRef cfUrl = CFURLCreateFromFSRef( kCFAllocatorDefault, &output_dir );
	CFStringRef cfString = NULL;
	if ( cfUrl != NULL )
	{
		cfString = CFURLCopyFileSystemPath( cfUrl, kCFURLPOSIXPathStyle ); // LEAK?
		CFRelease( cfUrl );
	}
    
	// copy from a CFString into a local c string (http://www.carbondev.com/site/?page=CStrings+)
	const int kBufferSize = 255;
    
	char folderURL[kBufferSize];
	Boolean bool1 = CFStringGetCString(cfString,folderURL,kBufferSize,kCFStringEncodingMacRoman);
    
	char fileName[kBufferSize];
	Boolean bool2 = CFStringGetCString(reply.saveFileName,fileName,kBufferSize,kCFStringEncodingMacRoman);
    
	URL = folderURL;
	fileURL = fileName;
	// cleanup dialog
	NavDialogDispose(dialog);
	// dispose of reply:
	NavDisposeReply(&reply);
	// dispose of cfString
	CFRelease( cfString );
    
    
	return 1;
}


//---------------------------------------------------------------------------------
int ofxFileDialogOSX::openFile(string& URL){
    
	short fRefNumOut;
	FSRef output_file;
	OSStatus err;
    
	NavDialogCreationOptions options;
	NavGetDefaultDialogCreationOptions( &options );
	options.modality = kWindowModalityAppModal;
	// adding a banner
	// options.message =  CFStringCreateWithCString(kCFAllocatorDefault, "hello world", kCFStringEncodingMacRoman);
	NavDialogRef dialog;
    
	err = NavCreateGetFileDialog(&options, NULL, NULL ,NULL, NULL, NULL, &dialog);
	err = NavDialogRun(dialog);
    
	NavUserAction action;
	action = NavDialogGetUserAction( dialog );
    
	if (action == kNavUserActionNone || action == kNavUserActionCancel) {
		cout << "no action or action cancel" << endl;
		return 0;
	}
    
	// get dialog reply
	NavReplyRecord reply;
	err = NavDialogGetReply(dialog, &reply);
	if ( err != noErr ){
		cout << "error getting DialogReply" << endl;
		return 0;
	}
	if ( reply.replacing )
	{
		cout << (" need to replace\n ") << endl;
	}
    
	AEKeyword keyword;
	DescType actual_type;
	Size actual_size;
	FSRef output_dir;
	err = AEGetNthPtr(&(reply.selection), 1, typeFSRef, &keyword, &actual_type,
					  &output_dir, sizeof(output_file), &actual_size);
    
	CFURLRef cfUrl = CFURLCreateFromFSRef( kCFAllocatorDefault, &output_dir );
	CFStringRef cfString = NULL;
	if ( cfUrl != NULL )
	{
		cfString = CFURLCopyFileSystemPath( cfUrl, kCFURLPOSIXPathStyle );
		CFRelease( cfUrl );
	}
    
	// copy from a CFString into a local c string (http://www.carbondev.com/site/?page=CStrings+)
	const int kBufferSize = 255;
    
	char fileURL[kBufferSize];
	Boolean bool1 = CFStringGetCString(cfString,fileURL,kBufferSize,kCFStringEncodingMacRoman);
	URL = fileURL;
	// cleanup dialog
	NavDialogDispose(dialog);
	// dispose of reply:
	NavDisposeReply(&reply);
	// dispose of cfString
	CFRelease( cfString );
	return 1;
}