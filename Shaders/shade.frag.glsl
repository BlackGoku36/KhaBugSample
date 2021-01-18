#version 450

out vec4 fragColor;

in vec3 fragPos;

uniform vec3 objectAlbedo;


void main(){
   
    fragColor = vec4(objectAlbedo, 1.0);
} 