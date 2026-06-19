shader_type canvas_item;

uniform vec4 flash_color : source_color = vec4(1.0);
uniform float flash_mix : hint_range(0, 1) = 0.0;
uniform float alpha : hint_range(0, 1) = 1.0;

void fragment() {
	vec4 tex = texture(TEXTURE,UV);
	vec4 flash = flash_color;
	flash.a = tex.a;

	COLOR = mix(tex,flash,flash_mix);
	COLOR.a *= alpha * flash_color.a;
}
