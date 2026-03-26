# SketchUp Renders

Workflow: Carla modela → Claude configura V-Ray y hace renders finales via MCP.

## Proyectos

| Proyecto | Modelo | Estado |
|---|---|---|
| Opcion 1.2 | `Opcion1.2.skp` | En proceso |

## Workflow

1. Carla abre el modelo y navega a la scene del render
2. Carla activa el plugin MCP (Extensions → Start Server)
3. Claude aplica parámetros V-Ray según el preset deseado
4. Claude lanza el render via `VRay.launch_render`

## Parámetros V-Ray — Interior

Ver `vray_interior_params.json` para referencia completa.
Script Ruby listo para aplicar: `apply_vray_interior.rb`

### Presets disponibles

| Preset | Resolución | Threshold | LC Subdivs | Uso |
|---|---|---|---|---|
| `preview` | 960×540 | 0.02 | 500 | Verificar composición |
| `final` | 1920×1080 | 0.005 | 1500 | Entrega estándar |
| `high_quality` | 2560×1440 | 0.002 | 2000 | Portfolio / imprimir |

### Configuración aplicada (interior)
- **GI**: Brute Force (primary) + Light Cache (secondary)
- **Sampler**: Progressive
- **Color Mapping**: Reinhard, gamma 2.2
