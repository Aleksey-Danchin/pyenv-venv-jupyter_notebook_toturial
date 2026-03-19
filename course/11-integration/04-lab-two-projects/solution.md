# Эталонное решение: Два проекта одновременно

## Шаги решения

### Проект A (Python 3.11.x)

1. Создать директорию и задать версию Python:
   ```bash
   mkdir -p ~/m11-proj-a && cd ~/m11-proj-a
   pyenv install 3.11.7  # если ещё не установлена
   pyenv local 3.11.7
   ```
2. Создать venv и установить пакеты:
   ```bash
   python -m venv .venv
   source .venv/bin/activate
   pip install jupyter ipykernel requests
   pip freeze > requirements.txt
   ```
3. Зарегистрировать ядро:
   ```bash
   python -m ipykernel install --user --name=m11-proj-a --display-name="Python (m11-proj-a)"
   deactivate
   ```

### Проект B (Python 3.12.x)

1. Создать директорию и задать версию Python:
   ```bash
   mkdir -p ~/m11-proj-b && cd ~/m11-proj-b
   pyenv install 3.12.5  # если ещё не установлена
   pyenv local 3.12.5
   ```
2. Создать venv и установить пакеты:
   ```bash
   python -m venv .venv
   source .venv/bin/activate
   pip install jupyterlab ipykernel rich
   pip freeze > requirements.txt
   ```
3. Зарегистрировать ядро:
   ```bash
   python -m ipykernel install --user --name=m11-proj-b --display-name="Python (m11-proj-b)"
   deactivate
   ```

### Проверка

```bash
cd ~/m11-proj-a && pyenv version
cd ~/m11-proj-b && pyenv version
jupyter kernelspec list
```

## Ожидаемый результат

- В каждой директории `pyenv version` показывает соответствующую версию.
- Оба ядра m11-proj-a и m11-proj-b видны в `jupyter kernelspec list`.
- В проекте A: `import requests` работает.
- В проекте B: `import rich` работает.
