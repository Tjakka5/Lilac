import SubTexture from "./SubTexture";
import Texture from "./Texture";

type TextureAtlas = {
	defaultWidth?: number;
	defaultHeight?: number;

	subTextures: { [name: string]: SubTexture };
} & Texture;

export default TextureAtlas;