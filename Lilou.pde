int numberOfImages = 82;
AlteredImage[] images;
int currentFrame = 1;
PImage imageToLoadNext;

void setup() {
  size(642, 319);
  images = new AlteredImage[numberOfImages];
  frameRate(8);
  for (int i = 1; i < images.length; i++) {
    imageToLoadNext = loadImage("lilou" + (i)+ ".png");
    images[i] = new AlteredImage(imageToLoadNext);
    images[i].setPosition(0, 0);
  }
}

void draw() {
  images[currentFrame].updateImage();
  currentFrame++;
  if (currentFrame >= images.length) {
    currentFrame = 1;
  }
}

class AlteredImage {

  PImage myImage;
  int myXPosition;
  int myYPosition;

  AlteredImage(PImage thisWillBeMyImage) {
    myImage = thisWillBeMyImage;
    myImage.resize(642,319);
  }


  void setPosition(int requestedXPosition, int requestedYposition) {
    myXPosition = requestedXPosition;
    myYPosition = requestedYposition;
  }

 
    
  void updateImage() {
    image(myImage, myXPosition, myYPosition);
    myImage.loadPixels();


    ////loop over the pixels in myImage and make some changes. See
    //// https://processing.org/reference/createImage_.html


    myImage.updatePixels();
  }
}