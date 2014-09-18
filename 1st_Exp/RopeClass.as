package {

	import flash.display.MovieClip;
    import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.geom.Point;
	import flash.events.*;
	import flash.filters.*;

	public class RopeClass extends Sprite {
		
		 public var nodeaantal:uint = 4; 
		 public var canvas:Sprite = new Sprite(); 
		 public var nodes:Array;
		 
		 public var gravity:Number = 5;
	     public var tension:Number = 9;
		 public var damp:Number = 0.8;
		
		 public var gThickness:Number = 5;
		 public var gAlpha:Number = 1;
		 
		 public var p1:Object;
		 public var p2:Object;
		 public var gColor:uint;
		
		public function RopeClass(p1:Object, p2:Object ,color:uint ) {
			gColor = color;
			var n:Number = nodeaantal;
			++n;
			
			var dx: Number = ( p2.x - p1.x ) / n;
			var dy: Number = ( p2.y - p1.y ) / n;
			nodes = new Array();
			var node:Object;
			var lastNode:Object;
			while ( --n > 0 ) {
				node = {x:p1.x + dx * n,y:p1.y + dy * n};
				if (n < nodeaantal) {
					node.next = lastNode;
					lastNode.prev = node;
				} else {
					node.next = p2;
				}
				node.vx = node.vy = 0;
				lastNode = node;
				nodes.push( node );
			}
			node.prev = p1;
			addChild(canvas);
			
			}
		
	

		public function DrawRope() {
			
			
			var vx:Number;
			var vy:Number;
			var next:Object;
			var prev:Object;
			var node:Object;
			var n:Number = nodes.length;
			var sumx:Number = 0;
			var sumy:Number = 0;
			while ( --n > -1 ) {
				node = nodes[n];
				next = node.next;
				prev = node.prev;
				node.vx += ( next.x + prev.x - node.x * 2 ) / tension;
				node.vy += ( next.y + prev.y - node.y * 2 ) / tension;
				node.vy+=gravity;
				node.vx*=damp;
				node.vy*=damp;
				node.x+=node.vx;
				node.y+=node.vy;
				sumx+=vx;
				sumy+=vy;
			}
			
			var p1=nodes[nodeaantal-1].prev;
			var p2=nodes[0].next;
			canvas.graphics.clear();
			var mx:Number;
			var my:Number;
			var px:Number;
			var i:Number;
			n=3;
			
			while ( --n > -1 ) {
				
                
				canvas.graphics.lineStyle(gThickness, gColor, gAlpha);
				canvas.graphics.moveTo( p1.x , p1.y );
				
				
				i=nodeaantal;
				while ( --i > -1 ) {
if ( Math.abs( ( mx = ( node = nodes[i] ).x ) - ( px = ( prev = node.next ).x ) ) < 3 ) {
	canvas.graphics.lineTo( ( mx + px ) / 2 , ( ( my = node.y ) + prev.y ) / 2 );
		                                                                                 }
		else { 
			canvas.graphics.curveTo( mx , ( my = node.y ) , ( mx + px ) / 2 , ( node.y + prev.y ) / 2  );
		      }
				}
				canvas.graphics.curveTo( ( p2.x + mx ) / 2 , ( p2.y + my ) / 2 , p2.x , p2.y );
			    }
		    canvas.filters = [new DropShadowFilter(6, 45, 0x666655, 1, 5, 5, 1, 1, false, false, false)];
		}
			
	
	
	
	}
}
			