/** @noSelfInFile */

import { math as loveMath } from "love";
const luaMath = math;

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export module Math {
	export const E = 2.71827;
	export const LN10 = 2.302585092994046;
	export const LOG10E = 0.4342944819032518;
	export const LN2 = 0.6931471805599453;
	export const LOG2E = 1.4426950408889634;
	export const PI = luaMath.pi;
	export const SQRT1_2 = Math.sqrt(1/2);
	export const SQRT_2 = Math.sqrt(2);
	export const NAN = 0/0;
	export const INFINITY = 1/0;
	export const EPSILON = 0.00001;
	export const RADTODEGV = 360 / (PI * 2);
	export const DEGTORADV = (PI * 2) / 360;

	export const atan = luaMath.atan;
	export const atan2 = luaMath.atan2;
	export const abs = luaMath.abs;
	export const acos = luaMath.acos;
	export const cos = luaMath.cos;
	export const asin = luaMath.asin;
	export const sin = luaMath.sin;
	export const ceil = luaMath.ceil;
	export const floor = luaMath.floor;
	export const exp = luaMath.exp;
	export const log = luaMath.log;
	export const min = luaMath.min;
	export const max = luaMath.max;
	export const sqrt = luaMath.sqrt;
	export const tan = luaMath.tan;
	export const radToDeg = luaMath.deg;
	export const degToRad = luaMath.rad;

	export const log10 = (value: number): number => luaMath.log(value, 10);
	export const log2 = (value: number): number => luaMath.log(value, 2);

	export const round = (value: number): number => luaMath.floor(value + 0.5);

	export const approximately = (a: number, b: number): boolean => {
		return abs(a - b) < EPSILON;
	};

	export const clamp = (value: number, minValue: number, maxValue: number): number => {
		return min(max(value, minValue), maxValue);
	};

	export const clamp01 = (value: number): number => clamp(value, 0, 1);

	export const lerpUnclamped = (a: number, b: number, t: number): number => {
		return a * (1 - t) + b * t;
	};

	export const lerp = (a: number, b: number, t: number): number => {
		return clamp01(lerpUnclamped(a, b, t));
	}
	
	export const gammaToLinear = loveMath.gammaToLinear;
	export const linearToGamma = loveMath.linearToGamma;
	export const noise = loveMath.noise;
}