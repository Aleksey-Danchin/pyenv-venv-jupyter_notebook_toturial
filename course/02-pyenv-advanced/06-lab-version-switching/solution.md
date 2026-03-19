# Эталонное решение: переключение версий Python

## Подготовка

Убедитесь, что установлены минимум две версии Python через pyenv:

```bash
pyenv versions
```

Если версий недостаточно, установите:

```bash
pyenv install 3.11.7
pyenv install 3.12.0
```

## Шаги решения

### 1. Установить глобальную версию

```bash
pyenv global 3.12.0
pyenv version
```

```
3.12.0 (set by /home/user/.pyenv/version)
```

### 2. Создать директорию и установить локальную версию

```bash
mkdir -p ~/lab-versions
cd ~/lab-versions
pyenv local 3.11.7
pyenv version
```

```
3.11.7 (set by /home/user/lab-versions/.python-version)
```

### 3. Установить сессионную версию

```bash
pyenv shell 3.13.0
pyenv version
```

```
3.13.0 (set by PYENV_VERSION environment variable)
```

Сессионная версия перекрыла локальную и глобальную.

### 4. Сбросить сессионную версию

```bash
pyenv shell --unset
pyenv version
```

```
3.11.7 (set by /home/user/lab-versions/.python-version)
```

Теперь действует локальная версия.

### 5. Удалить локальную версию

```bash
rm .python-version
pyenv version
```

```
3.12.0 (set by /home/user/.pyenv/version)
```

Теперь действует глобальная версия.

## Ожидаемый результат

После выполнения всех шагов в директории `~/lab-versions`:
- `PYENV_VERSION` не задана
- Файл `.python-version` отсутствует
- `pyenv version` показывает глобальную версию с источником `~/.pyenv/version`
