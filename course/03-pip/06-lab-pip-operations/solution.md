# Эталонное решение: pip — операции и requirements

## Шаги решения

### 1. Проверка связки pip↔Python

```bash
pyenv version
pip --version
```

или:

```bash
python -m pip --version
```

Убедитесь, что pip указывает на Python из pyenv (путь должен содержать `~/.pyenv/versions/`).

### 2. Установка пакетов

```bash
pip install requests
pip install rich==13.7.0
```

(При необходимости замените `13.7.0` на актуальную стабильную версию из PyPI.)

### 3. Формирование requirements.txt

```bash
pip freeze > requirements.txt
cat requirements.txt
```

В файле будут перечислены все установленные пакеты с версиями.

### 4. Удаление пакетов

```bash
pip uninstall -y requests rich
```

Флаг `-y` отключает интерактивное подтверждение.

### 5. Восстановление из requirements.txt

```bash
pip install -r requirements.txt
```

### 6. Проверка

```bash
pip list | grep -E "requests|rich"
python -c "import requests, rich; print('OK')"
```

## Ожидаемый результат

```bash
pip list
```

Пакеты `requests` и `rich` (с зависимостями) присутствуют в списке.

```bash
cat requirements.txt
```

Содержит строки вида:
```
requests==2.31.0
rich==13.7.0
...
```
