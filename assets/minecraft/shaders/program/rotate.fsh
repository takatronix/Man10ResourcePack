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
{
    fragColor = vec4(1,0,0,1);
}