PImage img;

void setup() {
  size(600, 600, P3D);
  String url ="https://pbs.twimg.com/ext_tw_video_thumb/1044185757374590976/pu/img/bxP-NSMpkyWfeeqM.jpg";
  img = loadImage(url, "jpg");
  img.resize(600, 600);
}

void draw() {
  background(#f1f1f1);
  fill(0);
  noStroke();
  sphereDetail(3);
  float tiles = 100;
  float tileSize = width/tiles;
  push();
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float b = map(brightness(c),0,255,1,0);
      float z = map(b,0,1,-150,150);
      
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      fill(c,200);
      sphere(tileSize*b*0.8);
      pop();
      
    }
  }
  pop();
}
