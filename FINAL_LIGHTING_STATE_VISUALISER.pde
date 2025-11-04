// THEATRE LIGHTING STATE VISUALISER
// Stars appear, sttars move, stars stop, stars explode, the black screen becomes a red screen, and a red rotating pattern appears

int scene = 0;  // Int = intager (is a whole number) in this case it tracks which scene were on (starts at 0)

int STAR_COUNT = 600;  // Indicates the number of stars in the sky (initally started with less but doubled to fill screen better)
ArrayList<Star> stars = new ArrayList<Star>();  // List (ArrayList) this is a dynamic list kind of like a magic basket to hold all the star objects eg.stores the stars in the night sky
float y_direction = 1;  // Float = a decimal number (gives more control than an int) AND begins variable y_direction / this indicates the direction the stars move in (downward) staring at 1 (each star moves down 1 pixel per frame)

ArrayList<Firework> fireworks = new ArrayList<Firework>();  // a new Arraylist to hold all fireworks when they explode
PVector gravity = new PVector(0, 0.12);  // Creates the gravity effect, PVector = Processing Vector is x,y positions that pull down at 0.12 pixels per frame (gives a realistic firework look)

// Variables for the red rotating pattern I created at the beginning of this project; I realiesed that these setup variables arnt used in this final version but wanted to include them to indicate this code is flexible and evolving. in theory i could add animation to these lines lates to make the screen spin etc.
float AngleStart = 0;  
float AngleBump = 0;
float Speed = .7;

void setup() {  // setup runs one time only when the play button is selcted
  size(800, 800);  // Makes the screen an 800x800 window
  background(0);  // Starts black 0 indicated the colour which is black on Processings greyscale colour chart I utulised
  for (int i = 0; i < STAR_COUNT; i++) {  // opens up a loop and makes 600 stars
    stars.add(new Star());  // Indicates that it should add each new star to the list
  }
}

void draw() {  // draw is a function that runs over and over
  background(0);  // again indicates to start with a black background

  if (scene == 0) {  // establishes "if we are in scene 0 do this"
    background(0);  // a black screen
  }

  else if (scene == 1) {  // else if = check if we are in scene 0 if not move on to scene 1.
    for (Star s : stars) s.display();  // for statement is for ever star in the array list now draw on the screen
  }

  else if (scene == 2) {  // else if statement = checks if wev are in scene 2 
    for (Star s : stars) {  // this creates the looping for every star in the array list so that the sky is filled
      s.display();  // Show the stars, or the little white spots 
      PVector direction = new PVector(0, y_direction);  // y_direction this means move vertically in this case slowly because the value is 1
      s.move(direction);  // this code says to actually use this movement to change the positions (because of the prev draw() function it appears smooth)
    }
  }

  else if (scene == 3) {  // check if we are in scene 3 do the following:
    for (Star s : stars) s.display();  // this bit indicates to still show the stars but no longer the movement
  }

  else if (scene == 4) {  // check if scene 4 do the following
    if (fireworks.isEmpty()) {  // at the beginning of the scene check fireworks havnt already happened
      for (Star s : stars) {  // Go through each of the 600 stars
        fireworks.add(new Firework(new PVector(s.x, s.y), s.col));  // adds a new firework to the list then gives it the same position as the star and in the same colour
      }
    }

    fill(0, 30);  // creates a black transluscent 'cover' over the screen so that the effect looks smooth
    noStroke();  // No boarder around this
    rect(0, 0, width, height);  // this shows how large to make that transluscent to cover whole screen

    for (int i = fireworks.size() - 1; i >= 0; i--) {  //a backwards loop that gives the number of fireworks alive and the 'i' indicate to subtract 1 each time
      Firework f = fireworks.get(i);  // get = pick one firework from the magic basket (array list)
      f.update(gravity);  //  f. is just the firework variable and tells to add gravity like a downward pull
      f.show();  // actually appear on screen
      if (f.done()) fireworks.remove(i);  // then remove when its done
    }

    if (fireworks.isEmpty()) scene = 5;  // once the fireworks are done and screen is empty this is scene 5
  }

  else if (scene == 5) {  // if it IS scene 5 the screen is black again
    background(0);  // colour 0 for black background
  }

  else if (scene == 6) {  // however if at scene 6 this is a red screen
    background(127, 0, 0);  // 127 is the colour deep red that fills the background
  }

  else if (scene == 7) {  // however if it is scene 7  means we will move on to red rotating pattern
    background(color(127, 0, 0));  // Red background colour
    translate(width/2,height/2);  // shifts the centre to the middle of the page 
    for(int a=0; a<360; a+=2) {  // creates a loop to draw lines all around the circle seperated by 2 degrees to form a circular pattern
      float x = random(50,150);  // Randomise the start distance
      float xx = random(150, 350);  // Randomise the end distance
      pushMatrix();  // Save rotation position because its about to spin this makes sure it returns after
      rotate(radians(a));  // Rotate by “a” degrees in this case a goes from 0 to 360 
      line(x,0,xx,0);  // Draw the line
      popMatrix();  // Reset rotation so the pattern spirals.
    }
  }
}

