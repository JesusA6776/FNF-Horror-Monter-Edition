function onCreate()
	-- background shit
	makeLuaSprite('inkmachine', 'inkmachine', -600, -300);
	setScrollFactor('inkmachine', 0.9, 0.9);
	
	makeLuaSprite('woodfloor', 'woodfloor', -650, 600);
	setScrollFactor('woodfloor', 0.9, 0.9);
	scaleObject('woodfloor', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	end

	addLuaSprite('inkmachine', false);
	addLuaSprite('woodfloor', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end