#version 150

uniform sampler2D DiffuseSampler;

uniform vec4 ColorModulate;
uniform float Time;

in vec2 texCoord;

out vec4 fragColor;

void main(){

    fragColor = vec4(1,0,0,0);
}
