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

float random (vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233)))* 43758.5453123);
}


void main(){
    vec2 st = texCoord.xy/ScreenSize.xy;

    float rnd = random( st);

    fragColor = vec4(vec3(rnd),1.0);

}
