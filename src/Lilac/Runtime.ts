import Event from "./Events/Event";
import { DrawEventArgs, MousePressedEventArgs, MouseReleasedEventArgs, QuitEventArgs, UpdateEventArgs } from "./Events/EventArgs";
import { GameContext } from "./GameContext";
import { BaseSceneNode, IAllEventsNode } from "./GUI/SceneNode";

export default abstract class Runtime extends BaseSceneNode implements IAllEventsNode {
	public readonly updating: Event<UpdateEventArgs, GameContext> = new Event();
	public readonly drawing: Event<DrawEventArgs, GameContext> = new Event();
	
	public readonly	mousePressed: Event<MousePressedEventArgs, GameContext> = new Event();
	public readonly mouseReleased: Event<MouseReleasedEventArgs, GameContext> = new Event();

	public readonly quitting: Event<QuitEventArgs, GameContext> = new Event();

	protected onLoad(gameContext: GameContext): void {}
	
	protected onUpdate(args: UpdateEventArgs, gameContext: GameContext): void {
		this.updating.invoke(args, gameContext);
	}

	protected onDraw(args: DrawEventArgs, gameContext: GameContext): void {
		this.drawing.invoke(args, gameContext);
	} 

	protected onMousePressed(args: MousePressedEventArgs, gameContext: GameContext): void {
		this.mousePressed.invoke(args, gameContext);
	}

	protected onMouseReleased(args: MousePressedEventArgs, gameContext: GameContext): void {
		this.mousePressed.invoke(args, gameContext);
	}

	protected onQuiting(args: QuitEventArgs, gameContext: GameContext): void {
		this.quitting.invoke(args, gameContext);
	} 
}