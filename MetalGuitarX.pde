/* @pjs preload="electric_guitar_stock_png_by_doloresdevelde-d5at701.png, electric_guitar_stock_png_by_doloresdevelde-d5at701_small.png"; 
 */

//The MIT License (MIT) - See Licence.txt for details

// Metal guitar with distortion (and particles!!1)
//
// by George Litos (gl@cyberpunk.gr)
// based on examples by Mick Grierson, Matthew Yee-King, Marco Gillies
//
// data files from :
// http://doloresmd.deviantart.com/art/Electric-Guitar-stock-png-320489137
// http://www.playonloop.com/2010-music-loops/the-survival/
// http://www.freesound.org/people/dobroide/sounds/69564/

Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
ParticleSystem ps;

PImage img;
float power=0;
boolean playit = true;

void setup() {  
  size(300, 400);
  ps = new ParticleSystem(new PVector(width/2, 50));
  frameRate(25); // this is the framerate. Tweak for performance.
  img = loadImage("electric_guitar_stock_png_by_doloresdevelde-d5at701_small.png");
  maxim = new Maxim(this);
  // loop
  player = maxim.loadFile("The_Surv-PlayOnLo-10514_hifi.mp3");
  player.setLooping(true);
  player.setAnalysing(true);
  player.volume(0.50);
  // guitar
  player2 = maxim.loadFile("69564__dobroide__20090322-moo.wav");  
  player2.volume(1.0);
}

void draw() {

  background(0);
  ps.origin.set(mouseX, mouseY, 0);    
  ps.addParticle();
  ps.run();
  fill(255);
  tint(255, 128); 
  image(img, mouseX/30, -mouseX/50, width, height);

  if (playit) {
    player.play();
    power = player.getAveragePower();
    ellipse(mouseX, mouseY, power*500, power*500);
  }
}

void mousePressed() 
{
  player2.stop();
  player2.play();
}

void mouseDragged()
{  
  player2.play();
  player2.ramp(1., 1000);
  player2.speed((float) mouseX*1.8/width);
}

