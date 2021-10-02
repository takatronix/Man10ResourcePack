#version 150

#moj_import <fog.glsl>


uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform float Time;
uniform float GameTime;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 normal;

out vec4 fragColor;



#define RAIN_SPEED -80 // Speed of rain droplets
#define DROP_SIZE  1.5  // Higher value lowers, the size of individual droplets

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float rchar(vec2 outer, vec2 inner, float globalTime) {
	//return float(rand(floor(inner * 2.0) + outer) > 0.9);
	
	vec2 seed = floor(inner * 4.0) + outer.y;
	if (rand(vec2(outer.y, 23.0)) > 0.98) {
		seed += floor((globalTime + rand(vec2(outer.y, 49.0))) * 3.0);
	}
	
	return float(rand(seed) > 0.5);
}

void main() {

	vec2 iResolution = vec2(0.2,0.2);

	vec2 position = texCoord0.xy / iResolution.xy;
	vec2 uv = vec2(position.x, position.y);
    position.x /= iResolution.x / iResolution.y;
	float globalTime = GameTime * RAIN_SPEED;

	float scaledown = DROP_SIZE;
	float rx = texCoord0.x / (40.0 * scaledown);
	float mx = 40.0*scaledown*fract(position.x * 30.0 * scaledown);
	vec4 result;
	
	if (mx > 12.0 * scaledown) {
		result = vec4(0.0);
	} else 
	{
        float x = floor(rx);
		float r1x = floor(texCoord0.x / (15.0));
		

		float ry = position.y*600.0 + rand(vec2(x, x * 3.0)) * 100000.0 + globalTime* rand(vec2(r1x, 23.0)) * 120.0;
		float my = mod(ry, 15.0);
		if (my > 12.0 * scaledown) {
			result = vec4(0.0);
		} else {
		
			float y = floor(ry / 15.0);
			
			float b = rchar(vec2(rx, floor((ry) / 15.0)), vec2(mx, my) / 12.0, globalTime);
			float col = max(mod(-y, 24.0) - 4.0, 0.0) / 20.0;
			vec3 c = col < 0.8 ? vec3(0.0, col / 0.8, 0.0) : mix(vec3(0.0, 1.0, 0.0), vec3(1.0), (col - 0.8) / 0.2);
			
			result = vec4(c * b, 1.0)  ;
		}
	}
	
	position.x += 0.05;

	scaledown = DROP_SIZE;
	rx = texCoord0.x / (40.0 * scaledown);
	mx = 40.0*scaledown*fract(position.x * 30.0 * scaledown);
	
	if (mx > 12.0 * scaledown) {
		result += vec4(0.0);
	} else 
	{
        float x = floor(rx);
		float r1x = floor(texCoord0.x / (12.0));
		

		float ry = position.y*700.0 + rand(vec2(x, x * 3.0)) * 100000.0 + globalTime* rand(vec2(r1x, 23.0)) * 120.0;
		float my = mod(ry, 15.0);
		if (my > 12.0 * scaledown) {
			result += vec4(0.0);
		} else {
		
			float y = floor(ry / 15.0);
			
			float b = rchar(vec2(rx, floor((ry) / 15.0)), vec2(mx, my) / 12.0, globalTime);
			float col = max(mod(-y, 24.0) - 4.0, 0.0) / 20.0;
			vec3 c = col < 0.8 ? vec3(0.0, col / 0.8, 0.0) : mix(vec3(0.0, 1.0, 0.0), vec3(1.0), (col - 0.8) / 0.2);
			
			result += vec4(c * b, 1.0)  ;
		}
	}
	
	result = result * length(texture(Sampler0,uv).rgb) + 0.22 * vec4(0.,texture(Sampler0,uv).g,0.,1.);
	if(result.b < 0.5)
	result.b = result.g * 0.5 ;
	fragColor = result;

//	fragColor = vec4(1,0,0,1);
}