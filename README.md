## Requisitos
- Godot 4.6.2
- LimboAI 1.7.1 (incluido en el proyecto)

## Controles
- **WASD** — Moverse
- **Espacio** — Atacar
- **Ctrl** (mantener) — Guardia

## Cómo abrir el proyecto
1. Clonar el repositorio
2. Abrir Godot 4.6.2 e importar el proyecto
3. Ejecutar la escena `main.tscn` o presionar **F5** para correr la escena principal

## Arquitectura
El player usa una **FSM basada en nodos** con estados: Idle, Run, 
Attack, Hit, Guard y Dead.

Los componentes `HealthComponent`, `HitboxComponent`, `HurtboxComponent` 
y `KnockbackComponent` están desacoplados y son reutilizables — 
el player y el enemigo los comparten.

El enemigo `Soldier` usa un **Behavior Tree con LimboAI** con tres 
comportamientos: patrullar, perseguir y atacar, con cooldown entre ataques.
La navegación usa `NavigationAgent2D` con navmesh generado desde el `TileMapLayer`.
