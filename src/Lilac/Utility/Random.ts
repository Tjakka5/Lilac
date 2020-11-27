export namespace Random {
	export function number(min: number, max: number): number {
		return love.math.random(min, max);
	}

	export function float(min: number, max: number): number {
		return love.math.random() * (max - min) + min;
	}

	export function floatUnsignedNormalized(): number {
		return love.math.random();
	}

	export function floatSignedNormalized(): number {
		return love.math.random() * 2 - 1;
	}
}