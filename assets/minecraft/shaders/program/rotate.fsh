#version 150

uniform sampler2D DiffuseSampler;

in vec2 texCoord;
uniform float Time;
uniform float GameTime;

uniform vec2 ScreenSize;
uniform vec2 InSize;
uniform vec2 OutSize;

// 出力
out vec4 fragColor;

vec4 colorShift(vec4 tex,vec2 uv){
	vec4 frag;
    float intensity = 0.1;
    float time = 1;
    frag.r = texture(DiffuseSampler,vec2(uv.x + sin(Time * time) * intensity,uv.y + cos(Time * time)  * intensity)).r;
    frag.g = tex.g;
    frag.b = texture(DiffuseSampler,vec2(uv.x - sin(Time * time)  * intensity,uv.y - cos(Time * time)  * intensity)).b;
    frag.a = tex.a;
    return frag;                
}


void main(){
    vec2 uv = texCoord/vec2(1,1);

    vec4 tex = texture(DiffuseSampler,uv); 
    

    // Output to screen
    fragColor = colorShift(tex,uv);
}
