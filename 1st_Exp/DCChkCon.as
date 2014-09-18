package {

	import flash.display.MovieClip;
	import flash.events.*;

	public class DCChkCon extends MovieClip {
	public var ConSt:Number = 5 ;
	public var Messeges:Array = [];
	public var UpPt:UpDatePot; 
	   

		
		public function DCChkCon(POT:Array,NdnBrn:Array){
		    var i:Number;
			var amconst:Boolean = false;
			var vmconst:Boolean = false;
			var ndconst:Boolean = false;
			UpPt = new UpDatePot(NdnBrn);
			Messeges[0]="Right connection";
	        Messeges[1]="Ammeter was not connected or wrongly connected";
			Messeges[2]="Voltmeter was not connected or wrongly connected";
			Messeges[3]="Ammeter and Voltmeter was not connected or wrongly connected";
			Messeges[4]="Check the Connection of winding ";
			Messeges[5]="Power supply has short circuited";
			
			if((UpPt.ConChk(NdnBrn[21],NdnBrn[17])==true)&&(UpPt.ConChk(NdnBrn[22],NdnBrn[18])==false)){
			for(i=10;i<16;i++){
			if(UpPt.ConChk(NdnBrn[i],NdnBrn[18])==true)
			amconst = true;
			else if(POT[18]==POT[i])
			amconst = true;
			}
			}
			else if((UpPt.ConChk(NdnBrn[21],NdnBrn[17])==false)&&(UpPt.ConChk(NdnBrn[22],NdnBrn[18])==true)){
			for(i=10;i<16;i++){
			if(UpPt.ConChk(NdnBrn[i],NdnBrn[17])==true)
			amconst = true;
			else if(POT[17]==POT[i])
			amconst = true;
			}
			}
			else amconst = false;
			
			if(POT[19]>0&&POT[20]>0)
			if(POT[21]==POT[19]&&POT[22]==POT[20])
			vmconst = true;
			else vmconst = false;
			
			if(POT[10]>0&&POT[14]>0){
			if(POT[10]!=POT[14])
			ndconst = true;
			else ndconst = false;
			}
			else if(POT[11]>0&&POT[15]>0){
			if(POT[11]!=POT[15])
			ndconst = true;
			else ndconst = false;
			}
			else if(POT[12]>0&&POT[13]>0){
			if(POT[12]!=POT[13])
			ndconst = true;
			else ndconst = false;
			}
			else {
			ndconst = false;
			ConSt = 4;
			}
			
			if(POT[21]!=POT[22]){
			if(amconst==true&&vmconst==true&&ndconst==true)
			ConSt = 0;
			else if(amconst==false&&vmconst==true&&ndconst==true)
			ConSt = 1;
			else if(amconst==true&&vmconst==false&&ndconst==true)
	        ConSt = 2;
			else if(amconst==false&&vmconst==false&&ndconst==true)
	        ConSt = 3;
			else
			ConSt = 4;
			}
			else {
			ConSt = 5;
			}
		}
	}
}