all: stls/gearonly-15teeth.stl stls/gearonly-16teeth.stl stls/gearonly-17teeth.stl stls/gearonly-18teeth.stl stls/wormonly.stl

stls/gearonly-15teeth.stl: gearonly.scad
	openscad -D numberTeeth=15 -D pitchRadius=15 -o stls/gearonly-15teeth.stl gearonly.scad

stls/gearonly-16teeth.stl: gearonly.scad
	openscad -D numberTeeth=16 -D pitchRadius=16 -o stls/gearonly-16teeth.stl gearonly.scad

stls/gearonly-17teeth.stl: gearonly.scad
	openscad -D numberTeeth=17 -D pitchRadius=17 -o stls/gearonly-17teeth.stl gearonly.scad

stls/gearonly-18teeth.stl: gearonly.scad
	openscad -D numberTeeth=18 -D pitchRadius=18 -o stls/gearonly-18teeth.stl gearonly.scad

stls/wormonly.stl: wormonly.scad
	openscad -o stls/wormonly.stl wormonly.scad

clean:
	rm -f stls/*.stl
