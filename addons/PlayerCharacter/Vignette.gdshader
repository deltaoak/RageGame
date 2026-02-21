shader_type canvas_item;

uniform float radius : hint_range(0.0, 2.0) = 0.75;
uniform float softness : hint_range(0.0, 2.0) = 0.45;
uniform float R : hint_range(0.0, 1.0, 0.1) = 0.0;
uniform float G : hint_range(0.0, 1.0, 0.1) = 0.0;
uniform float B : hint_range(0.0, 1.0, 0.1) = 0.0;
uniform float strength : hint_range(0.0, 1.0, 0.1) = 0.0;
uniform float maxOpacity : hint_range(0.0, 1.0, 0.1) = 0.3;

void fragment() {
    vec2 uv = UV * 2.0 - 1.0;      // center at (0,0)
    float dist = length(uv);

    // 0 = center, 1 = fully faded
    float vignette = smoothstep(radius, radius - softness, dist);

    // Output only alpha
    COLOR = vec4(R, G, B, (maxOpacity - vignette) * strength);
}
