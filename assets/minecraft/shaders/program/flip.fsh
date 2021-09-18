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


void main(){
    float x = texCoord.x;
    float y = 1-texCoord.y;
    vec4 samplerColor = texture2D(DiffuseSampler, vec2(x,y));
    fragColor = samplerColor;
   //fragColor = vec4(1,0,0,1);
}
