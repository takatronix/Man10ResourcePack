#version 150

uniform sampler2D DiffuseSampler;

in vec2 texCoord;
uniform float Time;

out vec4 fragColor;

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main(){

    float r = rand(vec2(texCoord.x,Time));
    fragColor = vec4(r,0,Time,1.0);
}
