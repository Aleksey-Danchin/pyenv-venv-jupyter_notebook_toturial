# Эталонное решение: venv + pyenv, requirements и множественные окружения

## Шаги решения

### 1. Создание директории и настройка pyenv

```bash
mkdir -p ~/lab-venv-advanced
cd ~/lab-venv-advanced
pyenv local 3.11.7
```

(Используйте любую установленную версию 3.11, например 3.11.5, 3.11.12 — проверьте через `pyenv versions`.)

### 2. Создание первого окружения и установка пакетов

```bash
python -m venv venv
source venv/bin/activate
pip install requests rich
pip freeze > requirements.txt
deactivate
```

### 3. Создание второго окружения и воспроизведение

```bash
python -m venv venv-alt
source venv-alt/bin/activate
pip install -r requirements.txt
deactivate
```

### 4. Проверка

```bash
source venv/bin/activate
pip list | grep -E "requests|rich"
deactivate

source venv-alt/bin/activate
pip list | grep -E "requests|rich"
deactivate
```

## Ожидаемый результат

В обоих окружениях `requests` и `rich` (и их зависимости) установлены. Файл `requirements.txt` содержит строки вида:

```
requests==2.31.0
rich==13.7.0
...
```

Файл `.python-version` содержит `3.11.7` (или выбранную версию). Директории `venv/` и `venv-alt/` содержат полные виртуальные окружения.
