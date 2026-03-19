# Эталонное решение: Финальная лабораторная — полный цикл

## Шаги решения

### Фаза 1: инициализация

```bash
mkdir -p ~/m11-final-project
cd ~/m11-final-project
pyenv install 3.12.5   # если ещё не установлена
pyenv local 3.12.5
python -m venv venv
source venv/bin/activate
```

### Фаза 2: зависимости

```bash
pip install jupyter ipykernel requests
pip freeze > requirements.txt
```

Создать `.gitignore`:
```
venv/
__pycache__/
.ipynb_checkpoints/
*.pyc
```

### Фаза 3: Jupyter

```bash
python -m ipykernel install --user --name m11-final --display-name "Python (m11-final)"
jupyter kernelspec list   # проверить
```

### Фаза 4: воспроизведение

```bash
deactivate
jupyter kernelspec remove m11-final
rm -rf venv/

python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python -m ipykernel install --user --name m11-final --display-name "Python (m11-final)"
```

## Ожидаемый результат

- `python -c "import requests; print('OK')"` → OK
- `jupyter kernelspec list` → m11-final в списке
- `.python-version`, `requirements.txt`, `.gitignore` присутствуют
