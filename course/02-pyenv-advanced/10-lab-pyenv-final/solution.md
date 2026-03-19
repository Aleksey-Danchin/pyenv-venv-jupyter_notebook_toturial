# Эталонное решение: итоговая лабораторная по pyenv

## Шаги решения

### 1. Установить версии Python

```bash
pyenv install 3.11.7
pyenv install 3.12.0
```

Если версия уже установлена, pyenv сообщит об этом. Это нормально.

### 2. Установить глобальную версию

```bash
pyenv global 3.12.0
pyenv global
```

```
3.12.0
```

### 3. Создать директорию и установить локальную версию

```bash
mkdir -p ~/lab-pyenv-final
cd ~/lab-pyenv-final
pyenv local 3.11.7
```

### 4. Проверить локальную версию

```bash
python --version
```

```
Python 3.11.7
```

```bash
pyenv version
```

```
3.11.7 (set by /home/user/lab-pyenv-final/.python-version)
```

### 5. Проверить наследование в поддиректории

```bash
mkdir -p ~/lab-pyenv-final/subdir
cd ~/lab-pyenv-final/subdir
python --version
```

```
Python 3.11.7
```

Локальная версия наследуется из родительской директории.

### 6. Проверить глобальную версию за пределами проекта

```bash
cd ~
python --version
```

```
Python 3.12.0
```

### 7. Продемонстрировать приоритет shell

```bash
cd ~/lab-pyenv-final
pyenv shell 3.13.0
pyenv version
```

```
3.13.0 (set by PYENV_VERSION environment variable)
```

Shell-версия перекрыла local.

### 8. Сбросить shell и проверить local

```bash
pyenv shell --unset
pyenv version
```

```
3.11.7 (set by /home/user/lab-pyenv-final/.python-version)
```

### 9. Удалить .python-version и проверить global

```bash
rm ~/lab-pyenv-final/.python-version
pyenv version
```

```
3.12.0 (set by /home/user/.pyenv/version)
```

## Ожидаемый результат

После выполнения:
- `pyenv global` → `3.12.0`
- `~/lab-pyenv-final/subdir` существует
- `~/lab-pyenv-final/.python-version` отсутствует
- `PYENV_VERSION` не задана
- `pyenv version` в `~/lab-pyenv-final` → `3.12.0 (set by ~/.pyenv/version)`
