# Lighting State Visualiser

This project was born in order to provide a solution to a problem I faced in my life as an indie theatre producer. Limited funds and limited time meant that it was near impossible to smoothly bump in the technical elements of a show. 
The lighting state visualiser is a projection-based lighting state visualiser that enables a stage manager to preview running a show top to bottom before even stepping foot in a theatre. It operates using 'go buttons' to progress through scenes. 
This prototype uses the coding environment Processing and the coding language Java. 

## Usage
Simply press any button on the keyboard to progress to the next scene.

## Scene Breakdown
- Scene1: A black screen (mimicing a blackout)
- Scene2: Stars appear
- Scene3: Starts move 
- Scene4: Stars stop
- Scene5: Stars explode
- Scene6: A black screen again
- Scene7: A red screen
- Scene8: A trippy red rotating pattern

# Visual Example
Youtube link to screen recoring of operational code: https://youtu.be/3ibXOrqtJtk

# Features
# Scene Based Sequencing
- the program runs through 8 distinct scenes each represented by a visual lighting cue
- each is triggered manually using 'go buttons' mimicing a stage manager
- built using (int scene) variables and (if else) statements. all inside draw() function to switch betewwn states 

# Go Button Interactions 
- an interactive keyboar controlled sysem. Press any key to move on to the next scene. Intergrated using keyPressed() function.
- offers flexibility for live performance

# Solar Systen Generation
- Uses ArrayList of Star objects 
- Each has a randomised position, brightness and size
- The star class uses a move() function with PVector to create movement
- intergrated an infinate loop 

# Firework Particles
- Firework and Particle classes created
- Gravity is simulated using downward PVector
- Particles fade naturally when life <0

# Red Roataing Pattern
- Built with for loop rotating every 2 degrees
- inspired by @thedotisblack 'Generative Circle Tutorial'

# Room for improvement 
Improved User Interactivity
- Integrate mouse or touchpad input for cue control
- eg. a controller slider could fade between scenes or a mouse drag could affect star movement or firework spread
- this would help the project more closely mimic real-world lighting desks

Expanded Lighting Effects
-	additional visual cues eg. olour gradients, visual artworks or fade transitions
-	scene-based effects that replicate theatre lighting techniques eg. wash, strobe, focus
This would make the visualiser a lighting design tool

Audio Synchronisation
-	sync visuals to audio cues
-	could use sound to trigger lighting change eg. fireworks could respond to music tempo or sound effects.

# Citations 
Christopher Ockerby. (2017, October 22). 03 - Processing - creating a button class [Video]. YouTube. https://www.youtube.com/watch?v=z903vXot-Lg 
Color. (n.d.). Processing. https://processing.org/tutorials/color 
KeyPressed() / reference. (n.d.). Processing. https://processing.org/reference/keyPressed_.html 
Mr Johnson Computing. (2020, March 31). Animating stars in processing [Video]. YouTube. https://www.youtube.com/watch?v=ixD-sZ2tSu0 
Programming Chaos. (2022, December 5). Programming fireworks using particles [Video]. YouTube. https://www.youtube.com/watch?v=tWqeWJikOCI 
Rotate / examples. (n.d.). Processing. https://processing.org/examples/rotate.html Rotate 1 / examples. (n.d.). Processing. https://processing.org/examples/rotatexy.html 
Simple particle system / examples. (n.d.). Processing. https://processing.org/examples/simpleparticlesystem.html 
The Coding Train. (2021, March 9). 4.1: Particle System Simulation - the Nature of code [Video]. YouTube. https://www.youtube.com/watch?v=syR0klfncCk 
thedotisblack creative coding. (2018, July 27). Ep.1 Processing tutorial | GENERATIVE CIRCLE with line and loop (Creative coding, Generative art) [Video]. YouTube. https://www.youtube.com/watch?v=UZoVBMgzULk

# Project Status
No longer being worked on however unfinished (only a prototype).
