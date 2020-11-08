class Block {
 PVector pos, dim; //dim is dimension of block
 
 Block(PVector pos, PVector dim){
  this.pos=pos;
  this.dim=dim;
 }
 
 boolean isOn(Character c){
  if(abs(c.pos.x - (pos.x)) < (c.dim.x / 2 + dim.x / 2)){
   return true; 
  }
  return false;
 }
  
  boolean bump(Character c) {
   if(abs(c.pos.x-(pos.x)) < (c.dim.x /2 + dim.x / 2) && 
      abs(c.pos.y-(pos.y)) < (c.dim.y /2 + dim.y / 2)) {
        return true;
    }
  return false;

  }
  
  void drawMe(){
   noStroke();
   pushMatrix();
   fill(color(0));
     translate(pos.x, pos.y);
     rect(-dim.x/2 , -dim.y/2 , dim.x , dim .y);
     for(int i=0; i<((int)(dim.x/40)); i++){
      for(int j=0; j<(((int)(dim.y/40))); j++){
        fill(color(218,165,32));
        pushMatrix();
        translate(-dim.x/2 + i*40, -dim.y/2 + j*40);
        triangle(5, 5, 35, 5, 5, 35);
        popMatrix();
      }
    }
   popMatrix();
   
  }
  
  void drawBrigde()
  {
   pushMatrix();
     translate(pos.x,pos.y);
   popMatrix();
  }
 }
  