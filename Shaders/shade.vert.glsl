#version 450

in vec3 pos;

out vec3 fragPos;

uniform mat4 MVP;
uniform mat4 M;

void main() {
    gl_Position = MVP * vec4(pos, 1.0);
    fragPos = vec3(M * vec4(pos, 1.0));
}