# 🏛️ Módulo Histórico de Gobernanza Corporativa (7 Fases & Plan de Trabajo)
**Proyecto:** TEMIS Web Platform  
**Propósito:** Resguardo técnico para posible reintegración futura.  

---

## 📌 1. ¿Qué contiene este módulo?

Antes del desacoplamiento de gobernanza hacia AppSheet, TEMIS integraba un sistema completo de **Metodología y Gobernanza de 7 Fases Corporativas**:

1. **`governance_view.py`**:
   * Visualizador y gestor del ciclo de vida del proyecto en 7 fases:
     - Fase 1: Alineación Estratégica & Charter
     - Fase 2: Diagnóstico & Entrevistas
     - Fase 3: Modelado SIPOC & Mapeo de Procesos
     - Fase 4: Documentación Word & Estándares
     - Fase 5: Validación Técnica & Auditoría
     - Fase 6: Capacitación & Despliegue
     - Fase 7: Cierre & Lecciones Aprendidas
   * Matriz RACI de responsables por fase.
   * Registro de Daily Logs / Bitácoras de sesión.

2. **`work_plan_view.py`**:
   * Cronograma interactivo de entregables con fechas límite, estados (No iniciado, En progreso, Completado, Bloqueado) y porcentajes de avance.

3. **`user_management_view.py`**:
   * Panel de administración de usuarios, roles (PM, Sponsor, Process Owner, Process Designer, Auditor) y permisos.

4. **`state_pre_decoupling.py`**:
   * Métodos de estado de Reflex que gestionan:
     - Lista de entregables por fase (`project_deliverables`).
     - Bitácoras diarias (`project_daily_logs`).
     - Auditor de Gobernanza PMO con ponderación de 7 fases (`run_governance_audit`).
     - Sincronización de avance global de proyecto.

5. **`header_pre_decoupling.py` y `workspace_sidebar_pre_decoupling.py`**:
   * Interfaz de navegación con las pestañas activas de Gobernanza y Plan de Trabajo.

---

## 🔄 2. ¿Por qué se desacopló?

Se desacopló para separar responsabilidades:
* **Gobernanza Institucional:** Se gestiona en el sistema central de la organización (AppSheet / PMO), vinculando los proyectos mediante el campo `external_governance_id` (ID Iniciativa AppSheet) en la Ficha Técnica de TEMIS.
* **TEMIS:** Quedó optimizado y enfocado al 100% como **Motor Técnico de Modelado y Documentación de Procesos** (Ficha Técnica, Matriz SIPOC, Diagrama de Flujo BPMN y Generador de Word).

---

## 🛠️ 3. Guía Paso a Paso para Reintegrarlo en TEMIS (Si se requiere en el futuro)

Si en el futuro el equipo técnico o la dirección decide que TEMIS vuelva a incluir las vistas de Gobernanza y Plan de Trabajo directamente en la app web:

### Paso 1: Copiar los Componentes de Vista
Copiar desde esta carpeta hacia `temis_web/components/`:
* `governance_view.py` ➔ `temis_web/components/governance_view.py`
* `work_plan_view.py` ➔ `temis_web/components/work_plan_view.py`
* `user_management_view.py` ➔ `temis_web/components/user_management_view.py`

### Paso 2: Habilitar las Vistas en el Router Principal (`temis_web/temis_web.py`)
En el archivo `temis_web/temis_web.py`, agregar las condiciones de renderizado para `active_view == "governance"` y `active_view == "work_plan"`:
```python
rx.cond(
    FlowState.active_view == "governance",
    governance_view(),
    rx.cond(
        FlowState.active_view == "work_plan",
        work_plan_view(),
        # ... resto de las vistas
    )
)
```

### Paso 3: Reactivar los Botones de Navegación
En `temis_web/components/header.py` y `temis_web/components/workspace_sidebar.py`:
* Descomentar o añadir los botones para cambiar `active_view` a `"governance"` y `"work_plan"`.
* (Puedes consultar `header_pre_decoupling.py` y `workspace_sidebar_pre_decoupling.py` para ver el diseño exacto).

### Paso 4: Restaurar las Variables de Estado
En `temis_web/state.py`:
* Importar o reactivar las variables de lista de entregables (`project_deliverables`), bitácoras (`project_daily_logs`) y métodos auxiliares de cálculo de avance disponibles en `state_pre_decoupling.py`.

---

## 💾 4. Respaldo en Git
Para mayor seguridad, este estado previo también se encuentra preservado como rama de Git en el repositorio maestro:
* **Rama Git:** `backup/pre-decoupling-governance`
