---

```markdown
# Proyecto Docker PostgreSQL + pgAdmin

Este proyecto utiliza **Docker Compose** para levantar un contenedor de **PostgreSQL 14** y otro de **pgAdmin 4**, permitiendo administrar la base de datos de manera gráfica y segura.

---

## 📁 Estructura del proyecto

```

docker-postgres-pgadmin/
├─ docker-compose.yml
├─ scripts/
│   └─ init_db.sql        # Opcional: script para crear base de datos y tablas
└─ README.md

```

## ⚙️ 1. Requisitos previos

- **Docker Desktop** instalado y en ejecución
- Terminal con acceso a Docker (`docker` y `docker compose`)
- Git (opcional si vas a clonar el repositorio)

---

## 🐳 2. Levantar los contenedores

En la terminal, navega a la carpeta del proyecto:

```bash
cd docker-postgres-pgadmin
```

Ejecuta:

```bash
docker compose up -d
```

Esto hará lo siguiente:

- Levantar **PostgreSQL 14** en el contenedor `postgres_servilimar` (puerto `5432`)
  - Usuario: `ulimar`
  - Contraseña: `ex4men_db`

- Levantar **pgAdmin 4** en el contenedor `pgadmin_servilimar` (puerto `5050`)
  - Email: `usuario@servilimar.com`
  - Contraseña: `limar#123`

Verifica que los contenedores estén corriendo:

```bash
docker ps
```

---

## 🌐 3. Acceder a pgAdmin

Abre el navegador en:

```
http://localhost:5050
```

- **Email:** `usuario@servilimar.com`
- **Contraseña:** `limar#123`

---

## 🔗 4. Conectar PostgreSQL desde pgAdmin

1. Click derecho en **Servers → Create → Server**

2. Pestaña **General**: Nombre del servidor, ejemplo `Postgres_Servilimar`

3. Pestaña **Connection**:
   - **Host name/address:** `postgres`
   - **Port:** `5432`
   - **Username:** `ulimar`
   - **Password:** `ex4men_db`
   - Marcar **Save password**

4. Guardar y conectar ✅

---

## 🗄️ 5. Crear la base de datos `servilimar`

Puedes hacerlo desde pgAdmin:

1. Click derecho sobre tu servidor → **Create → Database**
2. Nombre: `servilimar`
3. Guardar

O desde la terminal:

```bash
docker exec -it postgres_servilimar psql -U ulimar -c "CREATE DATABASE servilimar;"
```

---

## 💾 6. restaurar backup de la base de datos (opcional)

```bash
docker exec -i postgres_servilimar psql -U ulimar servilimar < backup_servilimar.sql
```

---

## 🧹 7. Detener contenedores

```bash
docker compose down
```
