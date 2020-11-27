import { FilterMode } from "love.graphics";

type Texture = {
	imagePath: string;

	defaultMin?: FilterMode;
	defaultMag?: FilterMode;
}

export default Texture;