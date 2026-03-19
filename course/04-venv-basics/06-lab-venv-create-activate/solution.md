# Эталонное решение: создание, активация и деактивация venv

## Шаги решения

### 1. Выбор версии Python и переход в директорию

```bash
mkdir -p ~/course-venv-lab
cd ~/course-venv-lab
pyenv local 3.12.0
```

Или, если уже в проектной директории:

```bash
pyenv local 3.12.0
```

### 2. Создание venv

```bash
python -m venv venv
```

### 3. Активация и проверка

```bash
source venv/bin/activate
which python
which pip
```

Ожидаемый вывод:

```
/home/<user>/course-venv-lab/venv/bin/python
/home/<user>/course-venv-lab/venv/bin/pip
```

В prompt появится префикс `(venv)`.

### 4. Установка пакета

```bash
pip install requests
pip list
```

Пакет `requests` и его зависимости появятся в списке.

### 5. Деактивация

```bash
deactivate
which python
```

После деактивации `which python` снова укажет на путь из pyenv или системный.

## Ожидаемый результат

```bash
source venv/bin/activate
pip list
```

```
Package    Version
---------- -------
pip        ...
requests   ...
...
```

Окружение активно, пакеты установлены локально в venv.
