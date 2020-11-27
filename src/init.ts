
/*
const tilemapMapping = TilemapMapping;

const source = newImage(tilemapMapping.imagePath);
source.setFilter("nearest", "nearest");
const quads: List<Quad> = new List();

{
	const [sw, sh] = source.getDimensions();

	for (const subTextureName in tilemapMapping.subTextures) {
		const subTexture = tilemapMapping.subTextures[subTextureName];
		const quad = newQuad(subTexture.x, subTexture.y, subTexture.w || tilemapMapping.defaultWidth || 1, subTexture.h || tilemapMapping.defaultHeight || 1, sw, sh);

		quads.add(quad);
	}
}

const tiles = new List<Tile>();

tiles.add(new Floor(new Vector2(5, 2), quads.get(1)!));

love.draw = () => {
	let x = 0;

	for (const [, quad] of quads.values()) {
		const [, , w] = quad.getViewport();
		love.graphics.draw(source, quad, x, 0, 0, 4, 4);

		x += w * 3;
	}
};
*/
