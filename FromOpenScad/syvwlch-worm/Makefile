all: stls/gearonly-15teeth.stl stls/gearonly-16teeth.stl stls/gearonly-17teeth.stl stls/gearonly-18teeth.stl stls/wormonly.stl

stls/gearonly-15teeth.stl: worm-gears.scad
	openscad -D numberTeeth=15 -D pitchRadius=15 -D printWorm=0 -o stls/gearonly-15teeth.stl worm-gears.scad

stls/gearonly-16teeth.stl: worm-gears.scad
	openscad -D numberTeeth=16 -D pitchRadius=16 -D printWorm=0 -o stls/gearonly-16teeth.stl worm-gears.scad

stls/gearonly-17teeth.stl: worm-gears.scad
	openscad -D numberTeeth=17 -D pitchRadius=17 -D printWorm=0 -o stls/gearonly-17teeth.stl worm-gears.scad

stls/gearonly-18teeth.stl: worm-gears.scad
	openscad -D numberTeeth=18 -D pitchRadius=18 -D printWorm=0 -o stls/gearonly-18teeth.stl worm-gears.scad

stls/wormonly.stl: worm-gears.scad
	openscad -o stls/wormonly.stl -D printGear=0 worm-gears.scad

clean:
	rm -f stls/*.stl
