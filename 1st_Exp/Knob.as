package {
 
	import flash.display.MovieClip;
	import flash.events.*;
	
 
	
	public class Knob extends MovieClip {
	public var angle:Number;
	public var ang:Number;
	public var output:Number = 0;
    public var a:Boolean = false;
	
 
	                    public function Knob (Arrow:Object) {

                            Arrow.buttonMode = true;
							Arrow.rotation = -90;
							Arrow.addEventListener (Event.ENTER_FRAME, rotate1);
							Arrow.addEventListener (MouseEvent.MOUSE_DOWN, down);
							Arrow.stage.addEventListener (MouseEvent.MOUSE_UP, up);
														
							function rotate1 (e:Event):void{
								    
									var theX:int = mouseX - Arrow.x;
	                                var theY:int = (mouseY - Arrow.y) * -1;
	                                angle = Math.atan(theY/theX)/(Math.PI/180);
	                         
	                         if (theX<0) {
		                        angle += 180;
	                                     }
	                         if (theX>=0 && theY<0) {
		                        angle += 360;
	                                                }
	                          ang = (angle*-1) +180;
							         if(ang>= 0 && a== true){
						Arrow.rotation = (angle*-1) + 90;
	                     output = ((angle*-1) + 180)*(220/180);    
											 }
	                   
						output = output;
						
						
						}
						
								
							function down (e:Event):void{
							a =true;
							}
								
							function up (e:Event):void{
							a =false;         
	                        }
						}
								
								
								
						
						



                                        
										
										}

       }
