// Hologram Shader, re-written to be used with all jokers, not only hologram sprite (needed transparency)
// Author: Nether

// Usage:
// local shader = NFS.read(SMODS.current_mod.path.."/assets/shaders/".."hologramv2.fs")
// love.filesystem.write("temp-hologramv2.fs", shader)
// G.SHADERS['hologramv2'] = love.graphics.newShader("temp-hologramv2.fs")
// love.filesystem.remove("temp-hologramv2.fs")
// sendDebugMessage("Shaders injected!")

// Lovely Injection:
// self.children.floating_sprite:draw_shader('hologramv2', nil, self.ARGS.send_to_shader, nil, self.children.center, scale_mod, rotate_mod)

#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 hologramv2;
extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    //Glow effect
    number glow = 0.;
    int glow_samples = 4;
    int actual_glow_samples = 0;
    number glow_dist = 0.0015;
    number _a = 0.;

     for (int i = -glow_samples; i <= glow_samples; ++i){
            for (int j = -glow_samples; j <= glow_samples; ++j){
                _a = Texel( texture, texture_coords + (glow_dist)*vec2(float(i), float(j))).a;
                if (_a == 1.0) {
                    _a = 0.753; // fix for non-transparent sprites
                }
                if (_a < 0.9){
                    actual_glow_samples += 1;
                    glow = glow + _a;
                }
            }
     }
     glow /= 0.7*float(actual_glow_samples);
    
    //Create the horizontal glitch offset effects
    number offset_l = 0.;
    number offset_r = 0.;
    number timefac = 1.0*hologramv2.g;
    offset_l = -10.0*(-0.5+sin(timefac*0.512 + texture_coords.y*14.0)
            + sin(-timefac*0.8233 + texture_coords.y*11.532)
            + sin(timefac*0.333 + texture_coords.y*13.3)
            + sin(-timefac*0.1112331 + texture_coords.y*4.044343));
    offset_r = -10.0*(-0.5+sin(timefac*0.6924 + texture_coords.y*19.0)
        + sin(-timefac*0.9661 + texture_coords.y*21.532)
        + sin(timefac*0.4423 + texture_coords.y*30.3)
        + sin(-timefac*0.13321312 + texture_coords.y*3.011));
    if (offset_r >= 1.5 || offset_r <= 0.){offset_r = 0.;}
    if (offset_l >= 1.5 || offset_l <= 0.){offset_l = 0.;}
    texture_coords.x = texture_coords.x + 0.002*(-offset_l + offset_r);

    vec4 tex = Texel( texture, texture_coords);
    if (tex.a == 1.0) {
        tex.a = 0.753; // fix for non-transparent sprites
    }
    if (tex.a > 0.999){tex = vec4(0.,0.,0.,0.);}
    // if (tex.a < 0.001){tex.rgb = vec3(0.,1.,1.);}
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;

    if (uv.x >0.99 || uv.x < 0.01 || uv.y > 0.99 || uv.y < 0.01){
        return vec4(0.,0.,0.,0.); // crop to get rid of blue borders
    }

    number light_strength = 0.4*(0.3*sin(2.*hologramv2.g) + 0.6 + 0.3*sin(hologramv2.r*3.) + 0.9);
    vec4 final_col;
    if (tex.a < 0.001){
        final_col = tex*colour + vec4(0., 1., .5,0.6)*light_strength*(1.+abs(offset_l)+abs(offset_r))*glow;
    }
    else{
        final_col = tex*colour + vec4(0., 0.3, 0.2,0.3)*light_strength*(1.+abs(offset_l)+abs(offset_r))*glow;
    }
    
//
    return dissolve_mask(final_col, texture_coords, uv);
}

extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif