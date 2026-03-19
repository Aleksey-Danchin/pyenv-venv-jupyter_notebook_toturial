# Эталонное решение: сломанный venv (удалена версия Python из pyenv)

## Диагностика

### 1. Проверка pyvenv.cfg

```bash
cat ~/course-debug-broken-venv/venv/pyvenv.cfg
```

Пример вывода:

```
home = /home/<user>/.pyenv/versions/3.11.7/bin
include-system-site-packages = false
version = 3.11.7
```

Путь `home` указывает на версию Python, установленную через pyenv.

### 2. Проверка существования базового Python

```bash
ls -la ~/.pyenv/versions/3.11.7
```

Директория отсутствует — версия была удалена через `pyenv uninstall`. Симлинки в `venv/bin/` указывают на несуществующие файлы.

## Шаги решения

### Вариант A: Восстановление версии Python

Если venv был создан от версии 3.11.7:

```bash
pyenv install 3.11.7
```

После установки путь `~/.pyenv/versions/3.11.7` снова существует. venv использует симлинки на этот путь, поэтому окружение должно заработать без пересоздания:

```bash
cd ~/course-debug-broken-venv
source venv/bin/activate
python --version
```

### Вариант B: Пересоздание venv от другой версии

Если вы не хотите устанавливать удалённую версию заново, можно использовать другую установленную версию:

```bash
cd ~/course-debug-broken-venv
pyenv local 3.12.0   # или любая другая установленная версия
rm -rf venv
python -m venv venv
source venv/bin/activate
```

## Ожидаемый результат

```bash
cd ~/course-debug-broken-venv
source venv/bin/activate
python --version
pip list
```

Активация проходит успешно, `python --version` показывает версию, `pip list` работает.

## Пояснение

venv хранит в `pyvenv.cfg` путь к базовому Python и создаёт симлинки на интерпретатор и скрипты. Если базовый Python удалён (например, через `pyenv uninstall`), симлинки ведут в никуда. Решение — снова установить ту же версию через pyenv, чтобы восстановить целевые файлы симлинков, либо пересоздать venv от другой версии Python.
