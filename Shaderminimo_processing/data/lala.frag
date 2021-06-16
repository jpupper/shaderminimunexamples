

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;


void main() {
	
	vec2 uv = gl_FragCoord.xy/resolution;

  
	float forma = sin(uv.x*mouse.x*100+uv.y*mouse.y*100+time); 
	
	//forma +=sin(forma*1000);
	gl_FragColor = vec4(vec3(forma)*vec3(1.0,0.0,0.0), 1.0);
	

}

