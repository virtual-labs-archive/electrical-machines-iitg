package {
 
	import flash.display.MovieClip;
	import flash.events.*;
	
 
	
	public class Meter extends MovieClip {
	public var input:Number;
 
	                    public function Meter (Arrow:Object, Range:Number) {
                         Arrow.addEventListener (Event.ENTER_FRAME, rotate);
														
						function rotate (e:Event):void{
								    
						  if(input>=0 && input<=Range)
			              Arrow.rotation = input*(180/Range);
	                                         
	
							        }
													
								
							 }

       }
	   
	   
}
