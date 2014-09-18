package {

	import flash.display.MovieClip;
	import flash.events.*;

	public class UpDatePot extends MovieClip {
		
		 public var Ptncl:Array = [];
		 public var Pcntr:Number = 1;
		 public var tPtn:Number;
	     public var BranchNo:Number = -1;
		 public var Chk:Boolean = false;
		
		
		public function UpDatePot(NnBn:Array):void{
			            
		                 var i:Number;
						 var j:Number;
						 var k:Number;
						 for(i=1;i<25;i++)
						 for(j=1;j<25;j++)
						 if(i!=j){
						 if(ConChk(NnBn[i],NnBn[j])==true){
						 if(Ptncl[i]==null && Ptncl[j]==null){
						 Ptncl[i]=Pcntr;
						 Ptncl[j]=Pcntr;
						 Pcntr++;
						 }
						 else if(Ptncl[i]==null&&Ptncl[j]!=null){
						 Ptncl[i]=Ptncl[j];
						 }
						 else if(Ptncl[i]!=null&&Ptncl[j]==null){
						 Ptncl[j]=Ptncl[i];
						 }
						 else {
						 if(Ptncl[i]>Ptncl[j])
						 for(k=1;k<25;k++)
						 if(Ptncl[i]==Ptncl[k])
						 Ptncl[k]=Ptncl[j];
						 
						 if(Ptncl[i]<Ptncl[j])
						 for(k=1;k<25;k++)
						 if(Ptncl[j]==Ptncl[k])
						 Ptncl[k]=Ptncl[i];
						 }
						 
						 } 
						 }
						
			
		}
	
	public function ConChk(Node1:Array, Node2:Array ):Boolean{
			var i:Number;
			var j:Number;
			
			
			for(i=0;i<Node1.length;i++)
			for(j=0;j<Node2.length;j++)
			if(Node1[i] == Node2[j])
			{
				Chk = true;
				BranchNo = Node1[i];
				break
				
			}
			if(Chk == true){
			 Chk = false;
			 return true;
			 
			}
			
			else 
			return false;
			
		}
	
	public function UpDtBrn(NnBn1:Array,Bn:Number):void{
	                     var i:Number;
						 var j:Number;
						 for(i=1;i<25;i++)
						 for(j=0;j<NnBn1[i].length;j++)
						 if(NnBn1[i][j]>Bn)
						 NnBn1[i][j]--;
							
						 
	                   }
	
	
	
	
	
	
	}

}