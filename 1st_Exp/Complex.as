package {
 
	import flash.display.MovieClip;
 
	public class Complex extends MovieClip {
 
		public var Real:Number;
		public var Imag:Number;
      
	
		public function Complex(real:Number,imaginary:Number):void {
                     Real = real;
					 Imag =  imaginary;
						}
										
		
		public function	 Conj(inum:Complex):Complex	{
			
			return new Complex(inum.Real,-inum.Imag);
		}

        public function	Abs(inum:Complex):Number	{
			
			return Math.sqrt(Math.pow(inum.Real,2)+Math.pow(inum.Imag,2));
		}
		
		public function	Ang(inum:Complex):Number	{
			var arg;
			if(inum.Real!=0){
				arg = Math.atan(inum.Imag/inum.Real)*(180/Math.PI);
				if(inum.Imag>=0 && inum.Real>0)
				arg = arg;
				else if (inum.Imag>=0 && inum.Real<0)
				arg = arg + 180;
				else if (inum.Imag<0 && inum.Real<0)
				arg = arg - 180;
				else arg = arg + 360;
				
			}
			
			else { 
			if(inum.Imag==0)
			arg = 0;
			else if (inum.Imag>0)
			arg = 90;
			else arg = 270;
				
			}
			return arg;
		}


         
	public function	Add(inum1:Complex,inum2:Complex):Complex	{
			
			return new Complex((inum1.Real+inum2.Real),(inum1.Imag+inum2.Imag))
		}


    public function	Sub(inum1:Complex,inum2:Complex):Complex	{
			
			return new Complex((inum1.Real-inum2.Real),(inum1.Imag-inum2.Imag))
		}
		
		
	
	
	
	public function	Mul(inum1:Complex,inum2:Complex):Complex	{
			
			return new Complex((inum1.Real*inum2.Real-inum1.Imag*inum2.Imag),(inum1.Imag*inum2.Real+inum1.Real*inum2.Imag))
		}
		
		
		
		
	public function	Div(inum1:Complex,inum2:Complex):Complex	{
			
			
			return new Complex((inum1.Real*inum2.Real+inum1.Imag*inum2.Imag)/(Math.pow(inum2.Real,2)+Math.pow(inum2.Imag,2)),(inum1.Imag*inum2.Real-inum1.Real*inum2.Imag)/(Math.pow(inum2.Real,2)+Math.pow(inum2.Imag,2)))
		}



}

}
