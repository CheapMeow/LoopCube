# LoopCube

## Introduciton

You are chasing the blue cube but stuck in a loop path

It is a gamejam achievement which theme is loop

Made in Godot 3.5.1, using temlpate: https://github.com/BenjaminNavarro/godot-template-2d

## Tutorial

WASD or Arrow keys control movement

Space Key control jump

Target is to catch blue cube

## Elsewhere

itch.io: https://cheapmeow.itch.io/loopcube

Youtube: https://youtu.be/7w3esMJgXfY

## Screenshots

![1](https://user-images.githubusercontent.com/88229072/213200936-48a620ba-8052-4660-b693-52be89a8337e.jpg)

![2](https://user-images.githubusercontent.com/88229072/213200953-2c22d9ae-67a3-45b6-b2cc-0c7b4e053a5e.jpg)

![3](https://user-images.githubusercontent.com/88229072/213200976-b417d642-15b6-42dc-9082-1e5ebcb902ad.jpg)

![4](https://user-images.githubusercontent.com/88229072/213201004-3bfb8157-2efe-4333-93a9-ed2832d83683.jpg)

![5](https://user-images.githubusercontent.com/88229072/213201024-24ac2906-264b-4da5-bb6e-6be034ef3c4d.jpg)

## Level Explanation

### Level1

The blue square moves in a circular motion with a fixed center and a fixed radius, taking the meaning of the rotation of the circle to point the circle.

Program: Use (player to target) cross product (center to target) to calculate the rotation speed of the blue square around the center of the circle.

If the player approaches the target along the tangential direction of the movement of the blue square, it will instead make the target move faster.

The solution is to approach the target along the radial direction of the blue square's movement, so that the target's movement range is small.

### Level2

Sisyphus will push a boulder from the bottom of the mountain forever and ever, and every time the boulder reaches the top of the mountain, the stone will roll back to the original point.

This level is modeled after the mythology, placing blue squares where you have to push stones to reach them. Pushing the stone to the top of the mountain cannot always push down the blue square, it needs a certain angle and strength, which is where the difficulty and fun of the game lie.

Program: fully hosted by physical, with minimal amount of code.

### Level3

The direction of movement of the main character and the blue square is opposite. However, the protagonist cannot walk directly with the blue square, because there are obstacles in the middle of the map.

If you want to avoid obstacles and find other ways to try to get closer to each other, you will only end up at the two poles of mutual movement forever, and the cycle continues.

The solution is to hit the obstacle, according to the nature of the obstacle, get stuck on the blue square, change the position of the blue square relative to the protagonist, and finally make there is no obstacle between the two.

Program: Copy and paste protagonist's control code and add a minus sign.

### Level4

In the third level, the two are in a cycle of getting close to each other but cannot touch each other. Naturally, there is another cycle of movement away from each other. This is how the fourth level came out.

There are many forms of moving away from each other, here is still the way of using gravity.

Calculate the position of the protagonist relative to the center point of the map, and the opposite direction of the obtained vector is the direction of gravity that keeps the other away from the protagonist.

Added Tilemap rotation and some decorations to make the gravity direction change more noticeable.

Program: calculate gravity vector, Tilemap rotation, others hosted by physics.

### Level5

Simply making a misleading layout for the player will make the player try the intuitively least effortful solution. If the solution does seem to be close to success, then the player may still be willing to try this dead end even if they find that their intuition is wrong. In the end, the player is caught in a cycle of "failure"-"research this dead end, try again"-"fail again"-"research this line of thought again".

Here, following Mario's classic clearance interface, a level is made to seduce people to jump over the flagpole. The player jumps from the top of the step just short of the flagpole, but always one step short.

The solution is to walk towards the borders of the map, and the player will teleport from one border to the other. This is the exact opposite direction of the dead end players have been trying to do.

Program: Teleportation Boundary.
