import IMap from "Lilac/Collections/IMap";
import Map from "Lilac/Collections/Map";

export default class ServiceLocator {
	private services: IMap<any, any>;
	
	constructor() {
		this.services = new Map();
	}

	public register<T extends ClassType<InstanceType<T>>>(cls: T, instance: InstanceType<T>): boolean {
		if (this.services.hasKey(cls))
			return false;
		
		this.services.add(cls, instance);
		
		return true;
	}

	public get<T extends ClassType<InstanceType<T>>>(cls: T): InstanceType<T> | undefined {
		return this.services.get(cls);
	}
}