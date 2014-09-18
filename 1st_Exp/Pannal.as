package {

	import flash.display.MovieClip;
	import flash.events.*;

	public class Pannal extends MovieClip {
	public var TglBtn:Array = [];
	public var LED_Ind:Array = [];
	public var On:Number = 0;
	public var s3:Number = 0;
	public var main:Boolean = false;
	public var knob1:Knob;
	public var knob2:Knob;
	   

		
		public function Pannal(tglbtn:Array,LED:Array){
			var i:Number;
			knob1 = new Knob(tglbtn[13]);
			knob2 = new Knob(tglbtn[14]);
			
			for(i=1;i<13;i++)
			TglBtn[i]=tglbtn[i];
			
			for(i=1;i<10;i++)
			LED_Ind[i]=LED[i];
			
			for(i=1;i<9;i++){
			TglBtn[i].buttonMode = true;
			TglBtn[i].addEventListener(MouseEvent.MOUSE_DOWN, BtnMode);
			TglBtn[i].On = 0;
			}
			TglBtn[9].buttonMode = true;
            TglBtn[9].addEventListener(MouseEvent.MOUSE_DOWN, threeState);
		}
	
	
	private function BtnMode(e:MouseEvent):void{ 
		if(e.currentTarget.On == 0){
	    	e.currentTarget.gotoAndStop("on_state");
	    	e.currentTarget.On = 1;
	
	}
		else {
			e.currentTarget.gotoAndStop("off_state");
       	    e.currentTarget.On = 0;


    }
	
	PnlOn(); 
}
	 
	
	
	
	public function PnlOff(){
	        var i:Number;
			for(i=1;i<9;i++){
			TglBtn[i].buttonMode = false;
			TglBtn[i].removeEventListener(MouseEvent.MOUSE_DOWN, BtnMode);
			TglBtn[i].gotoAndStop("off_state");
       	    TglBtn[i].On = 0;
			}
			TglBtn[9].buttonMode = false;
			TglBtn[9].removeEventListener(MouseEvent.MOUSE_DOWN, threeState);
			TglBtn[9].gotoAndStop("off_state");
       	    s3 = 0;
			for(i=1;i<10;i++){
			LED_Ind[i].gotoAndStop("off");
			}
	
	}
	
	
	


    
	private function  threeState(e:MouseEvent):void{
	if(s3== 0){
	 s3=1;
	 e.currentTarget.gotoAndStop("two");
		       }
	else if(s3==1){
	s3 = 2
	e.currentTarget.gotoAndStop("three");
                   }
    else {
		s3 = 0;
		e.currentTarget.gotoAndStop("one");
	    }

PnlOn(); 
}
	
	
	private function  PnlOn():void{
	
      if(TglBtn[1].On == 1 && TglBtn[3].On == 1 ){    
	   
	   TglBtn[10].addEventListener(MouseEvent.CLICK, stoP);
       TglBtn[11].addEventListener(MouseEvent.CLICK, stoP);
       TglBtn[12].addEventListener(MouseEvent.CLICK, starT);
		
       if(main == true && TglBtn[2].On == 1){ 
       LED_Ind[2].gotoAndStop("on");
	   if(s3== 1){
		   LED_Ind[6].gotoAndStop("off");
		   LED_Ind[7].gotoAndStop("off");
		   LED_Ind[8].gotoAndStop("off"); 
	      if(TglBtn[4].On==1)
		  LED_Ind[3].gotoAndStop("on");
		  else
		  LED_Ind[3].gotoAndStop("off");
		  if(TglBtn[5].On==1)
		  LED_Ind[4].gotoAndStop("on");
		  else
		  LED_Ind[4].gotoAndStop("off");
		  if (TglBtn[6].On==1)
		  LED_Ind[5].gotoAndStop("on");
		  else
		  LED_Ind[5].gotoAndStop("off");
	   
	   
	   }
	   else if (s3 == 2){
		    LED_Ind[3].gotoAndStop("off");
		    LED_Ind[4].gotoAndStop("off");
		    LED_Ind[5].gotoAndStop("off");
	      if(TglBtn[4].On==1)
		  LED_Ind[6].gotoAndStop("on");
		  else
		   LED_Ind[6].gotoAndStop("off");
		  if(TglBtn[5].On==1)
		  LED_Ind[7].gotoAndStop("on");
		  else
		   LED_Ind[7].gotoAndStop("off");
		  if (TglBtn[6].On==1)
		  LED_Ind[8].gotoAndStop("on"); 
		  else
		   LED_Ind[8].gotoAndStop("off"); 
	   
	   }
	   
	   else{
	   
	   LED_Ind[3].gotoAndStop("off");
		 LED_Ind[4].gotoAndStop("off");
		   LED_Ind[5].gotoAndStop("off");
	   LED_Ind[6].gotoAndStop("off");
		 LED_Ind[7].gotoAndStop("off");
		   LED_Ind[8].gotoAndStop("off"); 
	   
	   }
	      if (TglBtn[7].On==1)
		   LED_Ind[9].gotoAndStop("on"); 
		  else
		   LED_Ind[9].gotoAndStop("off");
	   
	   }

      else 
	  { LED_Ind[2].gotoAndStop("off");
	     LED_Ind[3].gotoAndStop("off");
		   LED_Ind[4].gotoAndStop("off");
		    LED_Ind[5].gotoAndStop("off");
	      LED_Ind[6].gotoAndStop("off");
		   LED_Ind[7].gotoAndStop("off");
		    LED_Ind[8].gotoAndStop("off"); 
		 LED_Ind[9].gotoAndStop("off");
	  }

    
	 
       
     




}//if





else { 
    main = false;
	LED_Ind[1].gotoAndStop("off");
    LED_Ind[2].gotoAndStop("off");
	LED_Ind[2].gotoAndStop("off");
	LED_Ind[3].gotoAndStop("off");
    LED_Ind[4].gotoAndStop("off");
    LED_Ind[5].gotoAndStop("off");
	LED_Ind[6].gotoAndStop("off");
	LED_Ind[7].gotoAndStop("off");
	LED_Ind[8].gotoAndStop("off"); 
    LED_Ind[9].gotoAndStop("off");
     }



}//void

	
    private function starT(e:MouseEvent):void{ 
	LED_Ind[1].gotoAndStop("on");
	main = true;
	PnlOn(); 
}
  	
	private function stoP(e:MouseEvent):void{ 
	main = false;
	LED_Ind[1].gotoAndStop("off");
    LED_Ind[2].gotoAndStop("off");
	PnlOn();
}
	
	
	
	
	
	
	
	}
			
			
}