import List from "Lilac/Collections/List";

export type MethodTraceback = {
	filename: string;
	filenameShort: string;
	lineNumber: number;
}

export type FullTraceback = {
	tracebackTS: MethodTraceback,
	tracebackLua: MethodTraceback,
}

export type ErrorTraceback = {
	error: string;
	trace: List<FullTraceback>;
}

export default function getErrorTraceback(): ErrorTraceback {
	const errorTraceback: ErrorTraceback = {
		error: "oopsie woopsie you did a fucky wucky",
		trace: new List(),
	};
	
	let level = 2;

	// eslint-disable-next-line no-constant-condition
	while (true) {
		const info = debug.getinfo(level, "Sln");
		if (!info)
			break;

		if (info.what == "Lua") {
			const line = info.currentline!;
			let file = info.source!;
			if (string.sub(info.source!, 1, 1) == "@") {
				file = string.sub(info.source!, 2);
			}

			const rawFileName = string.match(file, "(.+)%..+");

			/** @ts-ignore */
			const fileSourceMap: Table<string, number> = _G.__TS__sourcemap[tostring(file)];
		
			

			if (fileSourceMap) {
				const mappedLine = fileSourceMap.get(tostring(line));

				const fullTraceback: FullTraceback = {
					tracebackLua: {
						filename: rawFileName+".lua",
						filenameShort: rawFileName+".lua",
						lineNumber: line,
					},
					tracebackTS: {
						filename: rawFileName+".ts",
						filenameShort: rawFileName+".ts",
						lineNumber: mappedLine!,
					}
				};
				errorTraceback.trace.add(fullTraceback);
			}			
		}

		level++;
	}

	return errorTraceback;
}