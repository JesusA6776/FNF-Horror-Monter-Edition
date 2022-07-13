package;

import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import flixel.math.FlxRect;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.FlxCamera;

class CustomFadeTransition extends MusicBeatSubstate {
	public static var finishCallback:Void->Void;
	private var leTween:FlxTween = null;
	public static var nextCamera:FlxCamera;
	var isTransIn:Bool = false;
	var transRed:FlxSprite;
	var transGradient:FlxSprite;

	public function new(duration:Float, isTransIn:Bool) {
		super();

		this.isTransIn = isTransIn;
		var zoom:Float = CoolUtil.boundTo(FlxG.camera.zoom, 0.05, 1);
		var width:Int = Std.int(FlxG.width / zoom);
		var height:Int = Std.int(FlxG.height / zoom);
		transGradient = FlxGradient.createGradientFlxSprite(width, height, (isTransIn ? [0x0, FlxColor.RED] : [FlxColor.RED, 0x0]));
		transGradient.scrollFactor.set();
		add(transGradient);

		transRed = new FlxSprite().makeGraphic(width, height + 400, FlxColor.RED);
		transRed.scrollFactor.set();
		add(transRed);

		transGradient.x -= (width - FlxG.width) / 2;
		transRed.x = transGradient.x;

		if(isTransIn) {
			transGradient.y = transRed.y - transRed.height;
			FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
				onComplete: function(twn:FlxTween) {
					close();
				},
			ease: FlxEase.linear});
		} else {
			transGradient.y = -transGradient.height;
			transRed.y = transGradient.y - transRed.height + 50;
			leTween = FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
				onComplete: function(twn:FlxTween) {
					if(finishCallback != null) {
						finishCallback();
					}
				},
			ease: FlxEase.linear});
		}

		if(nextCamera != null) {
			transRed.cameras = [nextCamera];
			transGradient.cameras = [nextCamera];
		}
		nextCamera = null;
	}

	override function update(elapsed:Float) {
		if(isTransIn) {
			transRed.y = transGradient.y + transGradient.height;
		} else {
			transRed.y = transGradient.y - transRed.height;
		}
		super.update(elapsed);
		if(isTransIn) {
			transRed.y = transGradient.y + transGradient.height;
		} else {
			transRed.y = transGradient.y - transRed.height;
		}
	}

	override function destroy() {
		if(leTween != null) {
			finishCallback();
			leTween.cancel();
		}
		super.destroy();
	}
}