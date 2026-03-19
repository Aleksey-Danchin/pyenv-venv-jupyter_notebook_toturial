# Эталонное решение: организация проекта

## Шаги решения

### 1. Создание директории и структуры

```bash
mkdir -p ~/lab-project-organization
cd ~/lab-project-organization
```

```bash
mkdir -p src tests
touch README.md
echo "3.11.7" > .python-version   # или ваша версия Python
```

### 2. Файл .gitignore

Создайте `.gitignore` со следующим содержимым:

```
venv/
__pycache__/
*.pyc
.pyo
.ipynb_checkpoints/
.env
*.egg-info/
dist/
build/
```

### 3. requirements.txt и requirements-dev.txt

Сначала создаём venv и заполняем requirements.txt:

```bash
pyenv local 3.11.7   # или ваша версия
python -m venv venv
source venv/bin/activate
pip install requests
pip freeze > requirements.txt
```

Затем requirements-dev.txt. Создайте файл вручную:

```
-r requirements.txt
pytest
```

Или установите pytest и зафиксируйте:

```bash
pip install pytest
pip freeze > requirements-dev.txt   # перезапишет — лучше вручную дописать pytest к requirements
```

Рекомендуемый вариант requirements-dev.txt:

```
-r requirements.txt
pytest
```

### 4. README.md

Минимальное содержимое:

```markdown
# Lab Project Organization

Учебный проект. Создан в рамках лабораторной Модуля 10.
```

### 5. Инициализация git и первый коммит

```bash
git init
git add .
git status   # проверить: venv не в списке
git commit -m "Структура проекта"
```

### 6. main.py и второй коммит

```bash
echo 'print("Hello, project!")' > src/main.py
git add src/main.py
git commit -m "Добавлен main.py"
```

### 7. Проверка

```bash
python src/main.py
# Hello, project!

python -c "import requests; print('requests OK')"
python -c "import pytest; print('pytest OK')"
```

Запустите `check.sh` из директории лабораторной (`course/10-project-practice/06-lab-project-organization/`).

## Ожидаемый результат

- Директория `~/lab-project-organization` с полной структурой
- Git-репозиторий с минимум двумя коммитами
- venv с requests и pytest
- `python src/main.py` выводит `Hello, project!`