// newly implemented and was a stretch goal for me. to use 'GO' buttons.
void keyPressed() { // a processing function that runs when you press any key on the keyboard 
  if (scene == 2) {  // check if we are in scene 2
    y_direction = 2;  // Any key when pressed will make the stars move down at speed 2
  }

  scene++;  // this adds 1 scene variable so its as if moving on to the next scene (like pressing a cue button as a stage manager)
  if (scene > 7) scene = 0;  // If we past last scene loop back to black
}

// this next section defines what a star is in my code and how it behaves
class Star { // a class is a template for making objects
  float x, y, size;  // these are the variables that will show the position and size of the star (ive used float because its smooth with the decimals)
  int col;  // this is what the color of the star is 

  Star() {  // This tells the code to run when a new star is made
    x = random(width);  // signals a random x position
    y = random(height);  // signals a random y position
    size = random(1, 3);  // signals a random size
    col = color(255);  // establishes that the stars are white
  }

  void display() {  //  void = just means no output and makes the stars visable 
    fill(col);  // sets the colour of the star which we already established is 255 or white
    noStroke();  // indicates to have no outline
    ellipse(x, y, size, size);  // indicates to processing to draw a small circle
  }

  void move(PVector dir) {  // i have used the processing vector previously but this just makes the stars move
    x += dir.x;  // Add horizontal movement (left or right)
    y += dir.y;  // Add vertical movement (up or down)
    if (y > height) y = 0;  // this creates the looping effect so the stars can appear forever
  }
}

// Firework class will be one explosion per star
class Firework { // again indicating a class will tell processing how the fireworks behave
  ArrayList<Particle> particles;  // establishes an array list, each firework is make up of particles 
  int baseColor;  // establishes the color of explosion which will match the star

  Firework(PVector pos, int c) {  // runs only once when the star is made, tells it where to appear (pos) and the colour (c)
    baseColor = c; // saves the colour to memory
    particles = new ArrayList<Particle>(); // makes the empty list that will be filled with particles
    int n = 80;  // establishes how many particles in each explosion = 80
    for (int i = 0; i < n; i++) particles.add(new Particle(pos, baseColor));  // this loop will run 80 times and each time it runs it will create a new particle and add it to the array list
  }

  void update(PVector g) {  // Moves all sparks and applies gravity (g) keeping the movements smooth
    for (int i = particles.size() - 1; i >= 0; i--) { // creates a loop to go backward (i--) through the particles
      Particle p = particles.get(i); // this line retrives one particle from the list
      p.applyForce(g);  // then tells it to apply gravity (g) to the selected particle
      p.update();  // this is in refrence to the update() function from before that gives the particle its movement
      if (p.isDead()) particles.remove(i);  // then once the particle has dissapeared tell it to remove from the list looping backwards
    }
  }

  void show() {  // this creates the loops that makes the particles appear
    for (Particle p : particles) p.display(); // calls on the display function to determine how each particle will look
  }

  boolean done() {  // according to google boolean is named after a scientist George Boole (not relevant to the code just thought it was fun). boolean means there is only 2 option and is used for yes/no scenarios like this. "is this firework done" yes/no
    return particles.isEmpty(); // checks when there is no items left in the array list
  }
}

// Particle class = this is a new class where a particle is a single spark in an explosion
class Particle { // creates a new particle class for the array list
  PVector pos, vel, acc;  // (PVector) represents motion in space and again determines the position, velocity, acceleration
  float life = 255;  // 255 is processings max colour value and the life will be subtracted in each frame until its nothing
  int baseColor;  //  the color of the spark

  Particle(PVector origin, int c) { // origin = where the spark starts and c = the colour
    baseColor = c;  // be the same color as the star
    pos = origin.copy();  // Start from where the star was and .copy() means each particle will have its own position
    vel = PVector.random2D();  // allocates a random direction in 2D space
    vel.mult(random(2, 5));  // allocates a random speed between 2 and 5 so that they each go at different paces, this makes it a more organic shape
    acc = new PVector(0, 0);  // No force at will be applied at the start
  }

  void applyForce(PVector f) { acc.add(f); }  // this applies force (like gravity) to the particle known as f. it indicates direction and stregth the add just means add f to the particle

  void update() {  // updates the particles life so it fades out eventually 
    vel.add(acc);  // the velocity will add speed
    pos.add(vel);  // position changes depending on the speed (vel)
    acc.mult(0);  // this resets the acceleration back to zero
    life -= 4;  // subtract 4 from 255 each frame until it dissapears 
  }

  void display() {  // Draw one spark
    stroke(baseColor, life);  // the brightness of colour will depend on how much life of 255 is left
    strokeWeight(2);  // Makes the dot thick enough to see ive set it to 2
    point(pos.x, pos.y);  // Draw as a point on the page 
  }

  boolean isDead() { return life < 0; }  // this indicates a 'true' statement for the boolean if the life has dropped below 0
}
  
