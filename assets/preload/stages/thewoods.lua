function onCreate()
	-- background shit
	makeLuaSprite('Woods', 'Woods', -600, -300);
	setScrollFactor('Woods', 0.9, 0.9);
	
	makeLuaSprite('dirtfloor', 'dirtfloor', -650, 600);
	setScrollFactor('dirtfloor', 0.9, 0.9);
	scaleObject('dirtfloor', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	end

	addLuaSprite('Woods', false);
	addLuaSprite('dirtfloor', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end