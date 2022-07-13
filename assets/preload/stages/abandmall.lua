function onCreate()
	-- background shit
	makeLuaSprite('abmall_bg', 'abmall_bg', -500, -100);
	setScrollFactor('abmall_bg', 0.1, 0.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	end

	addLuaSprite('abmall_bg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end