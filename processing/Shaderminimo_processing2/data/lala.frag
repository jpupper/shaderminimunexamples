

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;
uniform sampler2D dibujo;
uniform sampler2D feedback;

void main() {
	
	vec2 uv = gl_FragCoord.xy/resolution;

	//DIBUJO PROCESSING :
	
	
	vec2 uv_dp2 = uv;
	uv_dp2.x+=sin(uv.x*10.0+time)*0.1;
	vec4 dp2 = texture(dibujo,uv_dp2);
	vec4 fb = texture(feedback,uv);
	float forma = sin(uv.x*mouse.x*100+uv.y*mouse.y*100+time); 
	
	//forma +=sin(forma*1000);
	vec3 fin = dp2.rgb+fb.rgb*0.95;
	gl_FragColor = vec4(fin, 1.0);
	

}

