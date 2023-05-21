/*         
GARDEN SIMULATOR
WASD to move 
1 to equip hoe, 2 to equip watering can, 3 to equip seed
E to fill watering can ( MUST BE NEAR WATER )
Click area next to player to use hoe/water 
*/
int water;
int seeds;
String[] items = new String[]{"nothing", "seed", "water", "shovel"};
int curItem;
int size = 32;
int w, h;

PImage river;
PImage grass;
PImage border;
Player me;

PImage[] itemPics ; 
Land area;

void setup(){
  background(169,206,150);
  size(1120,800);
  w = width/size;
  h = height/size;
  river = loadImage("Water.png");
  grass = loadImage("Grass.png");
  border = loadImage("grassborder.png");
  me = new Player();
  itemPics = new PImage[]{loadImage("hoe.png"),loadImage("water bucket.png"),
                              loadImage("fruit seeds.png")};
  area = new Land();
}

void draw(){
  drawRiver();
  area.plot();
  drawBorder();
  drawGrid();
  drawPlayer();
  drawItems();
  frameRate(20);
}

void drawItems(){
  //fill(255);
  //rect(0, 576 , 192 , 64);
  image(itemPics[0], 0, 608, 32, 32);
  image(itemPics[1], 65, 610, 30, 30);
  image(itemPics[2], 129, 610, 30, 30);
}

void drawPlayer(){
  me.drawPlayer();
}

void drawRiver(){
  for(int x = 0 ; x < width; x+= 128){
    for(int y = 546; y < height; y += 32){
      image(river, x, y, 128, 32);
    }
  }
}

void drawBorder(){
  /*for(int x = 0 ; x < width; x+= 32){
    for(int y = 0; y < 576; y += 32){
      image(grass, x, y, 96, 32);
    }
  }*/
  for(int x = 0; x < width; x += 2080){
    image(border, x, 576, 3000, 15);
  }
}


void drawGrid(){
  for(int x = 0; x < width; x += size){ 
      stroke(255);
      line(x, 0, x, height);
  }
  for(int y = 0; y < height; y += size){
    stroke(255);
    line(0,y,width, y);
  }
}

void mouseClicked(){
    //*MAKE THE GRASS INTO DIRT
    //if (grass[mouse.x, mouse.y] == still grass)
    
}

void keyPressed (){
  if((key == 'W' || key == 'w') && me.getPos().y > 0)
    me.direction(0); // up
  if((key == 'S' || key == 's') && me.getPos().y <= 512)
    me.direction(1); // down
  if((key == 'A' || key == 'a') && me.getPos().x > 0)
    me.direction(2); //left
  if((key == 'D' || key == 'd') && me.getPos().x < width - size)
    me.direction(3); //right
  if(key == '1'){
    me.equip(1);
  } 
  if(key == '2'){
    me.equip(2);
  }
  if(key == '3'){
    me.equip(3);
  }
  if(key == 'e' || key == 'E'){
    if(me.getCan())
      me.fillWater();
  }
}
