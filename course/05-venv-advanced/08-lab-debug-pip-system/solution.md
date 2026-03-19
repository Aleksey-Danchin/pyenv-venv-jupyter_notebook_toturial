# Эталонное решение: pip внутри venv указывает на системный

## Диагностика

### 1. Проверка pip

После активации venv:

```bash
cd ~/course-debug-pip-system
source venv/bin/activate
ls -la venv/bin/pip
which pip
```

Вывод `ls -la venv/bin/pip` покажет, что это симлинк, указывающий на системный pip (например, `/usr/bin/pip3`). Команда `which pip` вернёт путь внутри venv, но при вызове выполнится целевой файл симлинка — системный pip.

### 2. Проверка установки пакета

```bash
pip install requests
pip show requests
```

В выводе `pip show requests` поле `Location` укажет на системный site-packages, а не на `venv/lib/.../site-packages/`.

## Шаги решения

### Вариант A: Восстановление pip в venv

```bash
cd ~/course-debug-pip-system
source venv/bin/activate
rm venv/bin/pip
python -m ensurepip --upgrade
```

Или, если ensurepip не восстанавливает pip-скрипт:

```bash
python -m pip install --upgrade pip
```

После этого `venv/bin/pip` будет корректным скриптом, вызывающим pip из окружения.

### Вариант B: Пересоздание venv

```bash
cd ~/course-debug-pip-system
deactivate 2>/dev/null || true
rm -rf venv
python3 -m venv venv
source venv/bin/activate
pip install requests
```

## Ожидаемый результат

```bash
source venv/bin/activate
pip install requests
pip show requests
```

```
Name: requests
...
Location: /home/<user>/course-debug-pip-system/venv/lib/python3.x/site-packages
...
```

Путь `Location` содержит `course-debug-pip-system/venv`.

## Пояснение

Скрипт `break.sh` заменил `venv/bin/pip` на симлинк, указывающий на системный pip. При активации venv команда `pip` находилась по PATH в `venv/bin/`, но при вызове выполнялся системный pip, который устанавливает пакеты в системный Python. Восстановление корректного pip (или пересоздание venv) возвращает ожидаемое поведение.
