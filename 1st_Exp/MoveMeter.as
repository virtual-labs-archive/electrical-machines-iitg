package {

	import flash.display.MovieClip;
	import flash.events.*;

	public class MoveMeter extends MovieClip {
	public var ConSt:Number = 5 ;
	public var Messeges:Array = [];
	public var UpPt:UpDatePot; 
	   

		
		public function MoveMeter(MrCom:Array):void{
			
			      am1.x = ammeter.x -50;
				  am1.y = ammeter.y -62;
	              am2.x = ammeter.x+50;
				  am2.y = ammeter.y-62;
				  am_lead.x = ammeter.x -10;
				  am_lead.y = ammeter.y +15;
				  Am_txt.x = ammeter.x -30;
				  Am_txt.y = ammeter.y +51;
				  vm1.x = voltmeter.x -50;
				  vm1.y = voltmeter.y -62;
	              vm2.x = voltmeter.x+50;
				  vm2.y = voltmeter.y-62;
				  vm_lead.x = voltmeter.x -10;
				  vm_lead.y = voltmeter.y +15;
				  Vm_txt.x = voltmeter.x -30;
				  Vm_txt.y = voltmeter.y +51;
			
		}
		
	}
}