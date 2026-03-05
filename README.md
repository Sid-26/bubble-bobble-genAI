Bubble Bobble Clone (Godot 4.5.1)

How to run:
- Open project in Godot 4.5.1
- Hit Run Project on top right or press F5
- Note: Must set main scene to Menu.tscn in Project > Project Settings > Run

Controls (InputMap):
- move_left A/LEFT
- move_right: D/RIGHT
- jump: W/UP
- fire: SPACE
- start: SPACE
- restart: SPACE

Implemented features:
- [✅] Player movement + jump
- [✅] TileMap collisions
- [✅] Bubble shooting
- [✅] Enemies patrol
- [✅] Trap mechanic
- [✅] Pop + score + HUD
- [✅] Game over + restart

Bonus:
- [✅] Implemented a fruit drop that gives player a power up. It's 50% chance of dropping from popping enemy bubbles and it gives the player a 50% speed boost for 3 seconds.

Notes / known issues:
- No sounds added
- Bubble can go through walls
- No win state
- Tried to generate tilemap via code but it crashes the game, code is in the game but unused