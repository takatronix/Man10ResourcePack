#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform int FogShape;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;


out float vertexDistance;
out vec4 vertexColor;
out vec4 lightMapColor;
out vec4 overlayColor;
out vec2 texCoord0;
out vec2 texCoord1;
out vec4 normal;
out float part;

#define SPACING 1024.0
#define MAXRANGE (0.5 * SPACING)

const ivec2[] vanillaUVs = ivec2[](
    ivec2(8,  0), // Top
    ivec2(16, 0), // Bottom
    ivec2(0,  8), // Right
    ivec2(8,  8), // Front
    ivec2(16, 8), // Left
    ivec2(24, 8) // Back
);

const vec4[] subuvs = vec4[](
    // 4x4x12
    vec4(4.0,  0.0,  8.0,  4.0 ), // Top
    vec4(8.0,  0.0,  12.0, 4.0 ), // Bottom
    vec4(0.0,  4.0,  4.0,  16.0), // Right
    vec4(4.0,  4.0,  8.0,  16.0), // Front
    vec4(8.0,  4.0,  12.0, 16.0), // Left
    vec4(12.0, 4.0,  16.0, 16.0), // Back

    // 4x3x12
    vec4(4.0,  0.0,  7.0,  4.0 ),
    vec4(7.0,  0.0,  10.0, 4.0 ),
    vec4(0.0,  4.0,  4.0,  16.0),
    vec4(4.0,  4.0,  7.0,  16.0),
    vec4(7.0,  4.0,  11.0, 16.0),
    vec4(11.0, 4.0,  14.0, 16.0),

    // 4x8x12
    vec4(4.0,  0.0,  12.0, 4.0 ),
    vec4(12.0,  0.0, 20.0, 4.0 ),
    vec4(0.0,  4.0,  4.0,  16.0),
    vec4(4.0,  4.0,  12.0, 16.0),
    vec4(12.0, 4.0,  16.0, 16.0),
    vec4(16.0, 4.0,  24.0, 16.0)
);

const vec2[] origins = vec2[](
    vec2(40.0, 16.0), // right arm
    vec2(40.0, 32.0),
    vec2(32.0, 48.0), // left arm
    vec2(48.0, 48.0),
    vec2(40.0, 16.0), // slim right arm
    vec2(40.0, 32.0),
    vec2(32.0, 48.0), // slim left arm
    vec2(48.0, 48.0),
    vec2(16.0, 16.0), // torso
    vec2(16.0, 32.0),
    vec2(0.0,  16.0), // right leg
    vec2(0.0,  32.0),
    vec2(16.0, 48.0), // left leg
    vec2(0.0,  48.0)
);

// face remap
const int[] sodium = int[](0, 1, 3, 5, 4, 2);

int remapFace(int id, bool hat) {
    int face = (id / 4) % 6;
    int sodiumFace = sodium[face];
    if(face == sodiumFace)
        return face;

    int u = int(UV0.x * 64);
    int v = int(UV0.y * 64);
    int localId = id % 4;
    switch(localId) {
        case 0:
            u -= 8;
            break;
        case 1:
            break;
        case 2:
            v -= 8;
            break;
        case 3:
            u -= 8;
            v -= 8;
            break;
    }

    if(hat)
        u -= 32;

    ivec2 vanilla = vanillaUVs[face];
    return vanilla.x == u && vanilla.y == v ? face : sodiumFace;
}

int subUVOffset(int partId) {
    if (partId == 3 || partId == 4) // Check for slim left or right arm
        return 6;
    if (partId == 5) // Check for body part
        return 12;
    return 0;
}

vec2 createOffset(int faceId, int vertexId, vec4 subuv) {
    vec2 offset = vec2(0.0);
    if (faceId == 1) {
        if (vertexId == 0) {
            offset += subuv.zw;
        } else if (vertexId == 1) {
            offset += subuv.xw;
        } else if (vertexId == 2) {
            offset += subuv.xy;
        } else {
            offset += subuv.zy;
        }
    } else {
        if (vertexId == 0) {
            offset += subuv.zy;
        } else if (vertexId == 1) {
            offset += subuv.xy;
        } else if (vertexId == 2) {
            offset += subuv.xw;
        } else {
            offset += subuv.zw;
        }
    }
    return offset;
}

void main() {
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, normalize(Normal), Color);
    lightMapColor = texelFetch(Sampler2, UV2 / 16, 0);
    overlayColor = texelFetch(Sampler1, UV1, 0);
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);

    ivec2 dim = textureSize(Sampler0, 0);

    if (ProjMat[2][3] == 0.0 || dim.x != 64 || dim.y != 64) { // short circuit if cannot be player
        part = 0.0;
        texCoord0 = UV0;
        texCoord1 = vec2(0.0);
        vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    } else {
        vec3 wpos = IViewRotMat * Position;
        vec2 UVout = UV0;
        vec2 UVout2 = vec2(0.0);
        int partId = -int((wpos.y - MAXRANGE) / SPACING);
        part = float(partId);

        if (partId == 0) { // higher precision position if no translation is needed
            gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        } else {
            int hatLayer = (gl_VertexID / 24) % 2;
            int face = remapFace(gl_VertexID % 48, hatLayer == 1) % 6;

            UVout = origins[2 * (partId - 1) + hatLayer];
            UVout2 = origins[2 * (partId - 1)];

            vec4 subuv = subuvs[subUVOffset(partId) + face];
            vec2 offset = createOffset(face, gl_VertexID % 4, subuv);

            UVout += offset;
            UVout2 += offset;
            UVout /= 64.0;
            UVout2 /= 64.0;

            wpos.y += SPACING * partId;
            gl_Position = ProjMat * ModelViewMat * vec4(inverse(IViewRotMat) * wpos, 1.0);
        }

        vertexDistance = fog_distance(ModelViewMat, wpos, FogShape);
        texCoord0 = UVout;
        texCoord1 = UVout2;
    }
}