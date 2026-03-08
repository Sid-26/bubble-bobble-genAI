Forked from: https://github.com/Sid-26/bubble-bobble-godot


# Bubble Bobble Clone (Godot 4.5.1)

## How to run:
- Open project in Godot 4.5.1
- Hit Run Project on top right or press F5
- Note: Must set main scene to Menu.tscn in Project > Project Settings > Run

> Note: Created export builds for windows and linux in `builds/`
To access builds go to `builds` and choose `windows` or `linux` based on your OS.

> For windows, run the exe file

### Linux instructions
1. Download the Linux archive and extract it to a folder.
2. Open your terminal and navigate to the extracted folder.
3. Make the file executable by running: 
   `chmod +x BubbleBobble.x86_64`
4. Run the game with: 
   `./BubbleBobble.x86_64`

## Controls (InputMap):
- move_left A/LEFT
- move_right: D/RIGHT
- jump: W/UP
- fire: SPACE
- start: SPACE
- restart: SPACE

## Implemented features:
- [✅] Player movement + jump
- [✅] TileMap collisions
- [✅] Bubble shooting
- [✅] Enemies patrol
- [✅] Trap mechanic
- [✅] Pop + score + HUD
- [✅] Game over + restart

## Bonus:
- [✅] Implemented a fruit drop that gives player a power up. It's 50% chance of dropping from popping enemy bubbles and it gives the player a 50% speed boost for 3 seconds.

## Notes / known issues:
- No sounds added
- Bubble can go through walls
- No win state
- Tried to generate tilemap via code but it crashes the game, code is in the game but unused

## Changelog for this fork
- Added AI generated assets in `assets_ai/`
- Added documentation for assets in `docs/`
