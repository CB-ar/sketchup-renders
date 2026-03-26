# apply_vray_interior.rb
# Aplica los parámetros V-Ray para render de interior en SketchUp
# Usar via MCP: eval_ruby con el contenido de este script
# Preset: "preview", "final" o "high_quality"

PRESET = "final"  # cambiar según necesidad

PRESETS = {
  "preview"      => { threshold: 0.02,  max_subdivs: 50,  lc_subdivs: 500,  w: 960,  h: 540  },
  "final"        => { threshold: 0.005, max_subdivs: 200, lc_subdivs: 1500, w: 1920, h: 1080 },
  "high_quality" => { threshold: 0.002, max_subdivs: 500, lc_subdivs: 2000, w: 2560, h: 1440 }
}

p = PRESETS[PRESET]

# GI
VRay.set_render_param("SettingsGI", "on", true)
VRay.set_render_param("SettingsGI", "primary_engine", 4)   # Brute Force
VRay.set_render_param("SettingsGI", "secondary_engine", 3) # Light Cache

# Light Cache
VRay.set_render_param("SettingsLightCache", "subdivs",    p[:lc_subdivs])
VRay.set_render_param("SettingsLightCache", "num_passes", 8)
VRay.set_render_param("SettingsLightCache", "filter",     1)
VRay.set_render_param("SettingsLightCache", "filter_size", 0.02)

# Image Sampler - Progressive
VRay.set_render_param("SettingsImageSampler", "type",                    1)
VRay.set_render_param("SettingsImageSampler", "progressive_minSubdivs",  1)
VRay.set_render_param("SettingsImageSampler", "progressive_maxSubdivs",  p[:max_subdivs])
VRay.set_render_param("SettingsImageSampler", "progressive_threshold",   p[:threshold])
VRay.set_render_param("SettingsDMCSampler",   "subdivs_mult",            1.0)

# Color Mapping - Reinhard
VRay.set_render_param("SettingsColorMapping", "type",        4)
VRay.set_render_param("SettingsColorMapping", "dark_mult",   0.8)
VRay.set_render_param("SettingsColorMapping", "bright_mult", 1.0)
VRay.set_render_param("SettingsColorMapping", "gamma",       2.2)

# Resolución
VRay.set_render_size(p[:w], p[:h])

"V-Ray interior [#{PRESET}] aplicado: #{p[:w]}x#{p[:h]}, threshold #{p[:threshold]}, LC #{p[:lc_subdivs]}"
