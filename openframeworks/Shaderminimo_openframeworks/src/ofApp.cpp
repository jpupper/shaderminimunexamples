#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	ofSetWindowShape(600, 600);
	shader.load("", "lala.frag");
	fbo.allocate(ofGetWidth(), ofGetHeight());
}

//--------------------------------------------------------------
void ofApp::update(){
	ofSetColor(255, 255);
	fbo.begin();
	shader.begin();
	//update_globalUniforms();
	//update_NonglobalUniforms();
	shader.setUniform2f("resolution", ofGetWidth(), ofGetHeight());
	shader.setUniform2f("mouse", ofMap(ofGetMouseX(), 0, ofGetWidth(), 0, 1), ofMap(ofGetMouseY(), 0, ofGetHeight(), 0, 1));
	shader.setUniform1f("time", ofGetElapsedTimef());
	ofRect(0, 0, ofGetWidth(), ofGetHeight());
	shader.end();
	fbo.end();
}

//--------------------------------------------------------------
void ofApp::draw(){
	ofDrawRectangle(100, 100, 20, 20);
	fbo.draw(0, 0, ofGetWidth(), ofGetHeight());
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
