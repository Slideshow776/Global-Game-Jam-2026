shader_type canvas_item;

uniform sampler2D mask_tex;

void fragment() {
    vec4 base = texture(TEXTURE, UV);
    float mask = texture(mask_tex, UV).r;
    base.a *= mask;
    COLOR = base;
}
