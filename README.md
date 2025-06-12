# Actividad 2

## Objetivos
- Implementar sitio web con HTML5/CSS3
- Demostrar flujo Git colaborativo
- Practicar resolución de conflictos

## Integrantes
Ver detalle completo en [ROLES.md](ROLES.md)

## Flujo de trabajo
1. Cada miembro trabaja en su rama específica
2. Se crean PRs a `dev` con:
   - Descripción clara
   - Capturas de pantalla (opcional)
   - Asignados revisores relevantes
3. El Líder e Integrador revisan
4. Se mergea a `dev` después de 2 aprobaciones
5. El Integrador fusiona `dev` a `main` para releases

## Estructura de archivos
- `index.html` - Estructura principal
- `styles/`
  - `main.css` - Estilos generales
  - `responsive.css` - Media queries
- `docs/`
  - `ROLES.md` - Asignación de roles

##Flujo de Trabajo Usado

El equipo siguió un flujo de trabajo basado en buenas prácticas de Git:

1. **Rama principal:**  
   - Se utilizó la rama `main` como rama principal para el proyecto estable.

2. **Ramas de desarrollo:**  
   - Se crearon dos ramas adicionales:
     - `dev`: para el desarrollo de funcionalidades generales.
     - `diseño`: para trabajar específicamente en el estilo y diseño del sitio.

3. **Commits claros y descriptivos:**  
   - Ejemplo: `"Agregar estilos básicos al header"`

4. **Pull Requests (PR):**  
   - Se realizó al menos un PR con revisión por parte de otro integrante.
   - Se documentaron los cambios realizados y se discutieron antes de hacer merge.

5. **Resolución de conflictos:**  
   - Se generó un conflicto intencional entre las ramas `diseño` y `main`, el cual fue resuelto manualmente mediante la herramienta de GitHub.

