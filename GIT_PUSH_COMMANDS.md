# Comandos Git para Subir Cambios

## Descripción
Este archivo contiene los comandos necesarios para subir los cambios al repositorio remoto en la rama `fox_12.1`.

## Cambios que se subirán
- ✅ `vendorsetup.sh` - Tools, addons y optimizaciones de OrangeFox
- ✅ `device.mk` - HAL de vibrador y copias de archivos
- ✅ `system.prop` - Propiedades de vibración y rendimiento
- ✅ `recovery/root/init.recovery.qcom.rc` - Configuración de vibración en el init
- ✅ `recovery/root/system/etc/vibrator_button.xml` - Patrones de vibración para botones
- ✅ `recovery/root/system/etc/vibrator_touchscreen.xml` - Patrones de vibración para pantalla

## Comandos a Ejecutar

### Opción 1: Paso a paso
```bash
# 1. Ver el estado de los cambios
git status

# 2. Agregar todos los cambios
git add -A

# 3. Hacer commit con descripción
git commit -m "Feat: Agregar todas las tools/addons de OrangeFox + Optimización de boot + Vibración

- Agregados tools y addons: FOX_ENABLE_APP_MANAGER, LPUNZIP, LZMA, SYSTEM_BASH
- Optimización de boot time: OF_FORCE_KEYMASTER_API_VERSION_23, FOX_SKIP_INSTALL_RECOVERY
- Optimizaciones de rendimiento en Dalvik VM, gráficos y thermal
- Configuración completa de vibración/haptic feedback
- Creados archivos XML de patrones de vibración
- HAL de vibrador agregada
- Propiedades de sistema optimizadas para rendimiento"

# 4. Subir a la rama fox_12.1
git push origin fox_12.1
```

### Opción 2: Todo en una línea
```bash
git add -A && git commit -m "Feat: Agregar todas las tools/addons de OrangeFox + Optimización de boot + Vibración" && git push origin fox_12.1
```

## Información de la Rama
- **Rama actual**: `fox_12.1`
- **Remoto**: `origin`
- **URL**: Se obtiene de tu configuración de git

## Verificar Configuración
```bash
# Ver usuario y email configurado
git config --global user.name
git config --global user.email

# Ver rama remota
git remote -v
```

## Notas Importantes
- ⚠️ Asegúrate de estar en la rama `fox_12.1` antes de hacer push
- ⚠️ Ten conexión a internet para subir los cambios
- ⚠️ Si es la primera vez, puede que necesites autenticación SSH o HTTPS
- ✅ Los cambios se subirán directamente al repositorio remoto

---
**Última actualización**: 2025-12-11
