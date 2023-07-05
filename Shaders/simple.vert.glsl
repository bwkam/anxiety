#version 450

in vec2 pos;
                 
uniform mat4 model;
uniform mat4 view;
uniform mat4 proj;


void main()
{
    
    gl_Position = proj * view * model * vec4(pos, 0.0, 1.0);
    // gl_Position = proj * vec4(pos, 1.0);
}