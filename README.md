# Proyecto Docker PostgreSQL + pgAdmin

Este proyecto utiliza **Docker Compose** para levantar un contenedor de **PostgreSQL 14** y otro de **pgAdmin 4**, permitiendo administrar la base de datos de manera gráfica y segura.

---

## 📁 Estructura del proyecto

```
/
├─ docker-compose.yml
├─ servilimar.ddl # script para crear las tablas
├─ servilimar.dml # script para insertar datos en la tabla
├─ servilimar_backup.sql # backup de toda la bd para restaurar
└─ README.md
```

---

## ⚙️ Requisitos previos

- **Docker Desktop** instalado y en ejecución.
- Terminal con acceso a Docker (`docker` y `docker compose`).
- Git (opcional si vas a clonar el repositorio).

---

## 🚀 Pasos para levantar el entorno

### 1. Levantar los contenedores

En la terminal, navega a la carpeta del proyecto y ejecuta:

```bash
docker compose up -d
```

Esto hará lo siguiente:

- Levantar **PostgreSQL 14** en el contenedor `postgres_servilimar` (puerto `5432`).
  - **Usuario:** `ulimar`
  - **Contraseña:** `ex4men_db`
- Levantar **pgAdmin 4** en el contenedor `pgadmin_servilimar` (puerto `5050`).
  - **Email:** `usuario@servilimar.com`
  - **Contraseña:** `limar#123`

Para verificar que los contenedores estén corriendo, ejecuta:

```bash
docker ps
```

### 2. Acceder a pgAdmin

Abre tu navegador y ve a [http://localhost:5050](http://localhost:5050).

- **Email:** `usuario@servilimar.com`
- **Contraseña:** `limar#123`

### 3. Conectar PostgreSQL desde pgAdmin

1.  Click derecho en **Servers → Create → Server**.
2.  En la pestaña **General**, asigna un nombre al servidor (ej. `Postgres_Servilimar`).
3.  En la pestaña **Connection**:
    - **Host name/address:** `postgres`
    - **Port:** `5432`
    - **Username:** `ulimar`
    - **Password:** `ex4men_db`
    - Marca la casilla **Save password**.
4.  Guarda la configuración para conectar.

### 4. Crear y restaurar la base de datos

#### Crear la base de datos `servilimar`

Puedes crear la base de datos de dos maneras:

- **Desde pgAdmin:**
  1. Click derecho sobre tu servidor → **Create → Database**.
  2. Asigna el nombre `servilimar`.
  3. Guarda.

- **Desde la terminal:**
  ```bash
  docker exec -it postgres_servilimar psql -U ulimar -c "CREATE DATABASE servilimar;"
  ```

#### Restaurar el backup de la base de datos (Opcional)

```bash
docker exec -i postgres_servilimar psql -U ulimar servilimar < servilimar_backup.sql
```

---

## 🧹 Detener los contenedores

Para detener y eliminar los contenedores, redes y volúmenes creados, ejecuta:

```bash
docker compose down
```